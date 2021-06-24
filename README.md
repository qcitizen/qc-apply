## Preamble

```
> A message from the editor:                              [2021-06-23]

We've received a lot of really nice submissions over the past month.
A few of the PRs are still waiting for reviews; we haven't forgotten
and we will respond soon.

The role we're hiring for at the moment is a Senior Full-stack Dev,
with experience working in Elixir/Phoenix. Experience as a lead dev
or project ownwer is a bonus but not required (we want a programmer,
first and foremost).

The position is on our Phoenix project team. We started it late last
year and it's currently in a pre-production phase. Experience with
devops is valuable along with a security-first mindset and fine
attention to detail in general as well.

We have more positions opening up over the next few months so
we're keeping track of the pull requests coming in and we'll
have another update here as soon as we have more details. - QC

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

a3bc4d2
a5f10c
abcd
c3e4c3e3
ef2eac2bc
mat2isago2dprogram2er

## Timeboxing

Try to complete this task within 30 minutes.


## What we'll be looking at

- Code structure — specifically how readable and understandable it is
    - (Optional) Consider using of whitespace and inline doc strings for clarity
- Git usage — granularity of commits and any branches or tags
- Edge cases — how they're handled so they won't be forgotten
    - (Optional) Describe or implement a solution for each case (if any)
- Bonus: Add a very basic test for each case


## What we won't be looking at

- Language — use whatever programming language you're most comfortable with
- Number of lines — it can be any length as long as it's readable and understandable
- Time spent — just be honest and tell us how you used the time


## How to submit

1. Fork this repo to a public one on your account
2. Add an empty file for your code and make a commit
3. Make commits as you're working to help show your work
4. When you're done submit your fork as a pull request back to this repo
5. Send the link to careers@quantifiedcitizen.com with some details about your experience.
