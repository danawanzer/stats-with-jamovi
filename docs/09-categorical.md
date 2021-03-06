# (PART) Categorical Data Analysis {.unnumbered}

# Categorical Data Analysis



## What is categorical data analysis?

Simply, categorical data analysis is data analysis with categorical data. It's usually nominal data, although there are a couple tests we may use with ordinal data.

## Assumptions

All of our categorical data analyses have the following assumptions:

1.  **Expected frequencies are sufficiently large**, which is usually greater than 5. If you violate this assumption, you can use Fisher's exact test.

2.  **Data are independent of one another**, meaning each case contributes to only one cell of the table. If you violate this assumption, you may be able to use the McNemar test.

## What types of categorical data analyses are there?

We're going to cover the following categorical data analyses (there are more, but these are all we'll focus on):

1.  $\chi^2$ **goodness-of-fit**: used with one variable to find if the observed frequencies match the expected frequencies

2.  $\chi^2$ **test of independence (or association)**: used with two variables to find if the observed frequencies match the expected frequencies. In other words, are the two nominal variables independent or associated with one another?

    1.  **Fisher's exact test**: This is an alternative to the $\chi^2$test of independence that we use when our frequencies are small.

    2.  **McNemar's test**: This is an alternative to the $\chi^2$test of independence that we have a 2x2 repeated-measures design. For example, perhaps we examine pass/fail rates before and after a training.

Notice how we don't have an assumption about a normal distribution. For that reason, these are all *non-parametric statistics*.

## What is the effect size for categorical data analysis?

We typically report Cramer's V statistic. It's pretty simple to calculate, but jamovi will calculate it for us with the chi-square test of independence:

$V = \sqrt{\frac{\chi^2}{N(k-1)}}$
