# Curriculum and assessment plan

Trant Lab journal club: R for meta-analysis.
Four sessions, approximately 90 minutes each, delivered fortnightly.

---

## 1. Explaining R in plain language

Written to be said out loud, not read.

### What R is, in one breath

> "R is a calculator you write instructions to instead of clicking. The
> instructions get saved, so you can run the same analysis again next year
> and get the same answer, and so can anyone you send it to."

That last part is the selling point. Excel gives you a number. R gives you a
number plus a receipt.

### Why not just use Excel or Prism?

Don't dismiss them. Say this instead:

> "Prism is excellent and you should keep using it. But if a reviewer asks
> how you got your pooled estimate, you can send them four lines of R and
> they can reproduce it exactly. You cannot send someone a sequence of
> mouse clicks."

### The three ideas, as analogies

**Objects are labelled boxes.**

> "When you write `my_data <- something`, you are putting a thing in a box
> and writing a name on the outside. From then on you can just say the name.
> The Environment pane, top right, is your shelf of boxes. If you expected a
> box with 40 rows in it and the shelf says 4, something went wrong."

**Functions are verbs with a bag.**

> "`mean()` is a verb. What goes inside the brackets is what you hand it.
> `mean(my_numbers)` is 'average, please, these'. Some verbs need more than
> one thing handed to them, which is why the brackets sometimes get long."

**Packages are borrowed toolkits.** Spend a minute on this one; it saves the
most confusion.

> "R comes with basic tools. Someone else already wrote the meta-analysis
> tools and put them in a toolkit called metafor. You download that toolkit
> onto your computer once, with `install.packages`. But every time you sit
> down to work you still have to take it off the shelf and open it, with
> `library`. Downloading it once does not mean it is open. Nine out of ten
> times someone tells me a function does not exist, they have downloaded the
> toolkit and not opened it."

### The bit that makes meta-analysis click

Skip the statistics. Say this:

> "Every study measured the same thing badly, in a slightly different way,
> with a different number of samples. You cannot just average their answers,
> because a study with six replicates should not count the same as one with
> sixty. So you do two things. First you put every study into the same
> currency, which is what `escalc` does. Then you take a weighted average
> where the careful studies count for more, which is what `rma` does. That
> is the whole idea. Everything else is detail."

### The forest plot, before they see one

> "One line per study. The square is that study's answer, and the square is
> bigger when the study was bigger. The whiskers are how uncertain it was.
> The diamond at the bottom is everyone put together. If the whiskers all
> overlap, the studies agree. If they are scattered, they do not, and the
> interesting work is figuring out why."

### What to say about errors

Say it *before* the first error happens, not after:

> "You are going to see red text. Everyone does, constantly, including me.
> Red text is R telling you what it needs, not R telling you that you are
> bad at this. There are about five errors you will meet, and by the end of
> today you will recognise all of them."

### Three things to avoid saying

- **"It's easy."** If it then is not easy for someone, they conclude the
  problem is them.
- **"Just."** As in "just load the package". The word quietly implies they
  should already have known.
- **Anything about random-effects theory in session one.** They need to run
  it before they need to understand it.

---

## 2. Learning outcomes

By the end of the programme, participants will be able to:

| | Outcome | Level |
| --- | --- | --- |
| **LO1** | Navigate RStudio and run, save and re-open an R script | Apply |
| **LO2** | Explain in their own words what objects, functions and packages are, and why installing a package is not the same as loading it | Understand |
| **LO3** | Import a structured data file and verify that it imported correctly | Apply |
| **LO4** | Convert study-level results into effect sizes and fit a random-effects meta-analysis | Apply |
| **LO5** | Interpret a meta-analysis summary, including the heterogeneity statistics, and distinguish a confidence interval from a prediction interval | Analyse |
| **LO6** | Produce and read a forest plot | Apply |
| **LO7** | Identify when a pooled estimate is an inappropriate summary, and say what they would report instead | Evaluate |
| **LO8** | Recognise common R errors and resolve them independently | Apply |
| **LO9** | Critique the methodological choices in a published meta-analysis, including non-independence and unreported heterogeneity | Evaluate |

LO7 and LO9 matter most for the lab's own work, and both are deliberately
placed late. They depend on having run the analysis first.

---

## 3. Session-by-session curriculum

### Session 1: Getting off the ground

**Outcomes:** LO1, LO2, LO4, LO6, LO8

| Element | Detail |
| --- | --- |
| Pre-work | Install R and RStudio, open it once, reply to confirm. Baseline survey |
| Activities | Orientation to RStudio. The three ideas with type-along examples. The seven-line meta-analysis on built-in data. First forest plot |
| Deliberate practice | Facilitator makes errors on purpose and recovers from them in front of the room |
| Checkpoint | Every participant has produced their own forest plot from a script they saved |
| Assessment | Exit ticket, three questions |
| Between sessions | `02-exercise.R`, four questions, done in pairs |

### Session 2: Reading what it tells you

**Outcomes:** LO5, LO7, LO9

| Element | Detail |
| --- | --- |
| Opening | Pairs report back on the exercise. Sticking points discussed first, answers second |
| Activities | Walk through a full `rma` summary. Heterogeneity statistics. Confidence versus prediction interval. When a pooled estimate is the wrong summary |
| Discussion | The three judgement questions in `FACILITATOR.md`, run as a group |
| Checkpoint | Each pair states, out loud, what they would report for a dataset with I² of 92 percent |
| Assessment | Exit ticket. Short interpretation task on a supplied output |

### Session 3: Critique

**Outcomes:** LO9, reinforcing LO5 and LO7

| Element | Detail |
| --- | --- |
| Pre-work | Read the assigned published meta-analysis |
| Activities | Group critique against a supplied checklist: search strategy, eligibility, normalisation, non-independence, heterogeneity reporting, strength of conclusions |
| The core exercise | Find the design decisions that were made without being flagged as decisions |
| Checkpoint | Each participant names one thing the paper did that we will do differently, and why |
| Assessment | Written critique, half a page |

This is the session that connects the R work back to why the lab is doing
any of this.

### Session 4: Your own data

**Outcomes:** LO3, LO4, LO7, LO8

| Element | Detail |
| --- | --- |
| Activities | Importing a real extraction sheet. Checking the import. Effect sizes on real variables. The non-independence problem and the three-level fix. Moderator analysis |
| Checkpoint | Each participant runs a moderator analysis and interprets the R² |
| Assessment | End-of-programme survey |
| Next steps | Identify who wants to serve as second reviewer on the live systematic review |

### Alignment check

Every outcome is taught, practised and assessed somewhere. LO2 is assessed
by asking participants to explain in their own words rather than by a
multiple-choice question, because being able to pick the right definition
and being able to say it are different things. LO7 and LO9 are assessed by
judgement tasks, not recall, because that is what they are.

---

## 4. Assessment approach

Nothing is graded. Assessment serves two purposes:

1. **To find out what did not land**, while there is still time to fix it.
   If four out of eight people cannot say what a package is, that is a fact
   about the teaching, not about them.
2. **To show that the programme worked**, if you later want to report it.

A third: participants who can see their own progress keep coming.

### Why low stakes matters more than usual

People learning to code in front of colleagues are exposed. They are visibly
not competent at something, in a room where they are usually the expert.
Anything that feels like a test will reduce the thing you most need, which
is people saying out loud that they are lost.

No grades, no leaderboard, no naming anyone's score. Exit tickets anonymous
by default.

### The instruments

| When | What | Length | Purpose |
| --- | --- | --- | --- |
| Before session 1 | Baseline survey | 3 min | Confidence, background, expectations |
| End of each session | Exit ticket | 60 sec | What landed, what did not, one open question |
| Session 2 | Interpretation task | 10 min | LO5, checked as a group |
| Session 3 | Written critique | Half a page | LO9 |
| After session 4 | End-of-programme survey | 5 min | Confidence change, self-rated outcomes |

The exit ticket earns its place every time. Three questions, sixty seconds,
answered before people leave the room. Read them that evening and open the
next session by addressing the most common confusion. Participants notice
when you do this, and it changes how honestly they answer.

### One caution on self-reported confidence

Confidence ratings are easy to collect and are not the same as competence.
People routinely become *less* confident as they learn enough to see what
they do not know. So pair every confidence item with something observable:
did they produce a forest plot, did they resolve an error without help, did
they correctly identify that a pooled estimate was inappropriate. Report
both. If confidence dips while performance rises, say so. That is an
interesting finding, not a failure.

---

## 5. Survey instruments

Full question wording is in [`assessment/qualtrics-instruments.md`](assessment/qualtrics-instruments.md).
