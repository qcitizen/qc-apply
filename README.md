## Preamble

```
  > re: Notice from HQ                                      [2021-10-25]

  We are now accepting applications for several new technical positions:

    Development Lead, Mobile
      Location: Remote (PST or EST preferred)
        Skills: Flutter+Dart or Native; written-communication

    Modern-day Sysadmin (i.e. devops without the 24/7 on-call)
      Location: Remote (PST or EST preferred)
        Skills: AWS+Docker+*nix+Python; dev-process, monitoring, logging

  Telling us about your experience as a senior, lead or project owner on
  a team is a bonus but not required (we tend to hire programmers, first
  & foremost; we're all active programmers ourselves). Mastery is also a
  valued asset which again is not a requirement but it is a way to stand
  out.

   We are an equal opportunity employer. If you're not sure whether your
   skills and experience would be a good fit, please email us anyway and
   we can figure it out together. At the very least, we'll be pleased to
   offer you any constructive feedback we can (but only if you ask). 🥗

  We will have more positions opening up in 2022, for both technical and
  non-technical roles so you have a couple options to consider, you can:

      1. Watch or star this repo or otherwise keep your eye on this page
          for a technical position that might be a better fit for you.
      2. Or you could fork this repo and submit a PR anyway; then [let us
          know by email](mailto:careers@quantifiedcitizen.com) what your
          favourite salad is and why you'd want
          to work with us.
      3. Or finally, simply let the fates of old take the wheel and what
          what will be will be. 🤔

  But don't be limited by just that list; there are so many options and
  other lists and opportunies available. Sometimes they're things that
  you'd never even thought out before. If you do go that route, and
  you do decide to apply later on we'll be very interested to hear
  what you've been up to! (We're interested in what candidates
  tell us about themselves and their experience regardless!)

```

---


# Exercise

Write a function that compresses an alphanumeric string by collapsing consecutive values. The rules of the compression algorithm are defined by the test cases below.


## Test cases

Each item below has an input value and the expected output from the function.

1. `aaabccccdd` → `a3bc4d2`
2. `aaaaaffffffffffc` → `a5f10c`
3. `abcd` → `abcd` (note: not `a1b1c1d1`)
4. `ccceee12eccceee` → `c3e4c3e3` (numbers removed)
5. `effeac01cb65c` → `ef2eac2bc`


## Timeboxing

Try to complete this task within 30 minutes.


## What we look for

- Code structure — specifically how readable and understandable it is
    - (Optional) Consider using of whitespace and inline doc strings for clarity
- Git usage — granularity of commits and any branches or tags
- Edge cases — how they're handled so they won't be forgotten
    - (Optional) Describe or implement a solution for each case (if any)
- Bonus: Add a very basic test for each case


## What we _don't_ look for

- Language — use whatever programming language you're most comfortable with
- Number of lines — it can be any length as long as it's readable and understandable
- Time spent — just be honest and tell us how you used the time


## How to submit

1. Fork this repo to a public one on your account.
2. Add an empty file for your code and make a commit.
3. Make granular commits as you go so that each one is readible with an accurate commit message.
4. When you're done, submit your fork as a pull request back to this repo.
5. To help us stay organized, please email us at careers@quantifiedcitizen.com with the link and a few details about your experience and/or interest in working with us.
