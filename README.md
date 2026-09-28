# R for meta-analysis: journal club

A hands-on introduction to meta-analysis in R for people who have never used R.
Worked through live, laptops open, over four sessions.

## Before session one

Do this **before** you arrive. It is the only pre-work.

1. Install R from [cran.r-project.org](https://cran.r-project.org)
2. Install RStudio Desktop (free) from [posit.co/download/rstudio-desktop](https://posit.co/download/rstudio-desktop)
3. Open RStudio once to check it launches
4. Reply to confirm it opened

Nothing else. Do not try to read ahead.

## Getting these files

If you know git:

```
git clone <repo-url>
```

If you do not, click the green **Code** button, then **Download ZIP**, and
unzip it somewhere you can find again.

Then open `r-meta-analysis-club.Rproj` if present, or in RStudio go to
File, then Open Project, and pick this folder.

## Installing the packages

Run this once, in the RStudio Console:

```r
install.packages(c("metafor", "readxl"))
```

It prints a lot of text. That is normal.

## What is in here

| File | What it is |
| --- | --- |
| `scripts/01-first-meta-analysis.R` | Session one. Type along with this |
| `scripts/02-exercise.R` | Homework after session one |
| `scripts/03-your-own-data.R` | Session four. Importing a real extraction sheet |
| `data/example-extraction.csv` | A small fake extraction sheet to practise importing |
| `FACILITATOR.md` | Run sheet and timings, for whoever is leading |
| `CURRICULUM.md` | Learning outcomes, session plans, assessment approach |
| `assessment/qualtrics-instruments.md` | Full survey wording, ready to paste into Qualtrics |

## Session one, about 90 minutes

Orientation, the three core ideas (objects, functions, packages), then a
working meta-analysis in seven lines, reading the output, and a forest plot.

**The checkpoint:** by the end everyone has produced their own forest plot,
on their own machine, from a script they saved.

## The rest of the series

Four sessions in total, fortnightly. Session two covers interpreting the
output, session three is a critique of a published meta-analysis, and
session four uses your own extraction data.

See `CURRICULUM.md` for the full plan and learning outcomes.

## A note on nerves

Nothing you type can break anything. R reads a copy of your data into memory
and leaves the original file alone. The worst outcome of any mistake is a red
error message, and `01-first-meta-analysis.R` ends with a list of the five you
will actually see and what each one means.

## Where to go next

- *Doing Meta-Analysis in R* by Harrer, Cuijpers, Furukawa and Ebert. Free
  online, written for people without a statistics background.
- [metafor-project.org](https://www.metafor-project.org) for worked examples
  of almost any situation.
