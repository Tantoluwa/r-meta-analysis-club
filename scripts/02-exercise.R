# =============================================================
# HOMEWORK after session one
#
# Different dataset, same seven steps. Work through it alone or
# in your pair, then bring your answers to the next meeting.
#
# If you get stuck, note exactly WHERE. The sticking points are
# as useful to discuss as the answers.
# =============================================================

library(metafor)


# The data: 9 studies of length of hospital stay.
# m1i/sd1i/n1i = mean, SD, n in group 1
# m2i/sd2i/n2i = mean, SD, n in group 2

dat2 <- dat.normand1999
dat2


# STEP 1 — effect size.
# Note the measure has changed to "MD" (mean difference), because
# this time the studies report means rather than counts.

dat2 <- escalc(measure = "MD",
               m1i = m1i, sd1i = sd1i, n1i = n1i,
               m2i = m2i, sd2i = sd2i, n2i = n2i,
               data = dat2)

head(dat2)


# STEP 2 — pool.

res2 <- rma(yi, vi, data = dat2)
res2


# -------------------------------------------------------------
# YOUR FOUR QUESTIONS — write the answers down
# -------------------------------------------------------------

# Q1. What is the pooled effect and its 95% confidence interval?
#     (Look under "Model Results".)




# Q2. What is I^2 here? What does that value tell you about whether
#     a single pooled number is a fair summary of these 9 studies?




# Q3. Run the line below. How does the prediction interval compare
#     with the confidence interval, and WHY do they differ?

predict(res2, digits = 2)




# Q4. Produce a forest plot with study labels. Which study carries
#     the most weight, and what is it about that study that gives
#     it the most weight?
#
#     Hint: the source column is called "source".
#     Hint: look at the size of each square.

forest(res2, slab = dat2$source, header = "Study")




# -------------------------------------------------------------
# STRETCH, only if the above went smoothly
# -------------------------------------------------------------

# Which single study is most influential? Drop each one in turn
# and see how much the pooled estimate moves.

leave1out(res2)

# And a visual version:

plot(influence(res2))

# Q5 (stretch). Does any single study change the conclusion if removed?
