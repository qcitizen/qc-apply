## Preamble

```
  > re: Notice from HQ                                      [2021-08-16]

  We are now accepting applications for several new technical positions:

        Quality Assurance Engineer [Elixir|Python|Ruby]
        Backend Engineer [Python, Devops|AWS|SRE|Ruby]

  For each of these, experience as team lead or project owner is a bonus
  but not required (we want programmers, first and foremost). The mobile
  position is on our mobile team, no surprise, and will help us organize
  and define the work driven by our roadmap. Daily communication between
  us and our remote PM is also expected.

  The QA Engineer will be the first dedicated QA on our team and as such
  will help us build out our testing program. They will also take on the
  responsiblity for one or more of the test suites as well (depending on
  the language or type of testing they're most comfortable with).

  Our Backend Engineer role is a modern take on the old classic. We have
  a linux-based infrastructure that we built and maintain which requires
  ongoing care and attention, including scripts and other plumbing. They
  will help us maintain and automate that infrastructure as well as help
  us explore options for a more service-based approach.

   We are an equal opportunity employer. If you're not sure whether your
   skills and experience would be a good fit, please email us anyway and
   we can figure it out together. At the very least, we'll be pleased to
   offer you any constructive feedback we can (but only if you ask). 🌻

  We will have more positions opening up towards the end of this year or
  early next year so if other roles may be a better fit for you, keep an
  eye out around then. -- QC

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
