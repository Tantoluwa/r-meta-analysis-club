# =============================================================
# SESSION TWO: your own extraction sheet
#
# Everything here uses data/example-extraction.csv, a small FAKE
# extraction sheet shaped like a real one. Swap in your own when
# you have it.
# =============================================================

library(metafor)


# -------------------------------------------------------------
# PART 1 — how your spreadsheet should look BEFORE it comes near R
# -------------------------------------------------------------

# - One header row at the very top. No merged cells, no title banner.
# - One row per DATASET, not per paper. Keep a `study` column so
#   several rows from one paper can be linked.
# - Column names with no spaces or symbols:
#       log_lod      good
#       Log LoD (copies/rxn)   bad
#   Put the units in your codebook instead.
# - Empty cells genuinely empty. Not "NA", "-", "n/a" or "ND".
# - Numbers as numbers. A column containing "<0.5" is TEXT and R
#   will refuse to average it.


# -------------------------------------------------------------
# PART 2 — import
# -------------------------------------------------------------

# First: File > New Project > Existing Directory, and pick this folder.
# That makes R look here for files, which prevents the single most
# common beginner frustration.

dat <- read.csv("data/example-extraction.csv")

# For Excel instead:
# library(readxl)
# dat <- read_excel("data/extraction.xlsx")


# ALWAYS run these three lines after importing. Every time.

nrow(dat)      # does the row count match your sheet?
names(dat)     # are the column names what you expect?
str(dat)       # is each column the right TYPE?

# In str() output: num = numeric, chr = text.
# A column you expect to be numeric showing as chr means there is a
# stray symbol in it somewhere. Find it with:

unique(dat$mean_t)

# The $ means "this column of that dataset". Most-used symbol in R
# after the assignment arrow.


# -------------------------------------------------------------
# PART 3 — effect sizes and a first pool
# -------------------------------------------------------------

dat <- escalc(measure = "SMD",
              m1i = mean_t, sd1i = sd_t, n1i = n_t,
              m2i = mean_c, sd2i = sd_c, n2i = n_c,
              data = dat)

res <- rma(yi, vi, data = dat)
res


# -------------------------------------------------------------
# PART 4 — the problem this session exists to solve
# -------------------------------------------------------------

# Look at the data: Adeyemi 2019 contributes TWO rows.
# The model above treated them as two independent studies. They are not.
# Ignoring that makes the confidence interval too narrow.

table(dat$study)


# FIX 1 — a three-level model: dataset nested inside study.

res3 <- rma.mv(yi, vi,
               random = ~ 1 | study/dataset_id,
               data   = dat,
               method = "REML")
summary(res3)

# Compare the confidence interval with res above. It should be wider.


# FIX 2 — cluster-robust variance, as a cross-check.

robust(res, cluster = dat$study)

# Report one as your main analysis and the other as a sensitivity check.
# Decide WHICH is main before you look at the results.


# -------------------------------------------------------------
# PART 5 — moderators: the actual research question
# -------------------------------------------------------------

# Does target gene class explain any of the disagreement?

mod_target <- rma(yi, vi, mods = ~ target_class, data = dat)
mod_target

# Does platform?

mod_platform <- rma(yi, vi, mods = ~ platform, data = dat)
mod_platform

# Both together:

mod_full <- rma(yi, vi, mods = ~ target_class + platform, data = dat)
mod_full

# mod_full$R2 = % of between-study variance explained.
# Test your CONFIRMATORY moderators first, in the order you
# pre-specified. Anything else gets labelled post hoc in the paper.
# This is a discipline, not a formality.


# -------------------------------------------------------------
# PART 6 — plots with real labels
# -------------------------------------------------------------

forest(res,
       slab   = paste(dat$study, "-", dat$platform),
       xlab   = "Standardised mean difference",
       header = "Study and platform")


# -------------------------------------------------------------
# PART 7 — sensitivity analyses you should pre-specify
# -------------------------------------------------------------

# Leave one out:
leave1out(res)

# Drop a subgroup you have doubts about:
rma(yi, vi, data = subset(dat, platform != "conventional_PCR"))

# Restrict to low risk of bias (once you have that column):
# rma(yi, vi, data = subset(dat, rob_overall == "low"))
