# Facilitator run sheet

For whoever is leading. Participants do not need this file.

## Pre-work, sent a week ahead

One instruction only: **install R and RStudio, and open RStudio once to
check it launches.** Ask for a reply confirming it opened.

Installation is the biggest time sink. Doing it live means half the room
watches the other half download for twenty minutes. Nudge anyone who has
not replied by the day before, and if it still fails, pair them.

## Session one, about 90 minutes

| Time | What | Notes |
| --- | --- | --- |
| 0 to 10 | Install triage, pair people up | Fix stragglers, pair anyone stuck |
| 10 to 25 | `01` Parts 0 and 1, orientation and the three ideas | Everyone types along. Do not let anyone just watch |
| 25 to 30 | Pause: ask someone to say what a package is, in their own words | Catches quiet confusion before it compounds |
| 30 to 60 | `01` Part 2, the meta-analysis itself | The core. One line at a time, all together |
| 60 to 75 | `01` Parts 3 and 4, reading the output | Discussion, not typing. Ask what I² is telling them |
| 75 to 85 | `01` Part 5, forest plot | Everyone produces one and holds up their screen |
| 85 to 90 | Set `02`, agree pairs | |

Session two covers `03`, importing real data. It is deliberately not in
session one: it generates the most errors and the least understanding.

## How to run it

- **Type it yourself, slowly, on the shared screen.** Do not paste.
  Watching someone type at normal speed is what makes it feel doable.
- **Make errors on purpose.** Misspell an object name. Forget a
  `library()` call. Show the red text and recover from it in front of
  everyone. The real goal of session one is that red text stops being
  frightening.
- **Pair people.** Two to a screen, one driving and one reading aloud.
  Swap halfway. Pairs get themselves unstuck without needing you.
- **Do not explain random-effects theory.** They need to run it before
  they need to understand it. Part 3 gives enough to read the output
  honestly. Theory lands far better in session two.
- **Budget for one broken install.** There always is one. Pair that
  person and sort it afterwards rather than holding up the room.

## The checkpoint that matters

By the end, everyone has produced their own forest plot. Not understood
it deeply, not followed the argument: produced one, on their own machine,
from a script they saved.

That is what brings people back for session two.

## Questions worth asking during the output discussion

- Here is I² at 92 percent. Is the pooled diamond at the bottom a fair
  summary of these studies? What would you write in a paper?
- The confidence interval and the prediction interval are very different.
  Which one would you want if you were designing the next study?
- This moderator is significant and explains 6 percent of the variance.
  Have we explained anything?

These three do more for their judgement than any amount of theory.
