## Preamble

```
  > re: Notice from HQ                                       [2022-03-01]

  We are now accepting applications for a couple new tech positions:

    Mobile Dev, Lead (Dart+Flutter, REST API, ResearchKit)
      Location: Remote (PST or EST preferred)
        Skills: Mobile-first mentality, with experience designing APIs
           Ask: Tell us about a recent success you've acheived
                as part of a small team.

    Backend Engineer (Python, Docker Compose, AWS)
      Location: Remote (PST or EST preferred)
        Skills: Production-minded engineer that can carry a project.
           Ask: Tell us about a complex problem you've solved with code,
                systems thinking or elbow grease.

   We are an equal opportunity employer. If you're not sure whether your
   skills and experience would be a good fit, please email us anyway and
   we can figure it out together. At the very least, we'll be pleased to
   offer you any constructive feedback we can (but only if you ask). 🥗

  We have more positions opening up later in 2022 for both technical and
  non-technical roles. We keep this repo updated with the latest details
  so keep an eye out here if you're interested.
```

### I'm applying to the Backend Engineer position. [Here's the answer to your ask.](./ask.md)

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
