# Project 2 Evaluation

## Technical Requirements
**3: Excelling**
>Includes many well-structured models, and advanced functionality such as authorization, 3rd-party API integration, or other technology not covered in class

## Creativity and Interface
**1: Progressing**
>The app is styled and has an interface of value to the end user: it is not just a nav bar and an index page

## Code Quality
**2: Progressing**
>Code is well-formatted, well-named, and contains few style / quality issues

Some indentation consistency issues

## Deployment and Functionality
**2: Performing**
>Application contains no major errors, is deployed correctly, and contains a custom Heroku app name appropriate for the app.

## Planning / Process / Submission
**0: Incomplete**
>No submission received, or submission does not contain basic documentation of planning (ERD, wireframes, commit history, etc)


## Notes

Great work on this project!

I found a few *bugs* that may not have been apparent while you were testing. Since Schedules belong to User the index and other actions should pull them from current_user and further, the SchedulesController should enforce authentication to ensure that the user sees their schedule and not just the first set of Schedules in the system. I was also able to get working your feature to add/remove recipes to schedule days. Check out The SchedulesController and it's views for more info on both of these.

**Of major concern** is the lack of planning information as outlined in the [Project2 Deliverables](https://github.com/ga-wdi-exercises/project2#deliverables). There was no `planning` folder and your `README.md` hasn't been updated to include details about this project. A zero score in any of the evaluation topics for a project will disqualify you from graduation/outcomes. In order to rectify this, planning information (readme and planning folder with documents) needs to be added to the repo before the end of the 12th week.
