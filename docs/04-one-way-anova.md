# (PART) ANOVA {.unnumbered}

# One-way ANOVA



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

## Assumptions  {#anova-assumptions}

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

Open the `Sample_Dataset_2014.xlsx` file that we will be using for all Your Turn exercises.

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
