---
layout: 			 post
title:  			 "'Tidy First?' - A Tiny Takeaway"
date:   			 2024-08-19 18:00:00 +0000
categories: 		 non-fiction
permalink:  		 "/24/08/19/tiny-takeaways-1"
navigation_category: writing
---

I recently read Kent Beck's latest book, [Tidy First?](https://uk.bookshop.org/p/books/tidy-first-a-personal-exercise-in-empirical-software-design-kent-beck/7537994). I find the value of such books to be variable. Quite often, the whole exercise can be worth it for a few well-written sentences that *crystallise* a thought in your brain. The book doesn't impart any new information, but helps you think about something in a new way.

Equally often though, there are whole chapters to wade through that are sufferable yet forgettable. So I thought I might save people some time by sharing the main thing I got from the book:

## More PRs More Gooder

If you're going to do a refactor (or a tidy, which the book tries to distinguish from refactors), ship the refactor in a separate commit (and/or PR) to the actual behaviour change you're making. This advice is ambivalent to whether you do the refactor before or after the behaviour change.

This has a big advantage in clarity of purpose, for you and anyone reviewing the code.

The downside to this is increased review and testing burden, due to the fixed costs of both. It was discussing this point that the book crystallised something for me:

>If code gets reviewed rapidly, then you're encouraged to create more, smaller PRs. These more-focused PTs encourage even more rapid reviews. Equally, this reinforcing loop can run backward, with slow reviews encouraging larger PRs, further slowing future reviews.

This reframed the entire trade-off discussion for me. You aren't just making a decision about code style, you're making a decision about your team culture. Even if your team is just you, it still has a culture; and fom this position, it's obvious that you should foster a culture than supports clarity and speed.