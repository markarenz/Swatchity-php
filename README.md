# Swatchity (2010's Version)

## Background
Swatchity is a social media network where you can only post colors. In that sense, it's largely useless but at the same time highly functional. When I was working on it back in 2014(?) I would describe it to people who would invariably ask, "why do this?" I don't think I ever articulated an answer that satisfied people. I think the real reason had to do with the conversations we would have about it, how silly and impossibly dumb it all was.

Another reason I made it is because useless yet functional things fascinate and amuse me as creative works. At the time I was thinking about jokes that take a generations or centuries to tell. Specifically, I was thinking of creating a machine that did nothing and burying it somewhere for achaeologists to find after a few millennia and argue over its purpose or, indeed, if if was made by humans at all.

I thought of Swatchity like that. Something that would live in the background for someone to find while searching the web for color scheme ideas, to slowly wade into its weirdness and (spoiler alert) uncover the (fake) cultish underpinnings of the project as they post more colors and level up.

It amused me to think of someone posting a link on Reddit as if they'd discovered this shady organization recruiting members and talking about colors. Or it could slip into obscurity like everything else we make, and that's OK, too.

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
