# Survey instruments

Three instruments, built in Qualtrics on the institutional licence.
Question wording below is ready to paste in.

---

## Instrument 1: baseline survey

**Survey name:** `TrantJC_R_Baseline`
**When:** sent with the pre-work email
**Length:** 3 minutes, and say so in the invitation

### Intro text

> This takes about three minutes. It helps me pitch the sessions at the right
> level and see whether they worked. There are no wrong answers and nothing
> here is a test. Responses are anonymous unless you choose to add your name
> at the end.

### Q1. Background *(multiple choice, single answer)*

Which best describes your experience with R?

- I have never opened it
- I have opened it but could not do anything useful
- I have run someone else's script without really understanding it
- I can write basic R myself
- I use R regularly

### Q2. Other tools *(multiple choice, multiple answer)*

Which of these have you used for data analysis? Tick all that apply.

- Excel or Google Sheets
- GraphPad Prism
- SPSS
- Python
- R
- Other, please specify *(text entry)*
- None of these

### Q3. Statistics background *(multiple choice, single answer)*

How would you describe your statistics background?

- No formal training
- One undergraduate course
- Two or more courses, or graduate-level training
- I use statistics routinely in my own work

### Q4. Confidence *(slider, 0 to 10, one row each)*

How confident do you feel about each of the following right now?
0 is not at all, 10 is completely.

- Opening RStudio and running a line of code
- Importing a spreadsheet into a statistics program
- Explaining what a meta-analysis does
- Reading a forest plot
- Judging whether a published meta-analysis was done well
- Fixing an error message without help

> These six rows are repeated **verbatim** in the end-of-programme survey.
> Keeping the wording identical is what makes the comparison meaningful.

### Q5. Knowledge check *(multiple choice, single answer)*

In a meta-analysis, why are studies weighted rather than simply averaged?

- So that more recent studies count for more
- **So that larger and more precise studies count for more**
- So that studies from higher-impact journals count for more
- I do not know yet

> Include "I do not know yet" on every knowledge item. Without it people
> guess, and you learn nothing.

### Q6. Motivation *(text entry, essay box)*

What would make these sessions worth your time? One or two sentences is
plenty.

### Q7. Concerns *(text entry, essay box, optional)*

Is there anything you are worried about, or anything that would make it
easier for you to take part?

### Q8. Name *(text entry, optional)*

If you would like me to be able to link your answers across sessions, add
your name or a nickname you will remember. This is optional and nothing
depends on it.

---

## Instrument 2: exit ticket

**Survey name:** `TrantJC_R_ExitTicket`
**When:** end of every session, completed in the room
**Length:** 60 seconds

One survey, reused for all four sessions, with a session number question at
the top. Put the QR code on the last slide and ask people to complete it
before they stand up. Response rates collapse if you email it afterwards.

**Q1.** Which session was this? *(multiple choice: 1, 2, 3, 4)*

**Q2.** *(Slider, 0 to 10)* How confident do you feel about what we covered
today?

**Q3.** *(Multiple choice, single answer)* The pace today was:

- Too slow
- About right
- Slightly too fast
- Much too fast

**Q4.** *(Text entry)* What is one thing that made sense today?

**Q5.** *(Text entry)* What is one thing that did not?

**Q6.** *(Multiple choice)* Did you manage to complete today's checkpoint on
your own machine?

- Yes, on my own
- Yes, with help from my pair
- Yes, with help from the facilitator
- No

> Q6 is the observable measure that keeps Q2 honest. If confidence is high
> and completion is low, the session did not work regardless of what the
> slider says.

**Session 1 add-on:** a yes/no asking whether they produced a forest plot.

---

## Instrument 3: end-of-programme survey

**Survey name:** `TrantJC_R_Final`
**When:** immediately after session four
**Length:** 5 minutes

### Q1. Confidence *(slider, 0 to 10, same six rows as baseline Q4)*

How confident do you feel about each of the following now?

Use the **identical** six rows. This is your main before-and-after measure.

### Q2. Self-rated outcomes *(matrix, agree/disagree, 5 point)*

I can now:

| Item | Maps to |
| --- | --- |
| Open RStudio and run a saved script | LO1 |
| Explain what a package is and why loading it matters | LO2 |
| Import a spreadsheet and check it imported correctly | LO3 |
| Run a random-effects meta-analysis | LO4 |
| Interpret heterogeneity statistics | LO5 |
| Produce and read a forest plot | LO6 |
| Recognise when a pooled estimate is the wrong summary | LO7 |
| Resolve a common R error without help | LO8 |

Keeping this mapping visible is what makes this a curriculum rather than a
feedback form.

### Q3. Knowledge check

Repeat of baseline Q5, plus two harder items.

**3a.** Why are studies weighted rather than simply averaged?
*(same options as baseline)*

**3b.** What does a high I² value tell you?

- The pooled estimate is precise
- **The studies differ more than chance would explain**
- The studies are high quality
- I do not know

**3c.** A meta-analysis reports a narrow confidence interval and a very wide
prediction interval. What does that mean?

- **The pooled average is well estimated but a new study could land almost
  anywhere**
- The analysis is wrong
- The studies all agree
- I do not know

### Q4. *(Text entry)* What was the single most useful thing in the programme?

### Q5. *(Text entry)* What should be changed or dropped?

### Q6. *(Multiple choice)* Would you be willing to serve as second reviewer
on a systematic review?

- Yes
- Maybe, I would want to know more
- Not right now

### Q7. *(Text entry, optional)* Anything else?

> Q6 is the one that tells you whether the programme achieved its actual
> purpose.

---

## Building it in Qualtrics

- **Three separate surveys**, not one. The exit ticket is reused four times
  with a session-number question at the top.
- **Anonymous links** for the exit ticket. Turn on Anonymize Responses in
  Survey Options if you want to be certain no IP or identifying metadata is
  stored.
- **Linking baseline to final without collecting names:** add a
  self-generated code question. Something like "first two letters of your
  mother's first name plus the day of the month you were born" gives a
  stable code the participant can regenerate, and you cannot work backwards
  from it.
- **QR code** for the exit ticket: Qualtrics generates one from the
  distribution link.
- **Slider defaults:** set the starting position to the midpoint or to no
  selection. A slider starting at zero produces a cluster of zeros from
  people who did not move it.
- **Force response sparingly.** Force it on the confidence and completion
  items, leave everything else optional. Forced free-text is the fastest way
  to get "n/a" in every box.
- **Test it on a phone** before sending. Most people answer the exit ticket
  on a phone.

## Analysing the results

Export to CSV and analyse in R. This closes the loop nicely and gives you a
real worked example to show in session four using the group's own data.

With a group this small, do **not** run significance tests on the confidence
change. Report the individual trajectories. Eight people is a description,
not a sample.

## Ethics

- **Improving your own teaching** is programme evaluation or quality
  improvement. No REB review needed.
- **Publishing it** as education research needs REB clearance from the
  institutional Research Ethics Board **before** data collection.
  Retroactive approval is not available.
- **Regardless of purpose:** if you supervise the participants, say
  explicitly in the invitation that participation is voluntary, responses
  are anonymous, and nothing affects anyone's standing. Then make that true,
  including not commenting on who did or did not respond.
