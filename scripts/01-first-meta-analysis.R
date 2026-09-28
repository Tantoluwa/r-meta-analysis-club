# =============================================================
# SESSION ONE: your first meta-analysis
#
# Type these lines yourself. Do not paste.
# Run one line at a time: put the cursor on it and press
#   Ctrl + Enter   (Windows)   or   Cmd + Enter   (Mac)
#
# Anything after a # is a note. R ignores it.
# =============================================================


# -------------------------------------------------------------
# PART 0 — check R works at all
# -------------------------------------------------------------

2 + 2        # R prints [1] 4. The [1] just means "first item". Ignore it.


# -------------------------------------------------------------
# PART 1 — the three ideas
# -------------------------------------------------------------

# IDEA 1: OBJECTS. The arrow <- puts a thing in a named box.

my_number <- 42
my_number

# A box can hold a list of values. c() means "combine these".

log_reductions <- c(5.1, 4.8, 5.4, 3.9)
log_reductions

# Look at the Environment pane, top right. Your boxes are listed there.
# That pane is a reality check: if you expected 40 rows and see 4,
# something went wrong.


# IDEA 2: FUNCTIONS. A verb, then brackets, then what it acts on.

mean(log_reductions)
round(3.14159, digits = 2)

# The things inside the brackets are called arguments.
# To find out what a function wants:

?mean        # help opens bottom right. Scroll to the examples at the bottom.


# IDEA 3: PACKAGES. Add-ons other people wrote.
# Install ONCE ever. Load EVERY session.

# install.packages("metafor")     # uncomment and run if you have not yet

library(metafor)                  # this line, every single time

# Most common beginner error: installing is not loading.
# "could not find function" almost always means a missing library() call.


# -------------------------------------------------------------
# PART 2 — the meta-analysis itself
# -------------------------------------------------------------

# Example data that ships with the package: 13 trials of the BCG vaccine.
# The topic does not matter. The SHAPE matters: several studies,
# each with a result and a sample size. Your extraction sheet
# will look the same.

dat <- dat.bcg
dat

# Columns: tpos / tneg = cases and non-cases in the vaccinated group
#          cpos / cneg = cases and non-cases in the control group


# STEP 1 — convert raw counts into a comparable EFFECT SIZE.
#
# Studies differ in size and in what they report, so you cannot
# average their results directly. First put every study into a
# common currency.

dat <- escalc(measure = "RR",
              ai = tpos, bi = tneg,
              ci = cpos, di = cneg,
              data = dat)

head(dat)

# Two new columns appeared:
#   yi = the effect size (here a log risk ratio)
#   vi = its variance. Small for big precise studies, large for small noisy ones.
#
# THIS is the line that changes with your outcome:
#   "SMD" — comparing two group means
#   "MN"  — pooling a single mean (e.g. log10 limit of detection)
#   "PFT" — proportions (e.g. cross-reactions / panel size)
# Everything after this step is identical whichever you pick.


# STEP 2 — pool them.

res <- rma(yi, vi, data = dat)
res

# rma = random-effects meta-analysis. It weights each study by its
# precision, so a large careful study counts for more than a small
# rough one.
#
# That is the whole meta-analysis. Two lines.


# -------------------------------------------------------------
# PART 3 — reading the output
# -------------------------------------------------------------

# Bottom block, "Model Results": estimate, se, zval, pval, ci.lb, ci.ub
# estimate = your pooled effect. ci.lb/ci.ub = its 95% confidence interval.
# The effect was logged, so exponentiate to get a readable scale:

predict(res, transf = exp, digits = 2)


# The HETEROGENEITY block is the part people skip and should not.
# It tells you whether a single pooled number means anything.
#
#   tau^2  variance of true effects between studies
#   I^2    % of variation that is real difference, not chance
#          (roughly: <40% modest, >75% substantial)
#   H^2    above 1 means heterogeneity is present
#   Q      formal test, underpowered with few studies
#
# High heterogeneity is NOT a failure. In a methods-focused
# meta-analysis it is usually the finding: it means design choices matter.


# ALWAYS report the prediction interval.

predict(res, digits = 2)

# Confidence interval = where the AVERAGE effect lies.
# Prediction interval = what a NEW study would plausibly get.
# When heterogeneity is high these are very different,
# and the prediction interval is the honest summary.


# -------------------------------------------------------------
# PART 4 — does something explain the disagreement?
# -------------------------------------------------------------

# Studies rarely agree. The interesting question is usually why.
# ablat = each trial's absolute latitude.

res_mod <- rma(yi, vi, mods = ~ ablat, data = dat)
res_mod

# In OUR analysis this is where target gene class, assay platform
# or test standard would go.
#
# Look at two things:
#   - the test of moderators near the top: does it explain anything?
#   - R^2: what % of between-study variance it accounts for.
# Significant but explaining 5% has not really explained much. Say so.


# -------------------------------------------------------------
# PART 5 — the plot everyone recognises
# -------------------------------------------------------------

forest(res)

# Make it readable:

forest(res,
       slab   = paste(dat$author, dat$year),   # paste() glues text together
       xlab   = "Risk ratio",
       header = "Study")

# How to read it: if the whiskers mostly overlap, the studies broadly
# agree. If they sit in clearly separate places, that is the
# heterogeneity the numbers were telling you about.


# Funnel plot: a check for publication bias.
# Only meaningful with roughly 10+ studies.

funnel(res)
regtest(res)     # Egger's test


# Saving a plot reproducibly:

# png("forest.png", width = 2000, height = 1400, res = 200)
# forest(res)
# dev.off()        # this line is essential. It closes the file.


# =============================================================
# WHEN IT BREAKS — the five you will actually hit
#
# could not find function "rma"
#     -> package not loaded. Run library(metafor)
#
# there is no package called 'metafor'
#     -> not installed. Run install.packages("metafor")
#
# object 'dat' not found
#     -> typo, or you skipped a line. R is case sensitive:
#        Dat and dat are different things.
#
# cannot open file 'something.xlsx'
#     -> R is looking in the wrong folder. Use an RStudio Project.
#        Check with getwd()
#
# argument "vi" is missing
#     -> the function needs something you did not supply. Run ?rma
#
# Console shows + instead of > ?
#     -> R thinks your command is unfinished (unclosed bracket or quote).
#        Press Escape and fix the line.
#
# "Warning message:" means it ran but something is worth noticing.
# "Error:" means nothing ran.
#
# Tangled? Clear memory and re-run this script from the top:
#     rm(list = ls())
# =============================================================
