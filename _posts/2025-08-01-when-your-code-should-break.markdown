---
layout: 			 post
title:  			 "When Your Code Should Break"
date:   			 2025-08-01 15:00:00 +0000
categories: 		 non-fiction
permalink:  		 "/25/08/01/when-you-code-should-break"
navigation_category: writing
---

I recently broke production.

We're going to have a retrospective next week: in that meeting, I will be helpful. There are things we could do as a software development team to limit our risk to production incidents.

Right now, I'm not going to be helpful. Right now, I'm *mad*. And if you're mad, you should try and understand why.

***
## The Setup

The user selects a number from a dropdown; my code does stuff depending on what the number is.

The user can also decline to pick a number. (Any developers reading this are now suspicious.)

For some reason, my code doesn't receive numbers: it receives strings, that have numbers in them. Like so: 

```
"1", "4", "", "7", "", "13"
```

This isn't great, but the web is a pile of hacks.

You can see that sometimes, we get empty strings, to represent "the user didn't pick a number". (The developers reading this are now concerned.)

When writing the code, I realised these values were strings, and asked the computer to turn them into numbers.

## The Problem

Specifically, I called the Ruby function `to_i`, which means "to integer". Integer is just a fancy name for a number that isn't a fraction or decimal.

This function makes a promise. You have a string; you want it to be a number. I (the function) will receive a string and give you a number.

But what to do when the string isn't obviously a number?  How should we respond to "", or "sdghiwqruhgqw", or "th1s is not a numb3r"?

Clearly (!), we can't allow *all* strings to become numbers. "" or "sdghiwqruhgqw" simply aren't numbers, and there's no way to decide what number they should become. We could pick a random number, but that would make the code behave randomly, which nobody wants. To any non-developers reading, this is obvious.

For the developers: if you're asked to turn a string into a number, and what the number should be isn't obvious, you should throw an exception. The program should crash. It should be as clear as possible, as early as possible, that the person who asked for that string to become a number is doing something wrong.

The people who wrote the `to_i` function in Ruby disagree. They think "" and "sdghiwqruhgqw" should become 0.

## The Payoff

So "" becomes 0. Because the `to_i` function didn't crash, everything seemed to work great from my end. My code was reviewed. It was deployed to a staging version of the website, and the relevant pages were tested. All fine, just like Ruby said it was.

*Until* someone tried to do anything with that tricksy 0 value. The value was never supposed to be 0, so it made the website fall over. This didn't happen until real users got at it.

**When behaviour in your code is undefined, please, make bad things happen.**