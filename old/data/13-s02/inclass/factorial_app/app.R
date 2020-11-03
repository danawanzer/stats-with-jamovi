library("shiny")
library("tidyverse")

## Define UI for application that draws a histogram
ui <- fluidPage(

  ## Application title
  titlePanel("Main Effects and Interactions: 2x2 Factorial"),

  ## Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("int", "Intercept:",
                  min = -10L, max = 10L,
                  value = 0L, step = 1L),
      sliderInput("A", "Main Effect of A:",
                  min = -20L, max = 20L,
                  value = 0L, step = 2L),
      sliderInput("B", "Main Effect of B:",
                  min = -20L, max = 20L,
                  value = 0L, step = 2L),
      sliderInput("AB", "AB Interaction:",
                  min = -80L, max = 80L,
                  value = 0L, step = 4L),
      actionButton("reset", "Reset")
    ),

    ## Show a plot of the generated distribution
    mainPanel(
      plotOutput("ixplot", height = "200px", width = "35%"),
      h3("Cell and Marginal Means"),
      tableOutput("cmeans"),
      h3("Decomposition of Cell Means"),
      tableOutput("dmx")
    )
  )
)

## Define server logic required to draw a histogram
server <- function(input, output, session) {

  dmx <- reactive({
    tibble(A = rep(c("A1", "A2"), each = 2),
           B = rep(c("B1", "B2"), times = 2),
           i = rep(1:2, each = 2),
           j = rep(1:2, times = 2),
           intercept = input$int,       
           A_i = rep(c(as.integer(input$A / 2L),
                       as.integer(-input$A / 2)), each = 2),
           B_j = rep(c(as.integer(input$B / 2),
                       as.integer(-input$B / 2)), times = 2),
           AB_ij = c(as.integer(input$AB / 4),
                     as.integer(-input$AB / 4),
                     as.integer(-input$AB / 4),
                     as.integer(input$AB / 4)),
           Y_ij = intercept + A_i + B_j + AB_ij) %>%
      select(i, j, A, B, Y_ij, everything())
  })
  
  observeEvent(input$reset, {
    updateSliderInput(session, "int", value = 0L)
    updateSliderInput(session, "A", value = 0L)
    updateSliderInput(session, "B", value = 0L)
    updateSliderInput(session, "AB", value = 0L)
  })
  
  output$ixplot <- renderPlot({
    ggplot(dmx(), aes(A, Y_ij, color = B,
                      linetype = B, shape = B, group = B)) +
      geom_point(size = 3, alpha = .5) +
      geom_line(alpha = .5) +
      coord_cartesian(ylim = c(-35, 35))
  })
  
  output$cmeans <- renderTable({
    a_means <- dmx() %>%
      group_by(A) %>%
      summarise(`  ` = as.integer(mean(Y_ij))) %>%
      select(-A)

    b_means <- dmx() %>%
      group_by(B) %>%
      summarise(b = as.integer(mean(Y_ij))) %>%
      spread(B, b) %>%
      mutate(` ` = "", `  ` = NA_integer_) %>%
      select(` `, B1, B2, `  `)
    
    dmx() %>%
      select(A, B, Y_ij) %>%
      spread(B, Y_ij) %>%
      rename(` ` = A) %>%
      bind_cols(a_means) %>%
      bind_rows(b_means)
  })

  output$dmx <- renderTable({
    dmx() %>% select(-A, -B)
  })
}

## Run the application
shinyApp(ui = ui, server = server)
