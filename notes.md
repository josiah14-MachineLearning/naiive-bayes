# Problems with Pure Bayes

## Main problem

- It's unlikely that I'll see all Permutations in my training set, but pure Bayesian reasoning presumes I've got a significant sample size of every permutation.
  - If you had enough data, this problem would be irrelevant.

## Secondary problem

- Pure Bayes is not ordinal
  - It's a matter of what model you're trying to fit to your data.  Each "person" comes with a set of random variables or "tags".  If you have a continuous variable like weight - the heavier you are, the more likely heart disease is <- Bayes cannot learn this principal (althought you could expand the variable set to do things like that by using Binning strategies, )
  
## Conclusion

Therefore, we (most often) can't use Pure Bayes, and so we end up using Naiive Bayes in practice.
  
# Naive Bayes

Can do better with (much) less data.

## What Naive Bayes is...

Bayes, but assumes all random variables are independent (decoupled).

Look at each random variables and ask how they are related in Bayesian, Naive Bayes
cuts this investigation short by assuming they're all not related.

## Naive Bayes Surprise

Even when the Naive Bayes assumption is demonstrably false, it still often tends to
rank alternative classifications well (i.e. it still tends to do a good job at
arriving at the right answer).

The reason it works, even if the independence assumption is false, the algo often
still does a good job of classifying the test experiments into the right bins.

## Main Problems

### Problem 0

Assumes every random variable is independent of all other random variables. 
Therefore, Naive Bayes cannot model random variable interactions.

### Potential fix

If strong interaction between 2 variables is suspected, you could add in a
new variable to model the interaction.

### Problem 1

Cannot ignore variables like you can in decision trees.

## Potential fix

Identify and omit the variables that don't help.  One approach to that is that
Akaike information criteria strategy. There are also other approaches.

### Problem 2

Cannot abide the presence of a 0/Zero in any bins

### Standard Fixes

- Turn zeros into the minimum value

### Problem 3

There's several different ways to handle `NULL`s in random variable fields:

#### Approach 0

Leave them out and calculate the probability without them
  
#### Approach 1

Set them to the median or mean (median helps resolve skewing issues).

#### Reasons for Caution

If a large percentage of the data is missing a particular random variable,
and you fill-in with mean/median, you (_could_) create a "_spike_" at that point.

Plotting can help catch these spikes.


# Tangent - Introducing your own Random Variables/Descriptive Features

This is a **good approach** for many machine learning algorithms and approaches,
but it must be used in moderation because adding too many could result in overfitting.

## Akaike

Tries to do 2 things

1. Improve the accuracy of your fit.
1. Reduce the complexity of the model.

These 2 objectives often disagree, so it's beneficial to dive into the trade-offs, Akaike
has one way of balancing these trade-offs, but there's other approaches also that may
have greater benefits depending on the circumstances.
