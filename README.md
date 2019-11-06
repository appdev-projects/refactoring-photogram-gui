# Photogram GUI partial solutions

**In this repository you'll find the solutions to [Photogram GUI](https://github.com/appdev-projects/photogram-gui), except for the edit forms and delete links.**

## Original README below

In this project, we'll practice populating pages with data from a database.

We'll also build some forms to add records to tables.

## Domain model

There's an image of the ERD of the database you have to work with in the root-level folder of the application, `erd.png`.

![Domain Model](erd.png?raw=true "Domain Model")

You can also check out the comments at the top of each of your models in `app/models` to remind yourself of what columns it has.

## Target

[Here's your target.](https://photogram-gui.matchthetarget.com/) Not all parts are required for now; in particular, the edit forms are optional challenges. You've got the all tools needed, but they have quite a few moving parts; we can finish them together.

The required tasks are:

 - `/users` should
    - display all the users
    - a link to get to details for each user
    - a form to add a new user
 - `/users/[USERNAME]` should
    - display the username of the user
    - the photos posted by the user
 - `/photos` should have a form to add a new photo
 - `/photos/[ID]` should
    - display the details of a photo
    - displays the comments that have been made on the photo
    - have a form to add a comment to the photo

## Workflow

 1. As often as you like, reset your database with dummy data: `rails dummy_data`
 2. Start the web server: `bin/server`
 3. **A**lways **B**e **C**ommitting at `/git`
 4. Check out your database visually at `/rails/db`
 5. Run `rails grade` as often as you like to see how you are doing, but **test your app manually first to make sure it matches the target's behavior**.

## Things to keep in mind

  - I added some _validations_, rules to try and help prevent bogus data from entering your tables, to your models. We'll discuss these next week.
 - Don't be alarmed by the number of automated tests. Most of them are there as hints to help you structure your forms correctly.
 - It's okay to View Source on the target to get hints on what HTML we used.
 - When you make forms, don't forget to add a `<label>` for every form control (`<input>`, `<textarea>`, etc). The `<label>` should have a `for=""` attribute that matches the `id=""` attribute of the input. For example,

    ```html
    <label for="zebra">Fan</label>
    <input id="zebra" type="text" name="qs_fan_id">
    ```
