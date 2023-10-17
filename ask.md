# You asked:

> Tell us about a complex problem you've solved with code, systems thinking or elbow grease.

# My response:

## The problem

I was working at a tech startup who wanted to launch a stock market/finance research website. Just info, no trading. The company moved fast and set aggressive deadlines for themselves, so shortcuts were taken to get the site online. We used a Thomson Reuters API service as our data provider, making calls to their API for the latest information which we displayed on the site. A few months after the site was launched, we started getting letters from them that our API account was nearing the end of the introductory period, and that our API usage was well above the threshold of our account level. This was not addressed, and TR started billing us for our usage. This was enough of an expense that I was taken off the team I was working with at the time and asked to investigate and resolve the situation.

## My solution

#### (TL;DR: I reduced API calls by ~98% and monthly expenses by ~$18,000 while simultaneously providing more accurate and timely information on our website.)

My first step was to investigate the current situation and came to the following findings:

1. I learned that all the data we had on the top 5000 companies on the NYSE, which were the companies we were reporting on - company names, executives including their career and education backgrounds, even the list of companies itself - had been downloaded once at the beginning of the project and was not being maintained.
1. I also learned that for each company, we were making an individual API call to get their current stock price, once every 5 minutes, around the clock. I don't remember how many API calls this added up to each day but it was over a million.

(These were the shortcuts that had been taken by the launch team to get the site up and running ASAP.)

My next step was to figure out how to fix it. I discovered that TR did have documentation on their finance API, in the form of a manual that was just short of 1000 pages long. (I was not provided this manual when I started this project.) I combed through that manual until I found every opportunity to consolidate API calls and found that company stock price requests could be batched, 100 at a time. This alone reduced our API calls by 100x.

I also adjusted the schedule of our API calls. We wanted the data to be as timely as possible during the trading day, but those numbers stop updating during NYSE off hours. So I continued updating those calls every 5 minutes during NYSE hours and for 30 minutes after closing (to account for any data delays between NYSE and TR). This eliminated another ~60% of the remaining API calls.

At this point our API calls were well below the account threshold, so I added in a new process to run on weekends which updated the list of companies we were tracking, and then updated our information on the executives of those companies (also a call that could be batched), including their work and education histories. This was a relatively small set of calls relative to our threshold.

### The result

I reduced the number of API calls we made to Thomson Reuters by around 98%, while actually improving the accuracy and frequency of our data. This reduced monthly expenses to the company by around $18,000.