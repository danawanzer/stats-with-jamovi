# (APPENDIX) Appendices {-}

# Answers to Your Turn exercises

### Answers to 5.3 Power {.unlisted .unnumbered}

In the following table, determine where each of the pieces should go. Note that we have six things to populate but only four cells: each cell must contain at least one of the six things. Think critically here before testing your answers!

|                                                    | H~0~ is true | H~1~ is true |
|----------------------------------------------------|:------------:|:------------:|
| ***p*** **\< .05** (statistically significant)     |      A       |      B       |
| ***p*** **\> .05** (statistically non-significant) |      C       |      D       |

Which cell should each of the following items go?

1.  alpha (answer = A)
2.  power (answer = B)
3.  type I error (answer = A)
4.  Type II error (answer = D)
5.  Correct inference (answer = B & C)

------------------------------------------------------------------------

Let's see what happens when we both increase power AND decrease alpha. Fill out the table on your own. When we assume the null and alternative hypotheses are 50% likely each, and we set our alpha to 1% and our power to 95%, how much more likely is it that the alternative hypothesis is true than the null hypothesis is true? (answer = 95 times more likely!)

### Answers to 7.1 one-sample t-test {.unlisted .unnumbered}

1.  **Do the students in our dataset have a higher Writing score than than the passing score? (*M* = 70)?**

    -   Should you use a one-tailed or two-tailed hypothesis? (answer = one-tailed)

    -   Which statistic should you use based on your assumptions? (answer = Wilcoxon rank one sample t-test)

    -   Do the students in our dataset have a higher Writing score than than the passing score? (answer = yes)

2.  **Do the students in our dataset have the same national average height of college students (*M* = 68 inches)?**

    -   Should you use a one-tailed or two-tailed hypothesis? (answer = two-tailed)

    -   Which statistic should you use based on your assumptions? (answer = student one sample t-test)

    -   Do the students in our dataset have the same national average height of college students)? (answer = no)

### Answers to 7.2 independent samples t-test {.unlisted .unnumbered}

1.  **Does height differ by gender (Gender: male = 0, female = 1)?**

    -   Should you use a one-tailed or two-tailed hypothesis? (answer = two-tailed)

    -   Which statistic should you use based on your assumptions? (answer = Mann Whitney U)

    -   Does height differ by gender? (answer = yes)

2.  **Do athletes (Athlete: athletes = 1, non-athlete = 0) have faster sprint times than non-athletes?**

    -   Should you use a one-tailed or two-tailed hypothesis? (answer = one-tailed)

    -   Which statistic should you use based on your assumptions? (answer = Mann Whitney U)

    -   Do athletes have faster sprint times than non-athletes? (answer = yes)

3.  **Do students who live on campus (LiveOnCampus: on campus = 1, off campus = 0) have higher English scores than students who live off campus?**

    -   Should you use a one-tailed or two-tailed hypothesis? (answer = one-tailed)

    -   Which statistic should you use based on your assumptions? (answer = Welch t-test)

    -   Does students who live on campus have higher English scores? (answer = no)

4.  **Does athletic status relate to math scores?**

    -   Should you use a one-tailed or two-tailed hypothesis? (answer = two-tailed)

    -   Which statistic should you use based on your assumptions? (answer = independent t-test)

    -   Does athletic status relate to math scores? (answer = yes)

### Answers to 7.3 dependent t-test {.unlisted .unnumbered}

**Note**: Technically, none of our data is suitable for a dependent t-test in this dataset. We will pretend that the four test score variables (`English`, `Reading`, `Math`, and `Writing`) are really four measurements of the same underlying test. In reality, we would analyze this data using correlation.

1.  **Do students perform better on the English test than they do the Writing test?**

    -   Should you use a one-tailed or two-tailed hypothesis? (answer = one-tailed)

    -   Which statistic should you use based on your assumptions? (answer = dependent t-test)

    -   Do students perform better on the English test than they do the Writing test? (answer = yes)

2.  **Does students' English scores relate to their Reading scores?**

    -   Should you use a one-tailed or two-tailed hypothesis? (answer = two-tailed)

    -   Which statistic should you use based on your assumptions? (answer = dependent t-test)

    -   Does students' English scores relate to their Reading scores? (answer = no)

### Answers to 8.1 goodness of fit test {.unlisted .unnumbered}

1.  **Are there equal numbers of athletes and non-athletes?** (`Athlete` variable)

    -   Do you meet the assumptions? (answer = yes)

    -   Are the observed frequencies similar to the expected frequencies? (answer = no)

    -   What is your chi-square value, rounded to two decimal places? (answer = 10.32)

2.  **I happen to know the school this data comes from has 40% athletes and 60% non-athletes. Does our data match the school population?**

    -   Change your Expected Proportions ratio to .6 for non-athletes and .4 for athletes.

    -   Are the observed frequencies similar to the expected frequencies? (answer = yes)

    -   What is your chi-square value, rounded to two decimal places? (answer = .96)

3.  **Are there equal numbers of freshmen, sophomores, juniors, and seniors?** (`Rank` variable)

    -   Do you meet the assumptions? (answer = yes)

    -   Are the observed frequencies similar to the expected frequencies? (answer = no)

    -   What is your chi-square value, rounded to two decimal places? (answer = 33.94)

### Answers to 8.2 chi-square test of independence {.unlisted .unnumbered}

1.  **Is Athlete related to Gender?**

    -   Do you meet the assumptions? (answer = yes)

    -   Which test should you perform? (answer = chi-square)

    -   Are the observed frequencies similar to the expected frequencies? (answer = no)

    -   What is your chi-square value, rounded to two decimal places? (answer = 8.45)

2.  **Is Gender related to Rank?**

    -   Do you meet the assumptions? (answer = yes)

    -   Which test should you perform? (answer = chi-square)

    -   Are the observed frequencies similar to the expected frequencies? (answer = yes)

    -   What is your chi-square value, rounded to two decimal places? (answer = .61)

### Answers to 9.1 one-way ANOVA {.unlisted .unnumbered}

1.  **Does students differ on English scores by rank (i.e., freshmen, sophomore, junior, senior)?**

    -   Do you satisfy the assumption of normality? (answer = yes)

    -   Do you satisfy the assumption of homogeneity of variance? (answer = yes)

    -   Which statistic should you use? (answer = one-way ANOVA)

    -   Do students differ on English scores by rank? (answer = no)

2.  **Does smoking status (Smoking: Nonsmoker = 0, Past smoker = 1, Current smoker = 2) relate to sprint time?**

    -   Do you satisfy the assumption of normality? (answer = no)

    -   Do you satisfy the assumption of homogeneity of variance? (answer = yes)

    -   Which statistic should you use? (answer = Kruskal-Wallis test)

    -   Does smoking status relate to sprint time? (answer = yes)

### Answers to 9.2 finding group differences {.unlisted .unnumbered}

1.  **Does students differ on English scores by rank (i.e., freshmen, sophomore, junior, senior)?**

    -   Perform Tukey's post hoc tests. What are the results of the post hoc comparison? (answer = trick question! you wouldn't perform them because the F-test is not significant)

2.  **Does smoking status (Smoking: Nonsmoker = 0, Past smoker = 1, Current smoker = 2) relate to sprint time?**

    -   Perform Tukey's post hoc tests. What are the results of the post hoc comparison? (answer = Nonsmokers had significantly faster sprint times than current smokers)

### Answers to 9.3 repeated measures ANOVA {.unlisted .unnumbered}

1.  **Does students differ on their test scores (English, Reading, Math, Writing)?**

    -   Based on your understanding of the nature of the test scores, which statistic should you use? (answer = repeated measures ANOVA)

    -   Should you apply a sphericity correction? If so, which one? (answer = yes, Huynh-Feldt)

    -   Do students differ on their test scores? (answer = yes)

    -   Should you perform a planned contrast or post hoc comparison? (answer = yes)

    -   What are the results of the post hoc comparison?

### Answers to 10.1 correlation {.unlisted .unnumbered}

1.  **Are there significant correlations among the four tests (English, reading, math, writing)?**

    -   Do you meet the assumption of normality for all four tests? (answer = yes for all but maybe not writing)

    -   Do you meet the assumption of linearity for all four tests? (answer = yes)

    -   Are the four tests significantly correlated among each other? (answer = yes)

    -   Round your answers to two decimal places:

        -   What is the correlation between reading and math? (answer = .52)

        -   What is the correlation between writing and reading? (answer = .11)

        -   What is the correlation between writing and English? (answer = .37)

### Answers to 10.2 regression {.unlisted .unnumbered}

1.  **Perform a multiple regression examining how `English`**, **`Reading` and `Writing`, as well as `Gender` relate to the dependent variable `Math`.**

    -   Do you have any significant outliers? (answer = no)

    -   Are your residuals normally distributed? (answer = yes)

    -   Do you satisfy the assumption of linearity and homoscedasticity of your residuals (just check the Fitted residual plot)? (answer = yes)

    -   Do you meet the assumption of independent residuals? (answer = yes)

    -   Do you meet the assumption of no multicollinearity? (answer = yes)

    -   Can you perform a regression with this data? (answer = yes)

    -   What is your adjusted R-squared, rounded to two decimal places? (answer = .31)

    -   Is the overall model statistically significant? (answer = yes)

    -   Is `English` statistically significant? (answer = no)

    -   Is `Reading` statistically significant? (answer = yes)

    -   Is `Writing` statistically significant? (answer = yes)

    -   Is `Gender` statistically significant? (answer = yes)

    -   For `Gender`, do male (Gender = 0) or female (Gender = 1) students have higher math scores? (answer = male)
