---
title: "Statistics with jamovi"
author: "Dana Wanzer"
date: "Last Update: 2020-11-05"
site: bookdown::bookdown_site
output:
  bookdown::pdf_book:
    keep_tex: yes
documentclass: book
bibliography: [book.bib, packages.bib]
biblio-style: apalike
link-citations: yes
description: "This is the website for PSYC 290 and PSYC 790 at the University of Wisconsin-Stout, taught by Dana Wanzer."
---



# Welcome {.unnumbered}

This is the website for PSYC 290 and PSYC 790 at the University of Wisconsin-Stout, taught by Dana Wanzer. These resources are aimed at teaching you how to use jamovi and null hypothesis significance testing (NHST) to answer research questions.

This website is **free to use** and is licensed under a Creative Commons BY-SA (CC BY-SA) license version 4.0. This means you are free to **share** (i.e., copy and redistribute the material in any medium or format) and **adapt** (i.e., remix, transform, and build upon the material for any purpose, even commercially), provided that you **attribute** these resources by citing me, indicating if changes were made and you **share alike** (i.e., if you adapt, you must distribute your contributes under the same license as the original).

Portions of this book may have been adapted from "[Learning statistics with jamovi: A tutorial for psychology students and other beginners](http://www.learnstatswithjamovi.com)" by Danielle J. Navarro and David R. Foxcroft, version 0.70. Furthermore, the template and style of this book is from [PsyTeachR](https://psyteachr.github.io/book-template/setup.html).

<!--chapter:end:index.Rmd-->

# Introduction



This chapter will walk you through how this website/book works.

## Quiz Questions

Throughout this website, there will be questions to help you test your knowledge. When you type in or select the correct answer, the dashed box will change color and become solid.

For example:

-   What is 2+2? <input class='solveme nospaces' size='1' data-answer='["4"]'/>

-   We attend the University of Wisconsin- <select class='solveme' data-answer='["Stout"]'> <option></option> <option>Stout</option> <option>Madison</option> <option>Green Bay</option></select>

-   True or false: Statistics is awesome. <select class='solveme' data-answer='["TRUE"]'> <option></option> <option>TRUE</option> <option>FALSE</option></select>

## Errors and mistakes

I am human, therefore I err. If you find an error in the textbook or something you think might be a mistake, please let me know ASAP so I can update this for everyone else. Let me know which section you find the error or mistake in and what the error or mistake is. For example, if there was an error here you could say, "There was an error in 1.2 that the first sentence should really be 'To err is human.'"

<!--chapter:end:01-intro.Rmd-->

# (PART) t-tests {.unnumbered}

# Independent t-test



## What is the t-test?

The t-test looks at difference in means between two things (e.g., groups, time, observations). There are three different types of t-tests:

1.  The **one-sample t-test** tests how sample mean relates to the population mean.

2.  The **independent t-test** has *independent* groups. The participants or things in group 1 are *not* the same as the participants or things in group 2.

3.  The **dependent t-test** has *dependent* or *paired* data. The dependent variable is measured at two different times or for two different conditions for all participants or things.

This chapter will focus on the independent t-test and the next chapter will discuss the dependent t-test.

## What is the independent t-test?

The independent t-test is used to test the difference in our dependent variable between two different groups of observations. Our grouping variable is our independent variable. In other words, we use the independent t-test when we have a research question with a **continuous dependent variable** and a **categorical independent variable with two categories in which different participants are in each category**.

The independent t-test is also called the independent samples t-test and the Student's t-test. I will use these terms interchangeably.

There are three different types of alternative hypotheses we could have for the independent t-test:

1.  **Two-tailed**

    -   $H_1$: Group 1 has a different mean than Group 2.
    -   $H_0$: There is no difference in means between the two groups.

2.  **One-tailed**

    -   $H_1$: Group 1 has a greater mean than Group 2.
    -   $H_0$: The mean for Group 1 is less than or equal to the mean for Group 2.

3.  **One-tailed**

    -   $H_1$: Group 1 has a smaller mean than Group 2.
    -   $H_0$: The mean for Group 1 is greater than or equal to the mean for Group 2.

## Data set-up

To conduct the independent t-test, we first need to ensure our data is set-up properly in our dataset. This requires having two columns: one with our continuous dependent variable and one indicating which group the participant is in. Each row is a unique participant or unit of analysis. Here's what example data may look like if we were testing for differences in a test score by students in my fall or spring semesters of this course:

| ID  | Semester | TestScore |
|:----|:---------|----------:|
| 1   | Fall     |        86 |
| 2   | Fall     |        80 |
| 3   | Fall     |        75 |
| 4   | Fall     |        79 |
| 5   | Fall     |        82 |
| 6   | Spring   |        84 |
| 7   | Spring   |        90 |
| 8   | Spring   |        72 |
| 9   | Spring   |        75 |
| 10  | Spring   |        81 |

: Example data for the independent t-test

In the example data above, what is your **independent variable**? <select class='solveme' data-answer='["Semester"]'> <option></option> <option>ID</option> <option>Semester</option> <option>TestScore</option></select>

In the example data above, what is your **dependent variable**? <select class='solveme' data-answer='["TestScore"]'> <option></option> <option>ID</option> <option>Semester</option> <option>TestScore</option></select>

## The math behind the independent t-test

\begin{info}
If the math below makes your eyes glaze over, you can skip it. This is
presented for those who find it useful to understand the math behind the
statistics to help understand what's happening.
\end{info}

The basic math of the independent t-test the mean difference divided by the pooled standard error.

$t = \frac{\bar{X}_1 - \bar{X}_2}{SE({\bar{X}_1 - \bar{X}_2})}$

The denominator of the equation is more difficult to calculate and depends on whether the sample size between groups is equal.

## Assumptions

As a parametric test, the independent t-test has the same assumptions as other parametric tests:

1.  The dependent variable is **normally distributed**

2.  Variances in the two groups are roughly equal (i.e., **homogeneity of variances**)

3.  The dependent variable is **interval or ratio** (i.e., continuous)

4.  Scores are **independent** between groups

We cannot [test]{.ul} the third and fourth assumptions; rather, those are based on knowing your data.

However, we can and should test for the first two assumptions. Fortunately, the independent samples t-test in jamovi has two check boxes under "Assumption Checks" that lets us test for both assumptions.

## Performing the independent t-test in jamovi

Let's run an example with data from lsj-data. Open data from your Data Library in "lsj-data". Select and open "Harpo". This dataset is hypothetical data of 33 students taking Dr. Harpo's statistics lectures. We have two tutors for the class, Anastasia (*n* = 15) and Bernadette (*n* = 18). Our research question is "Which tutor results in better student grades?" We don't have a hypothesis that one does better than the other.

1.  To perform an independent t-test in jamovi, go to the Analyses tab, click the T-Tests button, and choose "Independent Samples T-Test".

2.  Move your dependent variable `grade` to the Dependent Variables box and your independent variable `tutor` to the Grouping Variable box.

3.  Under Tests, select `Student's`

4.  Under Hypothesis, because we have a two-sided hypothesis select a two-sided hypothesis (Group 1 does not equal Group 2).

5.  Under Additional Statistics, select `Mean difference`, `Effect size`, and `Descriptives`.

6.  Under Assumption Checks, select all three options: `Homogeneity test`, `Normality test`, and `Q-Q plot`.

When you are done, your setup should look like this

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{images/02-independent_t-test/independent_t-test_setup} 

}

\caption{Independent t-test setup in jamovi}(\#fig:unnamed-chunk-2)
\end{figure}

## Checking assumptions in jamovi

### Testing normality

We test for normality using the Shapiro-Wilk test and the Q-Q plot. The Shapiro-Wilk test was not statistically significant (W = .98, *p* = .827); therefore, this indicates the data is normally distributed. Furthermore, the lines are fairly close to the diagonal line in the Q-Q plot. We can conclude that we satisfy the assumption of normality.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/02-independent_t-test/independent_t-test_normality} 

}

\caption{Testing normality in jamovi}(\#fig:unnamed-chunk-3)
\end{figure}

Remember that we also test for normality by **looking at our data** (e.g., a histogram) and by examining **skew and kurtosis**. However, you will need to view them using Exploration --\> Descriptives, not in the t-tests menu.

### Testing homogeneity of variance

We test for homogeneity of variance using the Levene's test. The Levene's test was not statistically significant (*F* [1, 31] = 2.49, *p* = .125); therefore, this indicates our data satisfies the assumption of homogeneity of variance. However, I would add a caveat that we have a small sample of data (*n* = 15 for Anastasia and *n* = 18 for Bernadette) and the standard deviations are quite different from one another (SD = 9.00 vs 5.77, respectively). We should have tried to collect more data.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/02-independent_t-test/independent_t-test_homogeneity} 

}

\caption{Testing homogeneity of variance in jamovi}(\#fig:unnamed-chunk-4)
\end{figure}

## Interpreting results

Once we are satisfied we have satisfied the assumptions for the independent t-test, we can interpret our results.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/02-independent_t-test/independent_t-test_ind-results} 

}

\caption{Independent t-test results in jamovi}(\#fig:unnamed-chunk-5)
\end{figure}

Our p-value is less than .05, so our results are statistically significant. Like most of the statistics we'll come across, the large the t-statistic (or F-statistic, or chi-square statistic...), the smaller the p-value.

We can write up our results in APA something like this:

> Anastasia's students (*M* = 74.53, *SD* = 9.00, *n* = 15) had significantly higher grades than Bernadette's students (*M* = 69.06, *SD* = 5.77, *n* = 18), *t* (31) = 2.12, *p* = .043, *d* = .74.

Sometimes, people like to put the statistics inside a parentheses. In that case, you need to change the parentheses around the degrees of freedom as brackets. Here's another example write-up of the results in APA style:

> I tested the difference in grades between Anastasia's students (*M* = 74.53, *SD* = 9.00, *n* = 15) and Bernadette's students (*M* = 69.06, *SD* = 5.77, *n* = 18). An independent samples t-test showed that the 5.48 mean difference between the tutor's student was statistically significant (*t* [31] = 2.12, *p* = .043, *d* = .74).

## Additional information about the independent t-test

### Positive and negative t values

Students often worry about positive or negative t-statistic values and are unsure how to interpret it. Positive or negative t-statistic values simply occur based on which group is listed first. Our t-statistic above is positive because we tested the difference between Anastasia and Bernadette: (Anastasia - Bernadette) = (74.53 - 69.06) = (5.48).

However, if we flipped it and tested the difference between Bernadette and Anastasia, our mean difference would be -5.48 and our t-statistic would be -2.12.

All that is to say, *your positive or negative t-statistic is arbitrary*. So do not fret!

However, it is important the sign of your t-statistic matches what you report. For example, notice the difference:

> 1.  Anastasia's students had **higher** grades than Bernadette's, *t* (31) = **2.12**, *p* = .043, *d* = .74.
> 2.  Bernadette's students had **lower** grades than Anastasia's, *t* (31) = **-2.12**, *p* = .043, *d* = .74.

One last note: this positive or negative t-statistic is only relevant for the independent and dependent t-test. You will not get negative values for the F-statistic or chi-square tests!

### What if I violated assumptions?

The great news is that jamovi includes the Welch's t-statistic and the non-parametric version of the independent t-test (Mann-Whitney U)!

The Welch's t-test has three main differences from the independent samples t-test: (a) the standard error (SE) is not a pooled estimate, (b) the degrees of freedom are calculated very different (not *N* - 2), and (c) it does not have an assumption of homogeneity of variance. Note that Welch's t-test is not a non-parametric test because it still has the assumption of a normal distribution.

The Mann-Whitney U is not calculated based on the mean but rather the median and compares ranks of values across the two groups: it has no assumptions about the distribution of data or homogeneity of variances.

Here's what statistic you should choose based on satisfying assumptions:

+--------------------------------------------+----------------------------+------------------------------+
|                                            | **Normality: satisfied**   | **Normality: not satisfied** |
+============================================+============================+==============================+
| **Homogeneity of Variance: satisfied**     | independent samples t-test | Mann-Whitney U               |
+--------------------------------------------+----------------------------+------------------------------+
| **Homogeneity of Variance: not satisfied** | Welch's t-test             | Mann-Whitney U               |
+--------------------------------------------+----------------------------+------------------------------+

Here is what the output for all three tests look like:

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/02-independent_t-test/independent_t-test_full-results} 

}

\caption{All independent t-test results in jamovi}(\#fig:unnamed-chunk-6)
\end{figure}

#### Welch's t-test in jamovi

To conduct this in jamovi, under Tests select `Welch's`. You will interpret the results similarly to the independent t-test:

> Using a Welch's t-test, there was not a statistically significant difference in grades between Anastasia's students (*M* = 74.53, *SD* = 9.00, *n* = 15) and Bernadette's students (*M* = 69.06, *SD* = 5.77, *n* = 18), *t* (23.02) = 2.03, *p* = .054, *d* = .72.

Why is it no longer statistically significant? Which result should you trust? In reality, the difference in *p*-values is likely due to chance. However, the independent t-test and Welch's test have different strengths and weaknesses. If the two populations really do have equal variances, then the independent t-test is slightly more powerful (lower Type II error rate) than the Welch's test. However, if they *don't* have the same variances, then the assumptions of the independent t-test are violated and you may not be able to trust the results; you may end up with a higher Type I error rate. So it's a trade-off.

Which should you use? I tend to prefer always using Welch's t-test because if the variances are equal, then there will be practically no difference between the independent and Welch's t-test. But if the variances are not equal, then Welch's t-test will outperform the independent t-test. For that reason, defaulting to the Welch's t-test makes most sense to me.

#### Mann-Whitney U test

If you do not satisfy the assumption of normality (regardless of whether you satisfy the assumption of homogeneity of variance), you should either try to transform your data to be normally distributed or you will need to use a non-parametric test. In this case, if you originally wanted to perform an independent t-test, the non-parametric equivalent test is the Mann-Whitney U test.

I will not go into specifics, but the idea behind the Mann-Whitney U test is that you take all the values (regardless of group) and rank them. You then sum the ranks across groups and calculate your U statistic and p-value. You interpret the p-value like you normally would, but there are differences in how we report the results because this statistic is based on the *median* not the *mean*.

> Using the Mann-Whitney U test, there was a statistically significant difference in grades between Anastasia's students (*Mdn* = 76, *n* = 15) and Bernadette's students (*Mdn* = 69, *n* = 18), *t* (23.02) = 2.03, *p* = .054, *d* = .72.

## Your turn!

Open the `Sample_Dataset_2014.xlsx` file that we will be using for all Your Turn exercises. You can find the dataset here: [Sample_Dataset_2014.xlsx Download](https://github.com/danawanzer/stats-with-jamovi/blob/master/data/Sample_Dataset_2014.xlsx)

Perform independent t-tests based on the following research questions. Think critically about whether you should be using a one-tailed or two-tailed hypothesis and check your assumptions so you know which test to use!

To get the most out of these exercises, try to first find out the answer on your own and then use the drop-down menus to check your answer.

1.  **Does height differ by gender (Gender: male = 0, female = 1)?**

    -   Should you use a one-tailed or two-tailed hypothesis? <select class='solveme' data-answer='["two-tailed"]'> <option></option> <option>one-tailed</option> <option>two-tailed</option></select>

    -   Which statistic should you use based on your assumptions? <select class='solveme' data-answer='["Mann Whitney U"]'> <option></option> <option>independent t-test</option> <option>Welch's t-test</option> <option>Mann Whitney U</option></select>

    -   Does height differ by gender? <select class='solveme' data-answer='["yes"]'> <option></option> <option>yes</option> <option>no</option></select>

2.  **Do athletes (Athlete: athletes = 1, non-athlete = 0) have faster sprint times than non-athletes?**

    -   Should you use a one-tailed or two-tailed hypothesis? <select class='solveme' data-answer='["one-tailed"]'> <option></option> <option>one-tailed</option> <option>two-tailed</option></select>

    -   Which statistic should you use based on your assumptions? <select class='solveme' data-answer='["Mann Whitney U"]'> <option></option> <option>independent t-test</option> <option>Welch's t-test</option> <option>Mann Whitney U</option></select>

    -   Do athletes have faster sprint times than non-athletes? <select class='solveme' data-answer='["yes"]'> <option></option> <option>yes</option> <option>no</option></select>

3.  **Do students who live on campus (LiveOnCampus: on campus = 1, off campus = 0) have higher English scores than students who live off campus?**

    -   Should you use a one-tailed or two-tailed hypothesis? <select class='solveme' data-answer='["one-tailed"]'> <option></option> <option>one-tailed</option> <option>two-tailed</option></select>

    -   Which statistic should you use based on your assumptions? <select class='solveme' data-answer='["Welch&apos;s t-test"]'> <option></option> <option>independent t-test</option> <option>Welch's t-test</option> <option>Mann Whitney U</option></select>

    -   Does students who live on campus have higher English scores? <select class='solveme' data-answer='["no"]'> <option></option> <option>yes</option> <option>no</option></select>

4.  **Does athletic status relate to math scores?**

    -   Should you use a one-tailed or two-tailed hypothesis? <select class='solveme' data-answer='["two-tailed"]'> <option></option> <option>one-tailed</option> <option>two-tailed</option></select>

    -   Which statistic should you use based on your assumptions? <select class='solveme' data-answer='["independent t-test"]'> <option></option> <option>independent t-test</option> <option>Welch's t-test</option> <option>Mann Whitney U</option></select>

    -   Does athletic status relate to math scores? <select class='solveme' data-answer='["yes"]'> <option></option> <option>yes</option> <option>no</option></select>

<!--chapter:end:02-independent_t-test.Rmd-->

# Dependent t-test



## What is the dependent t-test?

The dependent t-test is used to test the difference in our dependent variable between two categories in which participants are the *same* across categories. Our category variable is our independent variable. In other words, we use the dependent t-test when we have a research question with a **continuous dependent variable** and a **categorical independent variable with two categories in which the same participants are in each category**.

The dependent t-test is also called a dependent samples t-test or paired samples t-test.

There are three different types of alternative hypotheses we could have for the dependent t-test:

1.  **Two-tailed**

    -   $H_1$: There is a difference in means between the two time points or conditions.
    -   $H_0$: There is no difference in means between the two time points or conditions.

2.  **One-tailed**

    -   $H_1$: The mean at time 1 or condition 1 is greater than the mean at time 2 or condition 2.
    -   $H_0$: The mean at time 1 or condition 1 is less than or equal to the mean at time 2 or condition 2.

3.  **One-tailed**

    -   $H_1$: The mean at time 1 or condition 1 is smaller than the mean at time 2 or condition 2.
    -   $H_0$: The mean at time 1 or condition 1 is greater than or equal to the mean at time 2 or condition 2.

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

## The math behind the dependent t-test

The basic math of the dependent t-test is the mean difference divided by the standard error, which is estimated based on the standard deviation and sample size (N).

$t = \frac{\bar{X}_1 - \bar{X}_2}{s_d/ \sqrt{N}}$

## Assumptions

As a parametric test, the dependent t-test has the same assumptions as other parametric tests minus the homogeneity of variance assumption because we are dealing with the same people across categories

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

\caption{All dependent t-test results in jamovi}(\#fig:unnamed-chunk-4)
\end{figure}

#### Wilcoxon rank in jamovi

To conduct this in jamovi, under Tests select `Wilcoxon rank`. You will interpret the results similarly to the dependent t-test:

> Using Wilcoxon rank test, students' test scores were significantly higher at the second test (*Mdn* = 59.70) than at the first test (*Mdn* = 57.70), W = 2.00, *p* \< .001.

The note about tied values is not necessary to discuss. It is just telling us one participant had identical values for both test1 and test2 (student15).

## Your turn!

Open the `Sample_Dataset_2014.xlsx` file that we will be using for all Your Turn exercises. You can find the dataset here: [Sample_Dataset_2014.xlsx Download](https://github.com/danawanzer/stats-with-jamovi/blob/master/data/Sample_Dataset_2014.xlsx)

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

<!--chapter:end:03-dependent_t-test.Rmd-->

# (PART) ANOVA {.unnumbered}

# One-way ANOVA



## What is ANOVA?

ANOVA stands for ANalysis Of VAriance. ANOVAs analyze the variation among and between groups. There are multiple types of ANOVAs based on the nature of the independent variable(s):

| **Nature of IV(s)**               | **Type of ANOVA**                 |
|-----------------------------------|-----------------------------------|
| 1 between-subjects IV             | One-way ANOVA                     |
| 1 within-subjects IV              | Repeated-measures ANOVA           |
| 2+ between-subjects IVs           | Independent factorial ANOVA       |
| 2+ within-subjects IVs            | Repeated measures factorial ANOVA |
| 2+ IVs mixed between/within       | Mixed factorial ANOVA             |
| 1+ IV with a continuous covariate | ANCOVA                            |

Furthermore, there are ANOVAs for when there are multiple dependent variables (called the MANOVA or Multiple ANOVA) but we will not discuss it in this class.

## What is the one-way ANOVA?

The one-way analysis of variance (ANOVA) is used to test the difference in our dependent variable between [three or more]{.ul} different groups of observations. Our grouping variable is our independent variable. In other words, we use the one-way ANOVA when we have a research question with a **continuous dependent variable** and a **categorical independent variable with three or more categories in which different participants are in each category**.

The one-way ANOVA is also known as an independent factor ANOVA.

One thing to keep in mind is the one-way ANOVA is an omnibus statistic that tests against the null hypothesis that the three or more means are the same. It does not tell us where the mean differences are (e.g., that 1 \> 2); for that, we need planned contrasts or post-hoc procedures, which you'll learn about later. Therefore, the null and alternative hypotheses for the one-way ANOVA are as follows:

-   $H_0$: There is **no difference** in means between the groups. In other words, the means for the three or more groups are the **same**.
-   $H_1$: There is **a difference** in means between the groups. In other words, the means for the three or more groups are **different**.

## Data set-up

To conduct the one-way ANOVA, we first need to ensure our data is set-up properly in our dataset. This requires having two columns: one with our continuous dependent variable and one indicating which group the participant is in. Each row is a unique participant or unit of analysis. Here's what example data may look like if we were testing for differences in a test score by students in my fall, spring, or summer semesters of my course

| ID  | Semester | TestScore |
|:----|:---------|----------:|
| 1   | Fall     |        86 |
| 2   | Fall     |        80 |
| 3   | Fall     |        75 |
| 4   | Spring   |        79 |
| 5   | Spring   |        82 |
| 6   | Spring   |        84 |
| 7   | Summer   |        90 |
| 8   | Summer   |        72 |
| 9   | Summer   |        75 |

: Example data for the one-way ANOVA

In the example data above, what is your **independent variable**? <select class='solveme' data-answer='["Semester"]'> <option></option> <option>ID</option> <option>Semester</option> <option>TestScore</option></select>

In the example data above, what is your **dependent variable**? <select class='solveme' data-answer='["TestScore"]'> <option></option> <option>ID</option> <option>Semester</option> <option>TestScore</option></select>

## Why not multiple t-tests?

In the example above, we have three groups: fall, spring, and summer. We could just perform three separate t-tests: fall vs. spring, fall vs. summer, and spring vs. summer.

However, the reason we do not perform multiple t-tests is to reduce our Type I error rate. If I had performed three separate t-tests, set my alpha (Type I error rate) at 5%, and knew for a fact the effects do not actually exist, then each test has a probability of a Type I error rate of 5%. Because we are running three tests, our alpha rate actually becomes 1 - (.95^3^)= 1 - .857 = 14.3%! So now our *familywise* or *experimentwise* error rate is 14.3%, not the 5% we originally set alpha at.

With three groups, that's not so bad, but let's see what happens with more tests we perform:

-   **1 test**: 1 - (.95^1^)= 1 - .95 = **5%**
-   **2 tests**: 1 - (.95^2^)= 1 - .9025 = **9.8%**
-   **3 tests**: 1 - (.95^3^)= 1 - .857 = **14.3%**
-   **4 tests**: 1 - (.95^4^)= 1 - .814 = **18.6%**
-   **5 tests**: 1 - (.95^5^)= 1 - .774 = **22.6%**
-   **10 tests**: 1 - (.95^10^)= 1 - .598 = **40.1%**
-   **20 tests**: 1 - (.95^20^)= 1 - .358 = **64.1%**

Ouch! 10 tests would have a Type I error rate of 40%! That means that if we performed 10 statistical tests (assuming the effect does not exist), then 40% of the results would be statistically significant by chance alone and would be a false positive. That's not good!

Therefore, we use the one-way ANOVA as one test to see if there is a difference overall. We can also do things to control or limit our familywise error rate, which I'll get into later.

## The math behind the one-way ANOVA

The basic math of the one-way ANOVA is the between-group variance (mean squares - between groups) divided by the within-group variance (mean squares - within groups).

$F = \frac{BG \:variance}{WG \:variance} = \frac{MS_{BG}}{MS_{WG}} = \frac{\frac{SS_{BG}}{df_{BG}}}{\frac{SS_{WG}}{df_{WG}}}$

There are specific formulas for the between-group (also called the model) sum of squares (SS) and within-group (also called the residual) sum of squares. Keep in mind the following symbols:

-   n/N = sample size (little n is per group, big N is the overall sample)
-   k = number of groups
-   X = mean
-   s = standard deviation

The between-group SS is the *variation between group means*. The calculations you see below is to subtract the overall mean ($\bar{X}_{grand}$) from the group mean ($\bar{X_k}$), square that mean difference, multiply that by the sample size in that group ($n_k$), and then sum all the results of doing that per group.

$SS_{BG} = \sum{n_k}(\bar{X_k}-\bar{X}_{grand})^2$

$df_{BG} = k - 1$

The within-group SS is the *variation of scores within groups*. The calculations you see below is to take the sample size in that group ($n_k$) and subtract 1 from it, then multiply it by the group's variance ($s_k^2$, which is standard deviation squared), and then sum all the results of doing that per group.

$SS_{WG} = \sum{s_k^2}(n_k - 1)$

$df_{WG} = N - k$

In other words, the F-ratio is a ratio of the group or experimental effect by the individual differences in performance.

For our F-ratio to be statistically significant, we want to *maximize* the variance between groups (numerator) and *minimize* the variance within groups (denominator). This is depicted in the image below. On the left (a) the arrows show the differences in the group means. On the right (b) the arrows highlight the variability within each group. You want to maximize (a) and minimize (b).

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{images/04_one-way-anova/anova graphic} 

}

\caption{Graphical illustration of the one-way ANOVA}(\#fig:unnamed-chunk-1)
\end{figure}

### An example with the math

In case it's useful, read below. If your eyes are glazing over, just move to the next section.

You can read the example dataset below. I've pulled the relevant data here so we can go through a hand calculation ourselves.

| Drug        | N      | Mean       | Variance |
|-------------|--------|------------|----------|
| Anxifree    | 6      | 0.7167     | .1537    |
| Joyzepam    | 6      | 1.4833     | .0457    |
| Placebo     | 6      | 0.4500     | .0790    |
| **Overall** | **18** | **0.8833** | **.28**  |

Let's start with the easy stuff! Let's calculate our degrees of freedom.

$df_{BG} = k - 1 = 3 -1 = 2$

$df_{WG} = N - k = 18 - 3 = 15$

Now let's move to the more complicated ones.

$\begin{aligned} SS_{BG} &= \sum{n_k}(\bar{X_k}-\bar{X}_{grand})^2 \\ SS_{BG} &= 6(.7167-.8833)^2 + 6(1.4833-.8833)^2 + 6(.4500-.8833)^2 \\ SS_{BG} &= 6(-.1666)^2 + 6(.6)^2 + 6(-.4333)^2 \\ SS_{BG} &= 6(.0278) + 6(.36) + 6(.1877) \\ SS_{BG} &= .1665 + 2.16 + 1.1262 \\ SS_{BG} &= 3.453 \end{aligned}$

Then we can calculate our $MS_{BG}$.

$MS_{BG} = \frac{SS_{BG}}{df_{BG}} = \frac{3.453}{2} = 1.727$

Let's move to our $SS_{WG}$.

$\begin{aligned} SS_{WG} &= \sum{s_k^2}(n_k - 1) \\ SS_{WG} &= .1537(6-1) + .0457(6-1) + .0790(6-1) \\ SS_{WG} &= .1537(5) + .0457(5) + .0790(5) \\ SS_{WG} &= .7685 + .2285 + .3950 \\ SS_{WG} &= 1.392 \end{aligned}$

Now we can calculate our $MS_{WG}$.

$MS_{WG} = \frac{SS_{WG}}{df_{WG}} = \frac{1.392}{15} = .0928$

Now all that's left is to calculate $F$!

$F = \frac{MS_{BG}}{MS_{WG}} = \frac{1.726}{.0928} = 18.60$

Compare to the $F$, $df_{WG}$, and $df_{BG}$ in the output below in jamovi! Notice how close we are. Also notice how many decimals I retained throughout the analyses. I was a bit off when I first did this with only two decimals throughout. Retaining four decimals throughout got me only \~one-hundredth of a decimal off from the actual results. Neat!

## Assumptions {#anova-assumptions}

As a parametric test, the one-way ANOVA has the same assumptions as other parametric tests:

1.  The dependent variable is **normally distributed**

2.  Variances in the two groups are roughly equal (i.e., **homogeneity of variances**)

3.  The dependent variable is **interval or ratio** (i.e., continuous)

4.  Scores are **independent** between groups

We cannot [test]{.ul} the third and fourth assumptions; rather, those are based on knowing your data. However, we can and should test for the first two assumptions. Fortunately, the one-way ANOVA in jamovi has three check boxes under "Assumption Checks" that lets us test for both assumptions.

### ANOVA is robust to violations

Although we should meet the assumptions as much as possible, in general the F-statistic is *robust* to violations of normality and homogeneity of variance. This means that you can still run the one-way ANOVA if you violate the assumptions, but *only when group sizes are equal or nearly equal*. If you have vastly different variances (such as 2:1 ratio or greater) or vastly different group sizes (such as a 2:1 ratio or greater), and especially if one group is small (such as 10 or fewer cases), then your F-statistic is likely to be very wrong. For example, if your larger group has the larger variance, then your F-statistic is likely to be non-significant or smaller than it should be; however, if your larger group has smaller variance,then your F-statistic is likely to be significant or bigger than it should be!

## In jamovi

Let's run an example with data from lsj-data. Open data from your Data Library in "lsj-data". Select and open "clinicaltrial". This dataset is hypothetical data of a clinical trial in which you are testing a new antidepressant drug called *Joyzepam*. In order to construct a fair test of the drug's effectiveness, the study involves three separate drugs to be administered. One is a placebo, and the other is an existing antidepressant / anti-anxiety drug called *Anxifree*. A collection of 18 participants with moderate to severe depression are recruited for your initial testing. Because the drugs are sometimes administered in conjunction with psychological therapy, your study includes 9 people undergoing cognitive behavioral therapy (CBT) and 9 who are not. Participants are randomly assigned (doubly blinded, of course) a treatment, such that there are 3 CBT people and 3 no-therapy people assigned to each of the 3 drugs. A psychologist assesses the mood of each person after a 3 month run with each drug, and the overall improvement in each person's mood is assessed on a scale ranging from -5 to +5.

1.  To perform a one-way ANOVA in jamovi, go to the Analyses tab, click the ANOVA button, and choose "ANOVA". You might be asking why we aren't choosing "One-Way ANOVA" and that's because the options there are too limited.

2.  Move your dependent variable `mood.gain` to the Dependent Variable box and your independent variable `drug` to the Fixed Factors box.

3.  Select $\omega^2$ for your effect size.

4.  Ignore the Model drop-down menu. If you are doing more complicated ANOVAs you will need this. We will ignore it.

5.  In the Assumption Checks drop-down menu, select all three options: `Homogeneity test`, `Normality test`, and `Q-Q plot`.

6.  Ignore the Contrasts and Post Hoc Tests drop-down menus for now. See below for more information on them.

7.  In the Estimated Marginal Means drop-down menu, move your IV `drug` to the Marginal Means box and select `Marginal means plots`, `Marginal means tables`, and `Observed scores`, in addition to the pre-selected `Equal cell weights`.

When you are done, your setup should look like this:

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{images/04_one-way-anova/one-way_setup} 

}

\caption{One-way ANOVA setup in jamovi}(\#fig:unnamed-chunk-2)
\end{figure}

### Checking assumptions in jamovi

We test for normality using the Shapiro-Wilk test and the Q-Q plot. The Shapiro-Wilk test was not statistically significant (W = .96, *p* = .605); therefore, this indicates the data is normally distributed. Furthermore, the lines are fairly close to the diagonal line in the Q-Q plot. We can conclude that we satisfy the assumption of normality.

We test for homogeneity of variance using the Levene's test. The Levene's test was not statistically significant (*F* [2, 15] = 1.45, *p* = .266); therefore, this indicates our data satisfies the assumption of homogeneity of variance. However, I would add a caveat that we have a small sample of data (*N* = 18); we should have tried to collect more data.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/04_one-way-anova/one-way_assumptions1} 

}

\caption{Testing assumptions in jamovi}(\#fig:unnamed-chunk-3)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/04_one-way-anova/one-way_assumptions2} 

}

\caption{**CAPTION THIS FIGURE!!**}(\#fig:unnamed-chunk-4)
\end{figure}

## Interpreting results

Once we are satisfied we have satisfied the assumptions for the one-way ANOVA, we can interpret our results.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/04_one-way-anova/one-way_results} 

}

\caption{One-way ANOVA results in jamovi}(\#fig:unnamed-chunk-5)
\end{figure}

Our p-value is less than .05, so our results are statistically significant. We can write up our results in APA something like this:

> There is a significant difference in mood gain across the three drug conditions, *F* (2, 15) = 18.61, *p* \< .001, $\omega^2$ = .66.

Sometimes, people like to put the statistics inside a parentheses. In that case, you need to change the parentheses around the degrees of freedom as brackets. Here's another example write-up of the results in APA style:

> There is a significant difference in mood gain across the three drug conditions (*F* [2, 15] = 18.61, *p* \< .001, $\omega^2$ = .66).

### A note on one-tailed vs. two-tailed tests

Unlike a t-test, we would not halve the p-value in an F-ratio because it is an omnibus test. Our planned contrasts or post-hoc tests can tell us where differences are, and we can provide directional hypotheses there if we so choose.

## What if I violated assumptions?

The great news is that jamovi includes the Welch's F-statistic and the Kruskal-Wallis non-parametric test! The bad news is that you lose some functionality in jamovi when you use them. Just like with the Welch's t-statistic (for the independent t-test), it does not have the assumption of equal variances so it's appropriate to use if your data is normally distributed but does not have homogeneous variances. Similarly, the Kruskal-Wallis test is the non-parametric version of the one-way ANOVA and should be used if you do not satisfy the assumption of normality.

Here's what statistic you should choose based on satisfying assumptions:

|                                            | **Normality: satisfied** | **Normality: not satisfied** |
|--------------------------------------------|--------------------------|------------------------------|
| **Homogeneity of Variance: satisfied**     | one-way ANOVA            | Kruskal-Wallis               |
| **Homogeneity of Variance: not satisfied** | Welch's F-test           | Kruskal-Wallis               |

#### Welch's F-test in jamovi

To conduct this in jamovi, you will need to use the "One-Way ANOVA" test, not the "ANOVA" test. The unfortunate thing about this test is that it strangely does not provide effect sizes.

In jamovi, under Variances select `Don't assume equal (Welch's)`. Move `mood.gain` to the Dependent Variable box and `drug` to your Grouping Variable box. You will interpret the results similarly to the one-way ANOVA:

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/04_one-way-anova/one-way_results_Welch} 

}

\caption{One-way ANOVA results in jamovi}(\#fig:unnamed-chunk-6)
\end{figure}

> Using a Welch's F-test, there is a significant difference in mood gain across the three drug conditions, *F* (2, 9.49) = 26.32, *p* \< .001.

#### Kruskal-Wallis test in jamovi

To perform the Kruskal-Wallis test in jamovi, you will need to select under the ANOVA button "One-Way ANOVA, Kruskal Wallis" towards the bottom of the list of options. Move `mood.gain` to the Dependent Variables box and `drug` to the Grouping Variable box. Select Effect size; if you need post hoc comparisons select DSCF pairwise comparisons (see section below on group differences). You will interpret the results similarly to the one-way ANOVA:

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/04_one-way-anova/one-way_results_Kruskal} 

}

\caption{Kruskal-Wallis results in jamovi}(\#fig:unnamed-chunk-7)
\end{figure}

> Using a Kruskal-Wallis test, there is a significant difference in mood gain across the three drug conditions, $\chi^2$ (2) = 12.08, *p* = .002, $\epsilon^2$ = .71.

Notice how in this case all three results converge and show there is a statistically significant difference in the results! The problem is... differences in which groups?

## Finding Group Differences

Often, we're not interested in just *whether* there is a difference (which the F-statistic can tell us), but *where* the differences are between groups (which the F-statistic cannot tell us). For that, we use either [planned contrasts]{.ul} when you have specific hypotheses you want to test or [post-hoc comparisons]{.ul} when you have no specific hypotheses.

**Note**: You [do not]{.ul} perform contrasts or post hoc comparisons if your overall $F$ statistic is not statistically significant. You do not interpret group differences if you fail to reject the null hypothesis that there are no group differences!

### Planned Contrasts

If you have before-analysis hypotheses of group differences in your data, you will use planned contrasts. You can find the planned contrasts in the ANOVA (but not the one-way ANOVA) setup as a drop-down menu. Note that while I show all six contrasts that jamovi provides, you do not normally do multiple contrasts. These are just shown for illustrative purposes:

1.  **Deviation**: compares the effect of each category (except the first category) to the overall experimental effect. The order of categories is alphabetical or numerical order. Notice how anxifree is considered the first category.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/04_one-way-anova/contrasts_deviation} 

}

\caption{**CAPTION THIS FIGURE!!**}(\#fig:unnamed-chunk-8)
\end{figure}

2.  **Simple**: Each category is compared to the first category. The order of categories is alphabetical or numerical order. Notice how anxifree is considered the first category.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/04_one-way-anova/contrasts_simple} 

}

\caption{**CAPTION THIS FIGURE!!**}(\#fig:unnamed-chunk-9)
\end{figure}

3.  **Difference**: Each category (except the first) is compared to the mean effect of all previous categories.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/04_one-way-anova/contrasts_difference} 

}

\caption{**CAPTION THIS FIGURE!!**}(\#fig:unnamed-chunk-10)
\end{figure}

4.  **Helmert**: Each category (except the last) is compared to the mean effect of all subsequent categories.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/04_one-way-anova/contrasts_helmert} 

}

\caption{**CAPTION THIS FIGURE!!**}(\#fig:unnamed-chunk-11)
\end{figure}

5.  **Repeated**: Each category is compared to the last category.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/04_one-way-anova/contrasts_repeated} 

}

\caption{**CAPTION THIS FIGURE!!**}(\#fig:unnamed-chunk-12)
\end{figure}

6.  **Polynomial**: Tests trends in the data. It will examine the *n-1*^th^ degree based on the number of groups. In this case, because we have 3 groups it is testing both a linear (^1^) and quadratic (^2^) trend. If we had 5 groups, it would test a linear (^1^), quadratic (^2^), cubic (^3^), and quartic (^4^) trend. Note that your factor levels must be ordinal for a polynomial contrast to make sense.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/04_one-way-anova/contrasts_polynomial} 

}

\caption{**CAPTION THIS FIGURE!!**}(\#fig:unnamed-chunk-13)
\end{figure}

**Test yourself!** Which contrast would make [most sense]{.ul} to test given that we want to know how our drug compares to the other two drugs? <select class='solveme' data-answer='["repeated"]'> <option></option> <option>deviation</option> <option>simple</option> <option>difference</option> <option>helmert</option> <option>repeated</option> <option>polynomial</option></select>

#### Writing up planned contrasts

Here's some example write-ups of the above results.

> There is a significant difference in mood gain across the three drug conditions, *F* (2, 15) = 18.61, *p* \< .001. Repeated contrasts showed that *Joyzepam* (*M* = 1.48, *SD* = .21) outperformed both *Anxifree* (*M* = .72, *SD* = .39; *p* \< .001) and the placebo condition (*M* = .45, *SD* = .28; *p* \< .001).
>
> (Note how this example makes no sense because our data is not ordinal) There is a significant difference in mood gain across the three drug conditions, *F* (2, 15) = 18.61, *p* \< .001. There was not a significant linear trend across the drug conditions (*p* = .150).

### Post hoc comparisons

Often, we do not have any *a priori* (or planned) predictions or hypotheses about our group differences. In this case, we use post hoc procedures. These procedures do [pairwise comparisons]{.ul} among all of our groups, like t-tests across each of our groups. As we noted on the first page of this handout, this can be highly problematic for our Type I error rate! Therefore, we must perform corrections to control our familywise error rate.

jamovi currently supports five types of post-hoc tests; I generally only use Tukey or Bonferonni:

1.  **No correction**: This doesn't correct for a Type I error at all. Don't use this! I won't even show it. It's bad. Never use it. NEVER. You are warned!
2.  **Tukey**: This is the post hoc test I use most often. It controls the Type I error rate well, but isn't as conservative of a control as the Bonferonni.
3.  **Scheffe**: Honestly, I've never used it. I am not sure how it's calculated.
4.  **Bonferroni**: This is the most conservative test. It's good if you only have a small number of comparisons to make or if you *really* want to control your Type I error rate. If you have a lot of them to test , then you should use something else.
5.  **Holm**: Honestly, I've never used it. I am not sure how it's calculated.

Games-Howell for when you have unequal variances and Tukey for when you have equal variances. They will each calculate your p-values slightly differently but in a way to control for our Type I error rate as best it can. They are interpreted very similarly, so we will proceed with the Tukey's post hoc comparisons because we satisfied the assumption of equal variances.

To request post hoc tests from the one-way ANOVA, open the collapsed menu at the bottom of the setup menu. Select `Tukey (equal variances` under Post-Hoc Test and select `Mean difference`, `Report significance`, and `Flag significant comparisons` under Statistics. Optionally, you can request the `Test results (t and df)` although this is not necessary.

Below shows the post hoc test results for our one-way ANOVA. Notice the differences in p-values across the four post hoc tests and how all other values are the same. Notice how the Bonferroni is most conservative (i.e., has the largest p-values) and the Holm's is the least conservative (i.e., has the smallest p-values). Keep in mind you do not normally ask for multiple post hoc comparisons. Just pick one! Normally, I just pick Tukey's.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/04_one-way-anova/one-way_results_post-hoc} 

}

\caption{Post hoc test results in jamovi}(\#fig:unnamed-chunk-14)
\end{figure}

#### Writing up post hoc results

The way we would write up each of the post hoc comparisons is very similar. Given that I usually use Tukey, here is a write-up for those results:

> There is a significant difference in mood gain across the three drug conditions, *F* (2, 15) = 18.61, *p* \< .001. Post hoc comparisons using Tukey's HSD revealed that our drug *Joyzepam* (*M* = 1.48, *SD* = .21) outperformed both *Anxifree* (*M* = .72, *SD* = .39; *p* = .002) and the placebo condition (*M* = .45, *SD* = .28; *p* \< .001); there were no differences between *Anxifree* and the placebo condition (*p*

### Group differences with violated assumptions

If you are using Welch's F-test using the One-Way ANOVA in jamovi, you should select under Post-Hoc Tests `Games-Howell (unequal variances)`. These will be interpreted similarly to the post hoc comparisons above.

If you are using the Kruskal-Wallis test, you will select the check-box for `DSCF pairwise comparisons`. This stands for the Dwass-Steel-Critchlow-Fligner test. All you need to know is that they, too, are interpreted similarly to the post hoc comparisons above.

Unfortunately, you cannot perform contrasts with either the Welch's F-test or Kruskal-Wallis test.

## Relationship between ANOVA and t-test

An ANOVA with two groups is identical to the t-test. That means the F and t statistics are directly related, and you will get the same p-value. For example, imagine you run a t-test and get a t-statistic of *t* (16) = -1.31, *p* = .210. If you ran it as a one-way ANOVA, you would get an F-statistic of *F* (1, 16) = 1.71, *p* = .210.

$F = t^2$

$t = \sqrt{F}$

Just a fun little bit of trivia! So if you accidentally do an F-test with two groups, no need to go back and redo the analyses (although you should if you are sharing your code for reproducibility). You can just convert your F to a t statistic easily!

## Tips on writing up results

Writing up results in APA style is both a science and an art. There's a science to what you need to report. For example, you always report the statistics exactly the same: *F* (df~WG~, df~BG~) = X.XX, *p* = .XXX. You also always report the group means (*M*) and standard deviations (*SD*), although you can report them in-text like I did above or in a descriptives table like you can ask from jamovi.

However, there's also an art to it. Notice how I wrote that up in a way to summarize the findings as succinctly as possible. I could have said there was a difference between *anxifree* and *joyzepam* and a difference between *joyzepam* and the placebo, but that's a lot more words and isn't written in a way to focus on what I'm hoping to see: that my drug *joyzepam* performed better than the competitor *anxifree* and a placebo condition.

This is where you need to think creatively and be very critical in checking that what you say makes sense. Read your write-ups carefully! Have someone else read it. Can they understand what you mean?

## Your turn!

Open the `Sample_Dataset_2014.xlsx` file that we will be using for all Your Turn exercises. You can find the dataset here: [Sample_Dataset_2014.xlsx Download](https://github.com/danawanzer/stats-with-jamovi/blob/master/data/Sample_Dataset_2014.xlsx)

Perform one-way ANOVAs based on the following research questions. Check your assumptions and ensure you are using the correct tests.

To get the most out of these exercises, try to first find out the answer on your own and then use the drop-down menus to check your answer.

1.  **Does students differ on English scores by rank (i.e., freshmen, sophomore, junior, senior)?**

    -   Do you satisfy the assumption of normality? <select class='solveme' data-answer='["yes"]'> <option></option> <option>yes</option> <option>no</option></select>

    -   Do you satisfy the assumption of homogeneity of variance? <select class='solveme' data-answer='["yes"]'> <option></option> <option>yes</option> <option>no</option></select>

    -   Which statistic should you use? <select class='solveme' data-answer='["one-way ANOVA"]'> <option></option> <option>one-way ANOVA</option> <option>Welch's F-test</option> <option>Kruskal-Wallis test</option></select>

    -   Do students differ on English scores by rank? <select class='solveme' data-answer='["no"]'> <option></option> <option>yes</option> <option>no</option></select>

    -   Should you perform a planned contrast or post hoc comparison? <select class='solveme' data-answer='["no"]'> <option></option> <option>yes</option> <option>no</option></select>

    -   What are the results of the post hoc comparison? <select class='solveme' data-answer='["N/A - Don&apos;t perform"]'> <option></option> <option>N/A - Don't perform</option> <option>Freshmen had higher English scores than sophomores, juniors, and seniors</option> <option>Freshmen and sophomores had higher English scores than juniors and seniors</option></select>

2.  **Does smoking status (Smoking: Nonsmoker = 0, Past smoker = 1, Current smoker = 2) relate to sprint time?**

    -   Do you satisfy the assumption of normality? <select class='solveme' data-answer='["no"]'> <option></option> <option>yes</option> <option>no</option></select>

    -   Do you satisfy the assumption of homogeneity of variance? <select class='solveme' data-answer='["yes"]'> <option></option> <option>yes</option> <option>no</option></select>

    -   Which statistic should you use? <select class='solveme' data-answer='["Kruskal-Wallis test"]'> <option></option> <option>one-way ANOVA</option> <option>Welch's F-test</option> <option>Kruskal-Wallis test</option></select>

    -   Does smoking status relate to sprint time? <select class='solveme' data-answer='["yes"]'> <option></option> <option>yes</option> <option>no</option></select>

    -   Should you perform a planned contrast or post hoc comparison? <select class='solveme' data-answer='["yes"]'> <option></option> <option>yes</option> <option>no</option></select>

    -   What are the results of the post hoc comparison? <select class='solveme' data-answer='["Nonsmokers had significantly faster sprint times than current smokers"]'> <option></option> <option>N/A - Don't perform</option> <option>Nonsmokers had significantly faster sprint times than current smokers</option> <option>Nonsmokers and past smokers had significantly faster spring times than current smokers</option> <option>Nonsmokers had significantly faster sprint times than both past and current smokers</option></select>

<!--chapter:end:04-one-way-anova.Rmd-->

# Repeated Measures ANOVA



## What is the repeated measures ANOVA?

The repeated measures analysis of variance (ANOVA) is used to test the difference in our dependent variable between [three or more]{.ul} groups of observations in which all participants participate in all groups or levels. Our grouping variable is our independent variable. In other words, we use the one-way ANOVA when we have a research question with a **continuous dependent variable** and a **categorical independent variable with three or more categories in which the same participants are in each category**.

The repeated measures ANOVA is also sometimes called the one-way related ANOVA.

There are two ways we could have the repeated measures ANOVA. Perhaps the same group of participants are measured in the same dependent variable at three or more time points. In this case, our independent variable is time and our dependent variable is whatever is measured at each time point.

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{images/05-repeated-measures-anova/Laerd1} 

}

\caption{Repeated measures ANOVA by Time}(\#fig:unnamed-chunk-1)
\end{figure}

The other way we might have the repeated measures ANOVA is if all our participants participate in all conditions of our study. In this case, our independent variable is the treatment or condition and the dependent variable is whatever is measured in each treatment or condition.

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{images/05-repeated-measures-anova/Laerd2} 

}

\caption{Repeated measures ANOVA by Conditions}(\#fig:unnamed-chunk-2)
\end{figure}

## Data set-up

To conduct the repeated measures ANOVA, we first need to ensure our data is set-up properly in our dataset. This requires having two columns: one with our continuous dependent variable and one indicating which group the participant is in. Each row is a unique participant or unit of analysis. Here's what example data may look like if we were testing for differences in a test score by students in my fall, spring, or summer semesters of my course in which three participants are in each of my three courses.

| ID  | Fall | Spring | Summer |
|:----|:-----|:-------|:-------|
| 1   | 86   | 79     | 90     |
| 2   | 80   | 82     | 72     |
| 3   | 75   | 84     | 75     |

: Example data for the repeated measures ANOVA

In the example data above, what is your **independent variable**? <select class='solveme' data-answer='["Semester"]'> <option></option> <option>ID</option> <option>Semester</option> <option>TestScore</option></select>

In the example data above, what is your **dependent variable**? <select class='solveme' data-answer='["TestScore"]'> <option></option> <option>ID</option> <option>Semester</option> <option>TestScore</option></select>

## The math behind the repeated measures ANOVA

The basic math of the repeated measures ANOVA is very similar to the one-way ANOVA except that the $SS_{WG}$ is partitioned into two parts. Since there are the same subjects in each group, we can remove the variability due to the individual differences between subjects from the within-groups variability.

$F = \frac{BG \:variance}{WG \:variance} = \frac{MS_{BG}}{MS_{WG}} = \frac{\frac{SS_{BG}}{df_{BG}}}{\frac{SS_{WG}}{df_{WG}}}$

So whereas our denominator in the one-way ANOVA has $SS_{WG}$, our denominator for the repeated measures ANOVA has $SS_{WG}-SS_{subjects}$. You can see this in more detail in the figure below by Laerd Statistics. The one-way ANOVA (also known as the independent samples ANOVA) splits the total variability in scores by the between-group (conditions) variability and the within-groups (error) variability. The repeated measures anova takes that within-groups variability and splits out the subject variability from the error variability.

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{images/05-repeated-measures-anova/Laerd3} 

}

\caption{Repeated measures ANOVA by Time}(\#fig:unnamed-chunk-3)
\end{figure}

I won't go into any more detail on the math of the repeated measures ANOVA, but you can read more on Laerd Statistics [guide for the repeated measures ANOVA](https://statistics.laerd.com/statistical-guides/repeated-measures-anova-statistical-guide-2.php).

## Assumptions

As a parametric test, the repeated measures ANOVA has the same assumptions as other parametric tests:

1.  The dependent variable is **normally distributed**

2.  Variances in the two groups are roughly equal (i.e., **homogeneity of variances**); in repeated measures ANOVA this is called the assumption of **sphericity**

3.  The dependent variable is **interval or ratio** (i.e., continuous)

4.  ~~Scores are **independent** between groups~~ (this assumption is not relevant because all participants participate in all conditions)

We cannot [test]{.ul} the third and fourth assumptions; rather, those are based on knowing your data. However, we can and should test for the first two assumptions. Fortunately, the one-way ANOVA in jamovi has three check boxes under "Assumption Checks" that lets us test for both assumptions.

### Sphericity Assumption

The sphericity assumption is essentially the repeated measures ANOVA equivalent of homogeneity of variances. Sphericity means there is equality of variances of the *differences* between treatment levels. For example, if there are three groups, then the difference in all three pairs of differences (1-2, 1-3, 2-3) need to have approximately equal variances. You only need to care about sphericity when there are at least three conditions, which is why we did not talk about this with the dependent t-test.

Fortunately, like the other assumption checks, testing for sphericity is as simple as a checkbox in jamovi.

## In jamovi

Let's run an example with data from lsj-data. Open data from your Data Library in "lsj-data". Select and open "broca".

This dataset is hypothetical data in which six patients suffering from Broca's Aphasia (a language deficit commonly experienced following a stroke) complete three word recognition tasks. On the first (speech production) task, patients were required to repeat single words read out aloud by the researcher. On the second (conceptual) task, designed to test word comprehension, patients were required to match a series of pictures with their correct name. On the third (syntax) task, designed to test knowledge of correct word order, patients were asked to reorder syntactically incorrect sentences. Each patient completed all three tasks. The order in which patients attempted the tasks was counterbalanced between participants. Each task consisted of a series of 10 attempts. The number of attempts successfully completed by each patient are provided in the dataset.

1.  To perform a repeated measures ANOVA in jamovi, go to the Analyses tab, click the ANOVA button, and choose "Repeated Measures ANOVA".

2.  Under "Repeated Measures Factors" name your independent variable. In this case you can name it "Task". Rename the three levels of Task: Speech, Conceptual, and Syntax.

3.  Under "Repeated Measures Cells" move the given variable into the correct level. For example, you'll move Speech to the Speech cell.

4.  Select Generalised $\eta^2$ as your measure of effect size.

5.  In the Assumption Checks drop-down menu, select `Sphericity tests`. You'll note that if you violate the assumption of sphericity, there are two corrections provided. These will be discussed later.

6.  In the Post Hoc Tests drop-down menu, select `Tukey`. Remember that we only interpret these if the overall *F* is statistically significant.

7.  In the Estimated Marginal Means drop-down menu, move Task to the Marginal Means box, select `Marginal means tables`, and select `Observed scores` . Uncheck `Equal cell weights`.

When you are done, your setup should look like this:

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{images/05-repeated-measures-anova/rm-anova_setup1} 

}

\caption{Repeated Measures ANOVA setup in jamovi}(\#fig:unnamed-chunk-4)
\end{figure}

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{images/05-repeated-measures-anova/rm-anova_setup2} 

}

\caption{Repeated Measures ANOVA setup in jamovi}(\#fig:unnamed-chunk-5)
\end{figure}

### Checking assumptions in jamovi

You'll notice there are no options to check for normality in the repeated measures ANOVA in jamovi. There's an [interesting conversation](https://forum.jamovi.org/viewtopic.php?f=5&t=1045) on the topic in the jamovi forums. Suffice to say, it's complicated and maybe someday they will implement it. For now, we just won't worry about it for the repeated measures ANOVA.

So what we need to worry about is testing our assumption of sphericity. You should have checked the box `Sphericity tests` under the Assumption Checks drop-down menu. That produces the following output:

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/05-repeated-measures-anova/rm-anova_sphericity} 

}

\caption{Testing sphericity in jamovi}(\#fig:unnamed-chunk-6)
\end{figure}

Mauchly's test of sphericity tests the null hypothesis that the variances of the differences between the conditions are equal. Therefore, just like with our previous assumption checks, if Mauchly's test is non-significant (i.e., *p* \> .05, as is the case in this analysis) then it is reasonable to conclude that the variances of the differences are not significantly different. This means we satisfy the assumption of sphericity and can conclude that the variances of the differences are roughly equal.

If Mauchly's test had been statistically significant (*p* \< .05), then we would conclude that the assumption had *not* been met. In this case, we should apply a correction to the *F*-value obtained in the repeated measures ANOVA:

-   If the Greenhouse-Geisser value in the "Tests of Sphericity" table is \> .75 then you should use the Huynh-Feldt correction.
-   If the Greenhouse-Geisser value is \< .75, then you should use the Greenhouse-Geisser correction.

You can select these corrections in the Assumption Checks drop-down menu.

## Interpreting results

Once we are satisfied we have satisfied the assumptions for the repeated measures, we can interpret our results.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/05-repeated-measures-anova/rm-anova_results} 

}

\caption{One-way ANOVA results in jamovi}(\#fig:unnamed-chunk-7)
\end{figure}

You'll notice that jamovi provides you both a Within Subjects Effects table and Between Subjects Effects table. However, we only have a within-subjects effect (Task). Why did it give us a between-subjects table? With the repeated-measures ANOVA (which only has within-subjects IVs), this is just our $SS_{BG}$. However, because we don't have one, it's not calculating anything. We can ignore it. It is only useful if we are conducting a mixed factorial ANOVA with both between-subjects and within-subjects effects.

Therefore, the Within Subjects Effects table is of most use to us. We can see that the overall effect of Task is statistically significant (*p* = .013). Therefore we can look at our Post Hoc Tests results.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/05-repeated-measures-anova/rm-anova_tukey} 

}

\caption{One-way ANOVA results in jamovi}(\#fig:unnamed-chunk-8)
\end{figure}

The Tukey post hoc differences show that there was a significant difference between speech and syntax (*p* = .011), but not between conceptual and both speech and syntax. Last, we can look at the Estimated Marginal Means - Task table to see the group means for reporting purposes. This shows us that participants recognized significantly more words in the speech task than in the syntax task.

We can write this up in APA style similar to the one-way ANOVA.

> A repeated measures ANOVA was performed examining how three tasks affected word recognition in patients suffering from Broca's Aphasia. Task significantly affected word recall, *F* (2, 10) = 6.93, *p* = .013, $\eta^2_G$ = .41. Tukey's post hoc difference tests indicated that participants recognized significantly more words in the speech task (*M* = 7.17, *SE* = .62) than participants in the syntax task (*M* = 4.33, *SE* = .62; *p* = .011). There were no differences between the conceptual task (*M* = 6.17, *SE* = .62) and both the speech and syntax tasks.

## What if I violated assumptions?

We have already discussed what to do if you violate the assumption of sphericity above; you select one of the two sphericity corrections.

If you violate the assumption of normality or if the dependent variable is ordinal, then you can use the Friedman test. You can select this using the Repeated Measures ANOVA - Friedman option under the ANOVA analysis.

Friedman's test can only examine one within-subjects variable, so you will move all three conditions (Speech, Conceptual, and Syntax) to the Measures box. Select `Pairwise comparisons (Durbin-Conover` for post hoc comparisons and `Descriptives` for the Means and Medians. Optionally, you can select to plot either the Means or Medians. The Setup is shown below.

\begin{figure}

{\centering \includegraphics[width=0.8\linewidth]{images/05-repeated-measures-anova/rm-anova_friedman_setup} 

}

\caption{Repeated Measures ANOVA setup in jamovi}(\#fig:unnamed-chunk-9)
\end{figure}

Once you've set-up the analysis, you can interpret the results. Overall, we continue to see a statistically significant result and that there is only a significant difference between speech and syntax.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/05-repeated-measures-anova/rm-anova_friedman} 

}

\caption{Repeated Measures ANOVA setup in jamovi}(\#fig:unnamed-chunk-10)
\end{figure}

We can write up the results similarly as before:

> Friedman's test was performed examining how three tasks affected word recognition in patients suffering from Broca's Aphasia. Task significantly affected word recall, $\chi^2$ (2) = 6.64, *p* = .036. Pairwise comparisons using Durbin-Conover indicated that participants recognized significantly more words in the speech task (*M* = 7.17, *Mdn* = 7.50) than participants in the syntax task (*M* = 4.33, *Mdn* = 6.50; *p* = .006). There were no differences between the conceptual task (*M* = 6.17, *Mdn* = 6.50) and both the speech and syntax tasks.

## Tips on writing up results

Writing up results in APA style is both a science and an art. There's a science to what you need to report. For example, you always report the statistics exactly the same: *F* (df~WG~, df~BG~) = X.XX, *p* = .XXX. You also always report the group means (*M*) and standard deviations (*SD*), although you can report them in-text like I did above or in a descriptives table like you can ask from jamovi.

However, there's also an art to it. Notice how I wrote that up in a way to summarize the findings as succinctly as possible. I could have said there was a difference between *anxifree* and *joyzepam* and a difference between *joyzepam* and the placebo, but that's a lot more words and isn't written in a way to focus on what I'm hoping to see: that my drug *joyzepam* performed better than the competitor *anxifree* and a placebo condition.

This is where you need to think creatively and be very critical in checking that what you say makes sense. Read your write-ups carefully! Have someone else read it. Can they understand what you mean?

## Your turn!

Open the `Sample_Dataset_2014.xlsx` file that we will be using for all Your Turn exercises. You can find the dataset here: [Sample_Dataset_2014.xlsx Download](https://github.com/danawanzer/stats-with-jamovi/blob/master/data/Sample_Dataset_2014.xlsx)

Perform a repeated measures ANOVA based on the following research questions. Check your assumptions and ensure you are using the correct tests.

To get the most out of these exercises, try to first find out the answer on your own and then use the drop-down menus to check your answer.

1.  **Does students differ on their test scores (English, Reading, Math, Writing)?**

    -   Based on your understanding of the nature of the test scores, which statistic should you use? <select class='solveme' data-answer='["repeated measures ANOVA"]'> <option></option> <option>repeated measures ANOVA</option> <option>Friedman's test</option></select>

    -   Should you apply a sphericity correction? If so, which one? <select class='solveme' data-answer='["yes, Huynh-Feldt"]'> <option></option> <option>N/A - using Friedman's test</option> <option>no, assumption satisfed</option> <option>yes, Greenhouse-Geisser</option> <option>yes, Huynh-Feldt</option></select>

    -   Do students differ on their test scores? <select class='solveme' data-answer='["yes"]'> <option></option> <option>yes</option> <option>no</option></select>

    -   Should you perform a planned contrast or post hoc comparison? <select class='solveme' data-answer='["yes"]'> <option></option> <option>yes</option> <option>no</option></select>

    -   What are the results of the post hoc comparison? <select class='solveme' data-answer='["N/A - Don&apos;t perform"]'> <option></option> <option>N/A - Don't perform</option> <option>All test scores were significantly different from one another</option> <option>All test scores were significantly different from one another except for English and Reading</option></select>

<!--chapter:end:05-repeated-measures-anova.Rmd-->

# Factorial ANOVA



## What is factorial ANOVA?

Factorial ANOVA allows us to examine two or more independent variables (IVs) simultaneously. There are several types of factorial designs:

-   **Independent factorial design**: several between-group (independent) IVs
-   **Repeated measures factorial design**: several within-group (repeated-measures) IVs
-   **Mixed factorial design**: some between-group and some within-group IVs

Furthermore, you may read about ANOVAs referred to as "one-way", "two-way", "three-way" or greater. This simply refers to how many independent variables there are. Factorial ANOVAs are sometimes also referenced by how many groups per IV there are; for example, a 2 x 3 ANOVA is a factorial ANOVA in which the first IV has two conditions and the second IV has three conditions. You would also specify which IVs are between-group and which are within-group. For example, you might write that your design is a 2 (between-subjects: gender) x3 (within-subjects: task) mixed factorial.

We won't be going into too much detail on the different factorial ANOVA designs. Instead, I will walk through illustrative cases so that if you want to apply them in the future you can mimic the procedures below.

## Independent Factorial ANOVA

The independent factorial ANOVA has multiple between-group IVs. Let's run an example with data from lsj-data. Open data from your Data Library in "lsj-data". Select and open "rtfm". This data has two IVs: attend (whether or not the student turned up to lectures) and reading (whether or not the student actually read the textbook). 1 = they did and 0 = they did not.

Because we do not have a within-group IV, we will select the ANOVA analysis. Move grade to your Dependent Variable box and both attend and reading to your Fixed Factors. Select all the same options as you did for the one-way ANOVA (i.e., $\omega^2$, assumption checks, Tukey's post hoc tests for the two variables attend and reading, estimated marginal means).

Let's go through the output (check that your output matches!) and then discuss how to write up the results in APA format. First, we need to check assumptions. The Levene's test and Shapiro-Wilk's test are shown below. We can see that we meet the assumption of normality but fail to meet the assumption of homogeneity of variance. Unfortunately, we cannot perform a Welch's F-test with more than one independent factorial so we will note this failed assumption and move on.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/06-factorial-anova/independent-factorial_assumptions} 

}

\caption{Assumption check results in jamovi}(\#fig:unnamed-chunk-1)
\end{figure}

Let's look at the main results next. We got three lines of results in addition to the typical residuals (error). The first two lines are our main effects of `attend` and `reading` on grades. The p-values for both are statistically significant indicating attend affects grades and reading affects grades. However, it also added an interaction term of `attend * reading`, which is not statistically significant. This means we do not have an interaction between attend and reading on grades. Interactions will be discussed in more detail in the next section.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/06-factorial-anova/independent-factorial_results} 

}

\caption{Independent factorial ANOVA results in jamovi}(\#fig:unnamed-chunk-2)
\end{figure}

Although we could simply look at the means to know whether attending or reading had higher grades than not attending or not reading because there are only two conditions, we can also look at the post hoc tests and definitely need to look at them if we have three or more conditions per IV. These are shown below. Because the mean differences are negative, we can determine that the second group had higher means than the second group. We can confirm that with the estimated marginal means (not shown here).

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/06-factorial-anova/independent-factorial_posthoc} 

}

\caption{Post hoc results in jamovi}(\#fig:unnamed-chunk-3)
\end{figure}

Last, we can write-up our results!

> We were interested in knowing how attendance and reading affected student grades. An independent factorial ANOVA showed that both attendance (*F* [1, 4] = 18.25, *p* = .013, $\omega^2$ = .26) and reading (*F* [1, 4] = 44.17, *p* = .003, $\omega^2$ = .64) affected student grades; there was no significant interaction between attendance and reading (*F* [1, 4] = 8.00, *p* = .660, $\omega^2$ = -.01). Post hoc comparisons using Tukey's HSD show that students who attended lectures (*M* = 75.50, *SE* = 2.98) had higher grades than students who did not (*M* = 57.50, *SE* = 2.98; *p* = .003, *d* = 4.70); furthermore, students who read (*M* = 80.50, *SE* = 2.98) had higher grades than students who did not (*M* = 52.50, *SE* = 2.98; *p* = .013; *d* = 3.02).

### Interactions

Interactions occur when the effect of one IV on the DV depends on the lvel of the other IV. If you did not want to test for interaction effects, you could remove them from the Model Terms in the Model drop-down menu.

However, by default they will include them. If you have 2-3 IVs, it may be reasonable to look at these interactions. However, 3-variable interactions (e.g., IV1 \* IV2 \* IV3) are pushing it and 4-variable interactions are highly implausible. Be critical in which interaction terms you include!

jamovi can provide a plot of your interaction, which can be helpful to help interpret your results. Below is the plot for our interaction of attendance on reading.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/06-factorial-anova/independent-factorial_plot} 

}

\caption{Interaction plot in jamovi}(\#fig:unnamed-chunk-4)
\end{figure}

The parallel lines that are sloping upward tell me there is a significant main effect for both IVs but no interaction. How do I know that? With two variables, there are only so many interaction shapes possible. [This website](https://courses.washington.edu/smartpsy/interactions.htm) does a fantastic time showing you all 8 combinations of the three effects (2 main effects and 1 interaction effect). Spend some time looking through it and familiarizing yourself with the plots!

## Repeated Measures Factorial ANOVA

This is also sometimes called the two-way (or three-way or n-way, depending on the *n* of IVs you have) repeated measures ANOVA. Let's go through an example repeated measures factorial ANOVA. The dataset is courtesy of [Real Statistics Using Excel](https://www.real-statistics.com/anova-repeated-measures/two-within-subjects-factors/).

> A company has created a new training program for their customer service staff. To test the effectiveness of the program they took a sample of 10 employees and assessed their performance in three areas:  Product (knowledge of the company's products and services), Client (their ability to relate to the customer with politeness and empathy) and Action (their ability to take action to help the customer). They then had the same 10 employees take the training course and rated their performance after the program in the same three areas. -[Real Statistics Using Excel](A%20company%20has%20created%20a%20new%20training%20program%20for%20their%20customer%20service%20staff.%20To%20test%20the%20effectiveness%20of%20the%20program%20they%20took%20a%20sample%20of%2010%20employees%20and%20assessed%20their%20performance%20in%20three%20areas:%20Product%20(knowledge%20of%20the%20company’s%20products%20and%20services),%20Client%20(their%20ability%20to%20relate%20to%20the%20customer%20with%20politeness%20and%20empathy)%20and%20Action%20(their%20ability%20to%20take%20action%20to%20help%20the%20customer).%20They%20then%20had%20the%20same%2010%20employees%20take%20the%20training%20course%20and%20rated%20their%20performance%20after%20the%20program%20in%20the%20same%20three%20areas.%20Based%20on%20the%20data%20in%20Figure%201,%20determine%20whether%20the%20program%20was%20effective.)

You can find the dataset here to follow along: [Repeated-measures-factorial-ANOVA.xlsx Download](https://github.com/danawanzer/stats-with-jamovi/blob/master/data/Repeated-measures-factorial-ANOVA.xlsx)

In jamovi, select Repeated Measures ANOVA under the ANOVA analysis option. Here are the general steps:

1.  In Repeated Measures Factors, you'll need to name both factors. Rename `RM Factor 1` to Time and `RM Factor 2` to Area. Under Time, specify two levels: Pre and Post. Under Area, specify three levels: Product, Client, and Action.

2.  In Repeated Measures Cells, you'll now have six cells with the combinations of the 6 columns you have. Drag the variable from the left into the correct cell on the right. Be careful here! For example, you need to put the Pre-Product variable into the cell "Pre, Product".

3.  Name your dependent variable label "Performance" and select \`Generalised $\eta^2$.

4.  Under Assumption Checks, select Sphericity tests

5.  Under Post Hoc Tests, move Area and Time over and select Tukey.

6.  Under Estimated Marginal Means, move Time over into Term 1, Area into Term 2, and both Time and Area into Term 3. Select plots and tables, Observed scores, and Equal cell weights.

Now let's go over selected output. First, we need to check our assumption of sphericity. All the Mauchly's W's are not statistically significant so we satisfy the assumption of sphericity and do not need to apply any sphericity corrections.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/06-factorial-anova/rm-factorial_assumption} 

}

\caption{Assumption testing in jamovi}(\#fig:unnamed-chunk-5)
\end{figure}

Next let's look at the within subjects effects table. Remember, we do not need to worry about the between subjects effects table because we do not have one; it will be used in the mixed factorial design below. Overall, we see a significant main effect of area, a significant main effect of time, and a significant interaction effect of both area and time. Neat!

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/06-factorial-anova/rm-factorial_results} 

}

\caption{Repeated measures ANOVA in jamovi}(\#fig:unnamed-chunk-6)
\end{figure}

Next, we can look at post hoc comparisons because the main effects were all statistically significant. For area, we can see that client and action had significantly higher means than product, but there was no difference between client and action. Furthermore, post-intervention performance was significantly higher than pre-intervention.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/06-factorial-anova/rm-factorial_tukey} 

}

\caption{Post hoc tests in jamovi}(\#fig:unnamed-chunk-7)
\end{figure}

Last, let's look at the interaction to get a sense of what the interaction looks like. It appears that although there are no differences between pre- and post-intervention for product, there are significant differences from pre- to post-intervention for both client and action. To be more specific on where the statistically significant differences are, you can also ask for post hoc tests for the interaction term. This is where including a plot can be very helpful for your audience!

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/06-factorial-anova/rm-factorial_interaction} 

}

\caption{Interaction plot in jamovi}(\#fig:unnamed-chunk-8)
\end{figure}

Now we have everything we need (in addition to the estimated marginal means) and can write-up our results.

> We tested a 2 (time: pre- and post-intervention) x 3 (area: product, client, action) repeated measures factorial design to examine how both time and area affected performance. We satisfied the assumption of sphericity for all effects. There was a significant main effect of time (*F* [1, 9] = 33.85, *p* \< .001, $\eta^2_G$ = .25) such that performance at post-intervention (*M* = 26.80, *SE* = 1.84) was higher than at pre-intervention (*M* = 19.37, *SE* = 1.84). There was also a significant main effect of area (*F* [2, 18] = 26.96, *p* \< .001, $\eta^2_G$ = .36) such that both client (*M* = 25.10, *SE* = 1.95) and action (*M* = 27.65, *SE* = 19.5) performance was higher than product performance (*M* = 16.50, *SE* = 1.95), but there was no difference between client and action performance. Lastly, there was a significant interaction between time and area such that there were no differences in product performance from pre- to post-intervention but there was for client and action performance (see Figure 1).

## Mixed Factorial ANOVA

You can find the dataset here to follow along: [mixed-factorial.sav Download](https://github.com/danawanzer/stats-with-jamovi/blob/master/data/mixed-factorial.sav)

This dataset comes from a larger studying examining the effect of a delayed reward preference of three commodities (food, money, and music) on food cravings (as rated by the Food Craving Questionnaire [FCQ]) for each participant. Participants were in one of two conditions: the control condition did not do anything and the experimental condition had participants do the tasks while fasting.

Therefore, this study is a 2 (between-subjects: condition [control or fasting]) x 3 (within-subjects: reward [food, money, and music]) mixed factorial design.

To perform a mixed factorial ANOVA, we use the same procedures as the repeated measures ANOVA but we also need to add a between-subjects factor.

1.  To perform a mixed factorial ANOVA in jamovi, go to the Analyses tab, click the ANOVA button, and choose "Repeated Measures ANOVA".

2.  Under "Repeated Measures Factors" name your independent variable. In this case you can name it "Reward". Rename the three levels of Task: Food, Money, and Music.

3.  Under "Repeated Measures Cells" move the given variable into the correct level. For example, you'll move FQ_1 to Food, FQ_2 to Money, and FQ_3 to Music.

4.  Under "Between Subject Factors" add your between-subjects variable "condition.

5.  Select Generalised $\eta^2$ as your measure of effect size.

6.  In the Assumption Checks drop-down menu, select `Sphericity tests`.

7.  In the Post Hoc Tests drop-down menu, move your two independent variables over and select `Tukey`. Remember that we only interpret these if the overall *F* is statistically significant.

8.  In the Estimated Marginal Means drop-down menu, move Reward, Condition, and both reward and condition into the terms under Marginal Means. Select tables and plots, and select `Observed scores`. Uncheck `Equal cell weights`.

Now let's go through the output!

First, as always we check our assumption of sphericity. Mauchly's W is not statistically significant (*p* = .073) so we satisfy the assumption of sphericity. We do not need to apply a sphericity correction.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/06-factorial-anova/mixed_assumptions} 

}

\caption{Assumption checking in jamovi}(\#fig:unnamed-chunk-9)
\end{figure}

Next, we interpret out output! This time we interpret both our within subjects effects and between subjects effects tables. In the within subjects effects table, our main effect of reward is statistically significant. In the between subjects effects table, our main effect of condition is statistically significant. However, in the within subjects effects table, there is no statistically significant interaction effect of reward on condition.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/06-factorial-anova/mixed_results} 

}

\caption{Mixed factorial ANOVA in jamovi}(\#fig:unnamed-chunk-10)
\end{figure}

To understand where the differences lie between conditions or reward preferences, we look to our post hoc tests. For reward, it looks like there is only a significant difference between food and music (*p* = .009). For condition, it looks like cravings were higher in the fasting group than in the control group. We can look at the estimated marginal means tables to find the actual Means of the conditions and see the plots.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/06-factorial-anova/mixed_posthoc} 

}

\caption{Post hoc tests in jamovi}(\#fig:unnamed-chunk-11)
\end{figure}

We can look at the interaction plot, but notice that the lines are parallel which is a good indication that there is no significant interaction.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/06-factorial-anova/mixed_interaction} 

}

\caption{Interaction plot in jamovi}(\#fig:unnamed-chunk-12)
\end{figure}

Lastly, we can write up the results in APA style!

> To test how both condition (control or fasting) and reward preference (food, money, and music) affected food cravings, we performed a mixed factorial ANOVA. There was a significant main effect of condition (*F* [2, 196] = 4.45, *p* = .013, $\eta^2_G$ = .00) and a significant main effect of reward (*F* [1, 98] = 82.44, *p* \< .001, $\eta^2_G$ = .43). However, there was no statistically significant interaction effect of reward on condition (*F* [2, 196] = .66, *p* = .519, $\eta^2_G$ = .00).
>
> For condition, participants who fasted (*M* = 3.81, *SE* = .11) reported significantly more food cravings than participants in the control condition (*M* = 2.33, *SE* = .11; $p_{Tukey}$ \< .001). For reward, the food reward (*M* = 3.14, *SE* = .09) led to significantly higher food cravings than the music reward (*M* = 3.00, *SE* = .09; $p_{Tukey}$ = .009), but there was no differences between the money reward (*M* = 3.07, *SE* = .09) and both food ($p_{Tukey}$ = .340) or music ($p_{Tukey}$ = .258).

<!--chapter:end:06-factorial-anova.Rmd-->

# ANCOVA



## What is ANCOVA?

**ANCOVA** (**AN**alysis of **COVA**riance) examines the difference in means between [three or more]{.ul} groups, while controlling for or partialling out the effect of one or more continuous confounds or covariates.

**Some definitions**: A *confounding* variable is a variable that affects or is related to both the independent and dependent variable. A *covariate* variable is a variable that only affects or is only related to the dependent variable.

There are two main reasons for including covariates:

1.  **To reduce within-group error variance**: Remember that to get a larger F-statistic, we need to maximize between-groups variance and minimize within-groups variance. Adding covariates can sometimes minimize within-groups variance if that covariate helps *explain* some of the within-group variance.

2.  **Elimination of covariates**: Sometimes there are other variables that also explain our outcome variable. We want to look at the effect of another variable on the outcome while removing or eliminating the other variables (confounds) that also explain our outcome variable.

## Assumptions of ANCOVA

In addition to the same assumptions of the one-way ANOVA (see \@ref(anova-assumptions)), the ANCOVA has two additional assumptions:

1.  **Independence of the covariate and treatment effect**: When the covariate and treatment effect are related, then we can have incorrect F-statistic values. However, this is only important in experimental designs. In quasi-experimental designs, this is often violated and you just have to interpret results accordingly.

    -   If you do have an experimental manipulation with a covariate, you can test this assumption by running a one-way ANOVA but with your experimental manipulation as your IV or group variable and your covariate as your DV. If there is a significant F-ratio, then you have violated this assumption.

2.  **Homogeneity of regression slopes**: The relationship between the covariate and the outcomes must be similar across groups.

    -   To test this assumption, add an interaction term between the covariate and each independent variable in jamovi under the Model drop-down menu. Add the interactions as model terms.

## ANCOVA in jamovi

Let's run an example with data from lsj-data. Open data from your Data Library in "lsj-data". Select and open "ancova". This data is fictional data from a health psychologist who was interested in the effect of routine cycling (1 = driving, 2 = cycling) and stress (1 = high, 2 = low) on happiness levels, with age as a covariate. Notice how this is a 2x2 independent factorial design with a covariate!

1.  To perform an ANCOVA in jamovi, select ANCOVA under the ANOVA analysis menu.

2.  Move your dependent variable `happiness` to the Dependent Variable box, your independent variables `stress` and `commute` to the Fixed Factors box, and your covariate `age` to the Covariates box.

3.  Select $\omega^2$ as your effect size.

4.  Under Assumption Checks, select all three assumption checks: `Homogeneity test`, `Normality test`, and `Q-Q Plot`.

5.  Under Post Hoc Tests, move both of your independent variables over, select the `Tukey` correction and select `Cohen's d` for your effect size.

6.  Under Estimated Marginal Means, move each of your independent variables over into its own term box. Also include combinations of your independent variables if you have an interaction term in your model. Select both plots and tables, select `Observed scores`, and de-select `Equal cell weights`.

First, let's check our assumptions in jamovi. Shapiro-Wilk's test was not statistically significant (*p* = .735) and the Q-Q plot looks good; therefore, we've satisfied the assumption of normality. Levene's test was not statistically significant (*p* = .925); therefore, we've satisfied the assumption of homogeneity of variance.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/07-ancova/ancova_assumptions} 

}

\caption{Assumption check results in jamovi}(\#fig:unnamed-chunk-1)
\end{figure}

However, we have two additional assumptions we need to check. Let's check the assumption of independence of the covariate and treatment effect. For that, we need to perform another ANOVA (not an ANCOVA) with our independent variables predicting age. Our results indicate we violate this assumption: both `stress` and the interaction of `stress * commute` are related to age. This suggests age is in fact a *confounding* variable, not a covariate. We should be performing a mediation, but because we want to illustrate the ANCOVA we will continue.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/07-ancova/ancova_assumptions2} 

}

\caption{Assumption check results in jamovi}(\#fig:unnamed-chunk-2)
\end{figure}

The second additional assumption is that the relationship between the covariate and the dependent variable is similar for all levels of the independent variable (homogeneity of regression slopes). We can test this by adding an interaction term between the covariate and each independent variable in jamovi under the Model drop-down menu. If the interaction effect is not significant it can be removed. If it is significant then a different and more advanced statistical technique might be appropriate (which is beyond the scope of this class). In our case, the interactions between each IV and our covariate are not statistically significant so we can remove the interaction terms and move on.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/07-ancova/ancova_assumptions3} 

}

\caption{Assumption check results in jamovi}(\#fig:unnamed-chunk-3)
\end{figure}

Now it's time to interpret the results! The ANCOVA table shows that both independent variables (`stress` and `commute`), the interaction term (`stress * commute*`), and the covariate (`age`) are statistically significant. Therefore, we can look at our post hoc tests to find where the differences are.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/07-ancova/ancova_results} 

}

\caption{ANCOVA results in jamovi}(\#fig:unnamed-chunk-4)
\end{figure}

\begin{info}
Technically, we don't need to look at the post hoc table much in this
example. Because there are only two groups, we already know one group
will have higher means than the other group if the F-test is
significant. In fact, check this out: the square root of our F-statistic
is equal to the t-statistic in our post hoc table. Neat!
\end{info}

Post hoc tests show that low stress had higher happiness than high stress, and that cycling had higher happiness than driving. We can also look to the estimated marginal means tables and plots for information for reporting.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/07-ancova/ancova_tukey} 

}

\caption{Post hoc results in jamovi}(\#fig:unnamed-chunk-6)
\end{figure}

Last, we can write-up our results! Reporting ANCOVA is very similar to reporting an ANOVA test (in this case an independent factorial ANOVA) except that we also report the effect of the covariate, as well. Here's an example write-up:

> We conducted a study examining how stress and commute affect happiness levels in a 2 (stress: high or low) x 2 (commute: cycling or driving) independent factorial design. Furthermore, we collected data on age as a covariate of our study. We satisfied all assumptions of the ANCOVA except that age was in fact a confounding variable in that it relates to our independent variable of stress. Despite failing to meet this assumption, we proceeded with the ANCOVA analysis.
>
> There was a significant main effect of stress on happiness such that participants in the low stress condition (*M* = 68.45, *SE* = 2.55) reported significantly greater happiness than participants in the high stress condition (*M* = 39.85, *SE* = 2.55), *F* (1, 15) = 52.61, *p* \< .001, $\omega^2$ = .39. There was also a significant main effect of commute on happiness such that participants who commuted via cycling (*M* = 64.70, *SE* = 2.29) reported significantly greater happiness than participants who commuted via driving (*M* = 43.60, *SE* = 2.29), *F* (1, 15) = 42.33, *p* \< .001, $\omega^2$ = .31. There was a significant interaction between stress and commute type such that happiness levels were similar in the low stress condition for both commute types, but happiness was significantly higher for participants who cycled versus those who drove in the high stress condition, *F* (1, 15) = 14.15, *p* = .002, $\omega^2$ = .10. Furthermore, age was a significant covariate of our dependent variable, *F* (1, 15) = 6.39, *p* = .023, $\omega^2$ = .04.

\begin{figure}

{\centering \includegraphics[width=1\linewidth]{images/07-ancova/ancova_interaction} 

}

\caption{Interaction in jamovi}(\#fig:unnamed-chunk-7)
\end{figure}

<!--chapter:end:07-ancova.Rmd-->

# (APPENDIX) Appendices {-} 

<!--chapter:end:appendix-0.Rmd-->

# References

<!--chapter:end:references.Rmd-->

