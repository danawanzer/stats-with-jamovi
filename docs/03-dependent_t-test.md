# Dependent t-test



## What is the dependent t-test?

The dependent t-test is used to test the difference in our dependent variable between two categories in which participants are the *same* across categories. Our category variable is our independent variable. In other words, we use the independent t-test when we have a research question with a **continuous dependent variable** and a **categorical independent variable with two categories in which the same participants are in each category**.

The dependent t-test is also called a dependent samples t-test or paired samples t-test.

## Data set-up

To conduct the dependent t-test, we first need to ensure our data is set-up properly in our dataset. This requires having two columns: one is our dependent variable score for the participant in one category and the other column is our dependent variable score for the participant in the other category. Each row is a unique participant or unit of analysis. Here's what example data may look like if we were testing for differences in test scores across the same participants in the fall and spring:

| ID  | TestScore_Fall | TestScore_Spring |
|:----|:---------------|-----------------:|
| 1   | 75             |               86 |
| 2   | 79             |               80 |
| 3   | 65             |               75 |
| 4   | 81             |               79 |
| 5   | 73             |               82 |
| 6   | 72             |               84 |
| 7   | 69             |               90 |
| 8   | 60             |               72 |
| 9   | 75             |               75 |
| 10  | 74             |               81 |

: Example data for the dependent t-test

In the example data above, what is your **independent variable**? <select class='solveme' data-answer='["Semester"]'> <option></option> <option>ID</option> <option>Semester</option> <option>TestScore</option></select>

In the example data above, what is your **dependent variable**? <select class='solveme' data-answer='["Test Score"]'> <option></option> <option>ID</option> <option>Semester</option> <option>Test Score</option></select>

## The math behind the independent t-test

The basic math of the dependent t-test is the mean difference divided by the standard error, which is estimated based on the standard deviation and sample size (N).

$t = \frac{\bar{X}_1 - \bar{X}_2}{s_d/ \sqrt{N}}$

## Assumptions

As a parametric test, the independent t-test has the same assumptions as other parametric tests minus the homogeneity of variance assumption because we are dealing with the same people across categories

1.  The *differences in scores* in the dependent variable are **normally distributed**

2.  The dependent variable is **interval or ratio** (i.e., continuous)

3.  Scores are **independent** across participants

We cannot [test]{.ul} the second and third assumptions; rather, those are based on knowing your data.

However, we can and should test for the first assumption. Fortunately, the dependent samples t-test in jamovi has two check boxes under "Assumption Checks" that lets us test normality.

## In jamovi

Let's run an example with data from lsj-data. Open data from your Data Library in "lsj-data". Select and open "Chico". This dataset is hypothetical data from Dr. Chico's class in which students took two tests: one early in the semester and one later in the semester. Dr. Chico thinks that the first test is a "wake up call" for students. When they realise how hard her class really is, they'll work harder for the second test and get a better mark. Is she right? Let's test it!

1.  To perform an dependent t-test in jamovi, go to the Analyses tab, click the T-Tests button, and choose "Paired Samples T-Test".

2.  Move both measurements of your dependent variable (`grade_test1` and `grade_test2`) to the Paired Variables box.

3.  Under Tests, select `Student's`

4.  Under Hypothesis, choose the correct hypothesis: <select class='solveme' data-answer='["Measure 1 < Measure 2"]'> <option></option> <option>Measure 1 is not equal to Measure 2</option> <option>Measure 1 > Measure 2</option> <option>Measure 1 < Measure 2</option></select>

5.  Under Additional Statistics, select `Mean difference`, `Effect size`, and `Descriptives`.

6.  Under Assumption Checks, select both options: `Normality test` and `Q-Q plot`.

When you are done, your setup should look like this

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{images/03_dependent_t-test/dependent_setup} 

}

\caption{Dependent t-test setup in jamovi}(\#fig:unnamed-chunk-1)
\end{figure}

### Checking assumptions in jamovi

#### Testing normality

We test for normality using the Shapiro-Wilk test and the Q-Q plot. The Shapiro-Wilk test was not statistically significant (W = .97, *p* = .678); therefore, this indicates the data is normally distributed. Furthermore, the lines are fairly close to the diagonal line in the Q-Q plot (although it's a bit hard to tell because our sample size is small). We can conclude that we satisfy the assumption of normality.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/03_dependent_t-test/dependent_normality} 

}

\caption{Testing normality in jamovi}(\#fig:unnamed-chunk-2)
\end{figure}

### Interpreting results

Once we are satisfied we have satisfied the assumptions for the dependent t-test, we can interpret our results.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/03_dependent_t-test/dependent_results} 

}

\caption{Dependent t-test results in jamovi}(\#fig:unnamed-chunk-3)
\end{figure}

Our p-value is less than .05, so our results are statistically significant. We can write up our results in APA something like this:

> The 20 students in Dr. Chico's class performed worse on the first test (*M* = 56.98, *SD* = 6.62) than they did on the second test (*M* = 58.38, *SD* = 6.41), *t*(19) = -6.48, *p* \< .001, *d* = -1.45.

Remember in the previous chapter that our t-test can be negative but we can always flip the interpretation. Here's another example of how we could write-up our results in APA style:

> Dr. Chico's hypothesis was correct in that her 20 students performed better on the second test (*M* = 58.38, *SD* = 6.41) than they did on the first test (*M* = 56.98, *SD* = 6.62), *t*(19) = 6.48, *p* \< .001, *d* = 1.45.

## What if I violated assumptions?

If you violated the assumption of normality and no transformation fixed your data, then you can perform the non-parametric version of the dependent t-test called the Wilcoxon Rank test. As a reminder, non-parametric tests do not make assumptions about the distribution of data because it deals with the *median* not the *mean*.

Here is the output for both the dependent t-test and the Wilcoxon rank test:

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/03_dependent_t-test/dependent_results_full} 

}

\caption{All independent t-test results in jamovi}(\#fig:unnamed-chunk-4)
\end{figure}

#### Wilcoxon rank in jamovi

To conduct this in jamovi, under Tests select `Wilcoxon rank`. You will interpret the results similarly to the dependent t-test:

> Using Wilcoxon rank test, students' test scores were significantly higher at the second test (*Mdn* = 59.70) than at the first test (*Mdn* = 57.70), W = 2.00, *p* \< .001.

The note about tied values is not necessary to discuss. It is just telling us one participant had identical values for both test1 and test2 (student15).

## Your turn!

Open the `Sample_Dataset_2014.xlsx` file that we use for all Your Turn exercises.

Perform dependent t-tests based on the following research questions. Think critically about whether you should be using a one-tailed or two-tailed hypothesis and check your assumptions so you know which test to use!

To get the most out of these exercises, try to first find out the answer on your own and then use the drop-down menus to check your answer.

**Note**: Technically, none of our data is suitable for a dependent t-test in this dataset. We will pretend that the four test score variables (`English`, `Reading`, `Math`, and `Writing`) are really four measurements of the same underlying test. In reality, we would analyze this data using correlation.

1.  **Do students perform better on the English test than they do the Writing test?**

    -   Should you use a one-tailed or two-tailed hypothesis? <select class='solveme' data-answer='["one-tailed"]'> <option></option> <option>one-tailed</option> <option>two-tailed</option></select>

    -   Which statistic should you use based on your assumptions? <select class='solveme' data-answer='["dependent t-test"]'> <option></option> <option>dependent t-test</option> <option>Wilcoxon rank</option></select>

    -   Do students perform better on the English test than they do the Writing test? <select class='solveme' data-answer='["yes"]'> <option></option> <option>yes</option> <option>no</option></select>

2.  **Does students' English scores relate to their Reading scores?**

    -   Should you use a one-tailed or two-tailed hypothesis? <select class='solveme' data-answer='["two-tailed"]'> <option></option> <option>one-tailed</option> <option>two-tailed</option></select>

    -   Which statistic should you use based on your assumptions? <select class='solveme' data-answer='["dependent t-test"]'> <option></option> <option>dependent t-test</option> <option>Wilcoxon rank</option></select>

    -   Does students' English scores relate to their Reading scores? <select class='solveme' data-answer='["no"]'> <option></option> <option>yes</option> <option>no</option></select>
