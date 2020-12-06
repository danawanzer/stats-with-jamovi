# (PART) Correlation {.unnumbered}

# Correlation



## What is correlation?

Correlation (r) tests the relationship between two variables, which are usually continuous (i.e., ratio or interval) variables. The relationship between those two variables could be *positively related*, *negatively related*, or *not related at all*.

\begin{warning}
Remember that correlation does not always equal causation!
\end{warning}

We will learn about other types of correlations, but mainly we are interested in the Pearson product moment correlation, which is often just called the Pearson correlation or just correlation. Other correlations are generally referred to by their specific name.

The strength of the correlation is determined by how closely the dots in the scatterplot matrix fit on the regression line. Correlations are really *standardized covariances*. [Covariance]{.ul} is the extent to which the deviation of one variable from its mean matches the deviation of the other variable from its mean. We then standardize the covariance into the correlation which ranges from -1 to +1. Because correlations are standardized, they are considered effect sizes! Commonly, we describe values of ±.1 as a small effect size, ±.3 as medium, and ±.5 as large.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/08-correlation/correlation-examples} 

}

\caption{Scatter plots & correlation examples}(\#fig:unnamed-chunk-2)
\end{figure}

\begin{try}
Try your hand at guessing the correlation coefficient! Play at
www.guessthecorrelation.com
\end{try}

\begin{try}
Another fun website to play around with is the interactive visualization
website Interpreting Correlations by Kristoffer Magnusson. You can play
around with what data looks like at various correlations.
\url{https://rpsychologist.com/correlation/}
\end{try}

## Data set-up

To conduct the correlation we first need to ensure our data is set-up properly in our dataset. This requires having two columns, one for each of our continuous variables. Each row is a unique participant or unit of analysis. Here's what example data may look like if we were testing the correlation between individual's SAT and ACT scores;

| ID  | SATScore | ACTScore |
|:----|---------:|---------:|
| 1   |     1347 |       34 |
| 2   |      957 |        8 |
| 3   |     1247 |       31 |
| 4   |      975 |       11 |
| 5   |     1304 |       33 |
| 6   |     1169 |       16 |
| 7   |      930 |        8 |
| 8   |     1038 |       13 |
| 9   |      990 |       12 |
| 10  |     1043 |       14 |

: Example data for correlations

## The math behind the correlation

\begin{info}
If the math below makes your eyes glaze over, you can skip it. This is
presented for those who find it useful to understand the math behind the
statistics to help understand what's happening.
\end{info}

Remember back to our equation for variance ($s^2$):

$variance (x) = \frac{\sum(x_i-\bar{x})^2}{N - 1} = \frac{\sum(x_i-\bar{x})(x_i-\bar{x})}{N - 1}$

The variance is for a single variance, whereas the covariance is for two variables (co-variance). Therefore, we can modify our equation slightly to get to our covariance (cov):

$cov(x,y) = \frac{\sum(x_i-\bar{x})(y_i-\bar{y})}{N - 1}$

Let's visualize our example data above. The horizontal line is our mean for each of the variables ($\bar{x}$ and $\bar{y}$) and the vertical lines are our deviations (($x_i - \bar{x}$) and ($y_i - \bar{y}$).

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{08-correlation_files/figure-latex/unnamed-chunk-6-1} 

}

\caption{**CAPTION THIS FIGURE!!**}(\#fig:unnamed-chunk-6)
\end{figure}

We can then calculate our covariance:

$cov(SAT,ACT) = \frac{\sum(x_i-\bar{x})(y_i-\bar{y})}{N - 1}$

$cov(SAT,ACT) = \frac{(1347-1100)(34-18) + (957-1100)(8-18) + \ldots + (990-1100)(12-18)(1043-1100)(14-18)}{10 - 1}$

$cov(SAT,ACT) = \frac{(247)(16) + (-143)(-10) + \ldots + (-110)(-6) + (-57)(-4)}{9}$

$cov(SAT,ACT) = \frac{3452 + 1430 + \ldots + 660 + 228}{9} \frac{13988}{9} = 1554.222$

The problem with the covariance is that it depends on the scales of measurement used. It's not a *standardized* scale. To standardize our covariance into our correlation, we need to divide our covariance by the product of our standard deviations ($s_{SAT}$ = 153.898, $s_{ACT}$ = 10.435):

$r = \frac{cov_{xy}}{s_x s_y} = \frac{1554.222}{153.898 *10.435} = .968$

Therefore, we can see there is a strong, positive correlation between SAT and ACT scores in our sample.

You might be asking, "But what's the p-value?" For that, we need to convert our *r* into a *t*-score:

$t_r = \frac{r \sqrt{N-2}}{\sqrt{1-r^2}} = \frac{.968 \sqrt{8}}{\sqrt{1-.9409}} = \frac{2.737}{.243} = 11.26$

We can then look up our *t*-score on our critical *t* table to find our p-value based on df = N-2.

**Practice**: Is the correlation coefficient of .5 with N=30 statistically significant? <select class='solveme' data-answer='["yes"]'> <option></option> <option>yes</option> <option>no</option></select>[^correlation-1]

[^correlation-1]: If you do your calculation correctly, you should get a $t_r$ = 3.06. In the *t* table for a two-tailed *p*-value of .05 and degrees of freedom of 28 (N-2), the critical *t* value is 2.048. Our *t*-value of 3.06 is greater than the critical *t*-value of 2.048, so we can say it is statistically significant (*p* \< .05).

## Assumptions

The Pearson correlation has the three following assumptions:

1.  Both variables are **normally distributed**

2.  Both variables are measured at the **interval or ratio** (i.e., continuous) level (however, we will see what we can do if we violate this)

3.  The relationship between the two variables is **linear**

We test for normal distribution using the Exploration-Descriptives analysis in jamovi, looking at Shapiro-Wilk's test, the Q-Q plot, a histogram or density plot, and skew and kurtosis z-scores.

The third assumption requires looking at a scatterplot of one variable on the x-axis and the other variable on the y-axis.

## Performing the correlation in jamovi

Let's run an example with data from lsj-data. Open data from your Data Library in "lsj-data". Select and open "parenthood". This dataset measures a new mother's[^correlation-2] daily grumpiness very precisely, on a scale from 0 (not at all grumpy) to 100 (extremely grumpy). In addition, I am also tracking her sleeping patterns and her son's sleeping patterns across 100 days.

[^correlation-2]: The dataset built into jamovi says the person's name is Dan, but they now go by Danielle. You can follow her on Twitter at [\@djnavarro](https://twitter.com/djnavarro).

1.  First, you'll need to check your assumption of normality *outside* of the correlations analysis. Go to Explorations and choose Descriptives and check whether you meet the assumption of normality.

2.  To perform a correlation, go to Regression and select Correlation Matrix.

3.  Move all four variables into the dialogue box on the right (`dan.sleep`, `baby.sleep`, `day`, and `dan.grump`).

4.  Select Pearson under Correlation Coefficients. We'll go over the other two later.

5.  Under Additional Options, select `Report significance`, `Flag significant correlations`, and, if you have missing data, `N` (we don't have missing data so we can ignore this).

6.  Under Plot, select `Correlation matrix`. Alternatively, you can ask for `Densities for variables` to see the density plots for each variable and `Statistics` to have the correlation coefficient added to the plot.

When you are done, your setup should look like this

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{images/08-correlation/correlation-setup} 

}

\caption{Correlation setup in jamovi}(\#fig:unnamed-chunk-7)
\end{figure}

## Checking assumptions in jamovi

### Testing normality

By now we've had a lot of practice testing for normality. One of our data points (`day)` is strange because it's just a linear number 1-100, so we can ignore it. The Q-Q plot for `dan.sleep` looks a bit iffy, but the density plot, skew, kurtosis, and Shapiro-Wilk's tests look fine. We will say we met the assumption of normality. Below, you can see our density plots in the diagonal of our scatterplot matrix.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/08-correlation/correlation-plots} 

}

\caption{Testing linearity in jamovi}(\#fig:unnamed-chunk-8)
\end{figure}

### Testing linearity

There's nothing we can do here except look out our correlations! Do the underlying data in any of the scatterplots look like there is actually a non-linear (e.g., curvilinear) relationship? If so, you fail to meet this assumption.

The scatterplots above do not suggest a non-linear relationship, so we meet the assumption of linearity.

## Interpreting results

Once we are satisfied we have satisfied the assumptions for the correlation, we can interpret our results.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/08-correlation/correlation-matrix} 

}

\caption{Correlation results in jamovi}(\#fig:unnamed-chunk-9)
\end{figure}

It looks like three of the variables are significantly (*p* \< .05) correlated with each other: `dan.sleep`, `baby.sleep`, and `dan.grump`. `day` does not seem to be significantly correlated with any of the other three variables.

We can write up our results in APA something like this:

> Dan's grumpiness (*M* = 63.71, *SD* = 10.05) is negatively correlated with both Dan's quality of sleep (*M* = 6.97, *SD* = 1.02; *r* = -.90, *p* \< .001) and the baby's quality of sleep (*M* = 8.05, *SD* = 2.07; *r* = -.57, *p* \< .001). Furthermore, Dan's and the baby's quality of sleep are positively correlated (*r* = .63, *p* \< .001).

## R-Squared

The cool thing about the correlation is that we can square $r$ to get $r^2$, which is the percentage of variance overlap. It is the percentage of variance in one variable that is shared by the other. You simply square the $r$ correlation coefficient to find the $r^2$. For example, our correlation above between Dan's grumpiness and Dan's quality of sleep is $r$ = -.90; therefore, its $r^2$ = .81 or 81%. 81% of the variance in Dan's grumpiness can be explained by Dan's quality of sleep!

## What if I violate the assumptions?

If you violate any of the three assumptions, you can choose to perform Spearman's rank correlation instead of a Pearson correlation. Both Spearman's rho and Kendall's tau are non-parametric statistics based on rank order. To perform Spearman's correlation, change the check mark in jamovi from Pearson to Spearman. You will interpret just the same; however, instead of using the letter *r* you can either use $r_s$, $r_{spearman}$, or $\rho$ (the Greek letter rho).

What about Kendall's tau? It will likely give you the same results as Spearman's rho but it is interpreted slightly differently. We won't use it in this class.

## Comparing strengths of correlations

Sometimes you want to compare two correlations to find out if one correlation is significantly stronger than another. You can use this calculator to calculate the p-value: [Testing the Significance of Correlations](https://www.psychometrica.de/correlation.html)

Note that you use \#1 (Independent Samples) when the correlations come from different samples and \#2 (Dependent Samples) when the correlations come from the same sample. For example, to compare the correlation between English and Reading to the correlation between English and Writing, you would use \#2 (Dependent Samples). But to compare the correlations between English and Reading for men and women, you would use \#1 (Independent Samples).

Let's try them both with our [Sample_Dataset_2014.xlsx](https://github.com/danawanzer/stats-with-jamovi/blob/master/data/Sample_Dataset_2014.xlsx).

1.  **Comparison of correlations from independent samples**

We want to test the correlations between English and Reading for men and women. We first need to gather those correlations in jamovi. We can do this through **filters**.

Let's first find the correlation for men. Go to the Data tab in jamovi, click Filters, and enter in the $\int_x$ = Gender == 0. Next, go to the Analyses tab in jamovi, click Regression, and choose Correlation Matrix. Move our two variables over (`English` and `Reading`) and check the box for `N`. You should get *r* = .36, *p* \< .001, *n* = 181.

Now let's find the correlation for women. Go back to the Data tab in jamovi, click Filters, and change the equation to $\int_x$ = Gender == 1. Your results should automatically update because the filter changed. For women, you should get *r* = .33, *p* \< .001, *n* = 210.

Now we can compare the correlations in [Testing the Significance of Correlations - Independent Samples](https://www.psychometrica.de/correlation.html#independent). In Correlation 1, put 181 in the n column and .36 in the r column. In Correlation 2, put 210 in the n column and .33 in the r column. The results are shown below. The z-score is not statistically significant (*p* = .369) so there is no significant difference in correlation strength.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/08-correlation/compare-correlations-independent} 

}

\caption{Comparison of correlations from independent samples}(\#fig:unnamed-chunk-10)
\end{figure}

2.  **Comparison of correlations from dependent samples**

Now let's test whether the correlation between English and Reading differs from the correlation between English and Writing.

Notice how we have three tests we are comparing: (1) English, (2) Reading, and (3) Writing. We can't use this test if we are testing the correlation between variables A and B and the correlation between variables C and D. There needs to be overlap.

If you still have your filter on in your dataset from the previous analysis, turn it off. Go to the Data tab, click Filters, and either select the X to delete it or toggle the active button so it's turned off. Return to your Correlation Matrix results and click on it to edit it. Add Writing to the box.

However, we have a problem! The [Testing the Significance of Correlations - Dependent Samples](https://www.psychometrica.de/correlation.html#dependent) webpage (\#2) wants a single N, but our correlation matrix has different Ns because of missing data. What can we do? We need to chain filters! Go back to your Data tab, click Filters, and add three filters like below (note: this is how you can get *listwise deletion* in jamovi):

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/08-correlation/correlation-filters} 

}

\caption{Advanced filters}(\#fig:unnamed-chunk-11)
\end{figure}

Our correlation matrix should have automatically updated and all the N's equal 370. Great! We now have all the information we need to input into our [Testing the Significance of Correlations](https://www.psychometrica.de/correlation.html) webpage, \#2. For n we input 370. For $r_{12}$ we enter the correlation between (1) English and (2) Reading. For $r_{13}$ we enter the correlation between (1) English and (3) Writing. For $r_{23}$ we enter the correlation between (2) Reading and (3) Writing. Our z-score is not statistically significant (*p* = .213) so there is no significant difference in the correlation between English and Reading (*r* = .32) with the correlation between English and Writing (*r* = .37).

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/08-correlation/compare-correlations-dependent} 

}

\caption{Comparison of correlations from dependent samples}(\#fig:unnamed-chunk-12)
\end{figure}

## Your turn!

Open the `Sample_Dataset_2014.xlsx` file that we will be using for all Your Turn exercises. You can find the dataset here: [Sample_Dataset_2014.xlsx Download](https://github.com/danawanzer/stats-with-jamovi/blob/master/data/Sample_Dataset_2014.xlsx)

Perform correlations based on the following research questions.

To get the most out of these exercises, try to first find out the answer on your own and then use the drop-down menus to check your answer.

1.  **Are there significant correlations among the four tests (English, reading, math, writing)?**

    -   Do you meet the assumption of normality for all four tests? <select class='solveme' data-answer='["yes for all but maybe not writing"]'> <option></option> <option>yes</option> <option>no</option> <option>yes for all but maybe not writing</option></select>

    -   Do you meet the assumption of linearity for all four tests? <select class='solveme' data-answer='["yes"]'> <option></option> <option>yes</option> <option>no</option></select>

    -   Are the four tests significantly correlated among each other? <select class='solveme' data-answer='["yes"]'> <option></option> <option>yes</option> <option>no</option></select>

    -   Round your answers to two decimal places:

        -   What is the correlation between reading and math? <input class='solveme nospaces' size='3' data-answer='[".52"]'/>

        -   What is the correlation between writing and reading? <input class='solveme nospaces' size='3' data-answer='[".11"]'/>

        -   What is the correlation between writing and English? <input class='solveme nospaces' size='3' data-answer='[".37"]'/>
