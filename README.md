# Swatchity (2010's Version)

## About Swatchity

- I'm a bit of a social media crumudgeon, I suppose. If people aren't shouting nonsense or deliberate misinformation at the sky or committinh outright fraud, they're trying to convince me (or themselves) that they are more important than they appear to be. Most posts I see elicit a wince. 
  - "Do you think threats will make people agree with your point of view?"
  - "Why did you take video of this? Who is this for?" 
- Social media is gross, and yet I'm part of it, just like hundreds of millions of us. It's the smelly, polluted water in which we all must swim in order to participate in the culture. What about a social media app where you couldn't be horrible to other people- or at least it was difficult to be horrible?
- The core idea is that Swatchity is a place where you can only post colors. You can message people with colors. You can search other posts by color. You can see the popularity of the colors you post in meaningless statistics to give you a sense of your own relevance. It's got everything you need for that social media dopamine hit.
- Also, the idea of something fully featured but utterly useless is deeply amusing to me. If someone finds this in 20 years and wonders "what even the heck is this?" then the effort will have been worthwhile. The prophecy will have come to fruition.
- I mentioned the idea to my kids, who were then in their early-to-mid teens at the time and firmly ensconsed in social media. They agreed that this was a very dumb idea, indeed, so dumb that I had to make it real. So, I did, and they helped beta test it. Sadly, I took Swatchity offline last year since it no longer made sense to maintain a pricey VPC to host this silly thing. Soon, I plan to rebuild it with modern frameworks.

### TLDR Version
- Swatchity is a social media app where you can only post colors. It is highly functional and utterly useless. I made it because this amuses me.

## Features


## Q & A

### Q: What? Why?
- A: Because.

### Q: Is this a joke?
- A: Yes and no. No and yes.

### Q: Is Swatchity a parody of traditional social media or a proposal of how to fix it?
- A: Since these ideas are not mutually exclusive, it feels like both are true.

### Q: Is it ever coming back?
- A: I honestly don't see the point. So, that probably means yes.

## Next Steps
- The authentication methodology is based on thinking from the distant past and would have to be revamped if this were to ever go to production.
- The profile avatars are a bit dull with just the 4 quarter split of different colors. We could add a new question to set a pattern prop, each pattern utilizing the 4 colors in different ways. We could have swirls, concentric diamonds, etc.
- The code base is old. It's based on how I made stuff back in the early 2010s. It runs, but I would not deploy this to production in this state. A new version could leverage NextJS and Typescript. I'm not thrilled about having to pay to host what is basically a joke, but the prospect is interesting.
- The layout & design are a bit old fashioned, too. Thouse rounded corners are a bit too round, for example. It also needs darkmode outside of the color-picker mode, obviously.

## Installing & Running Swatchity
- You'll need containerization such as Docker or Vagrant to run the application locally.
- Start a new sql database (examples: mySql or Postgres) in your local environment.
  - Create a new user for the dtabase and a password for that user.
  - Populate the database using the sample sql file provided.
- Update the base domain value in the `swaitchity_config.php` file.
- You will need to create a `config_db.php` file in the root directory with the appropriate values.
```
$db_host="127.0.0.1";
$db_user="db_user";
$db_password="db_password";
$db_selected_db="swatchity_db";
```
