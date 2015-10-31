# Sample-app development diary
> DEVCORE because diary doesn't sound as cool.

In here I will write my observations, motivations and development details.

## Motivation

Since now I have a better grasp of the ruby language (see [T10]) the next thing
is to revisit the sample_app from [railstutorial] and go over it once again,
while adding some new things and solidifying old ones.

For testing I decided to stick with minitest and implement RSpec after I feel
comfortable testing rails apps. Last time I used [slim] as a html template and
will use it again since I like it. PostgreSQL is used as a database since it
goes well with [heroku] where I will deploy the app.

### Gem selection motivations

#### [pg](https://rubygems.org/gems/pg/)

PostgreSQL was a choice from the start because [heroku] uses it and because it
can be surprisingly easy to set up on Ubuntu and when using Rails.

This is the command log:

```
$ sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main' > /etc/apt/sources.list.d/pgdg.list"
$ wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
$ sudo apt-get update
$ sudo apt-get install postgresql-common
$ sudo apt-get install postgresql-9.3 libpq-dev

$ sudo -u postgres createuser --superuser $USER
```
The last command sets up so that the database role username and password with
the same credentials as Ubuntu login name and password. Which then means that
other than putting the `--database=postgresql` in the `$ rails new sample-app`
there is no additional configuration needed for development and test
environments.

Those commands are from:

- https://gorails.com/setup/ubuntu/14.04
- https://help.ubuntu.com/community/PostgreSQL

#### [slim-rails](https://rubygems.org/gems/slim-rails)

The first time I made a sample-app ( before [T10]) I noticed that just using
html with embedded ruby wasn't to my liking so I searched for some alternatives
and found [slim]. I instantly liked how the code looked and it felt logical to
me, and even though it didn't really shine when it comes to content (but
awesome for structure) I stuck with it.

Back to the now, when I started to write content in slim I run into same
problematic mess but this
[issue](https://github.com/slim-template/slim/issues/186) really opened my eyes
and since I got some experience with markdown because of the last project this
seemed like a excellent progression.

So this:

```slim
h1 About
p
  | The
  a<> href="http://www.railstutorial.org/"
    em Ruby on Rails Tutorial
  | is a
  a<> href="http://www.railstutorial.org/book"
    | book
  | and
  a<> href="http://screencasts.railstutorial.org/"
    | screencast series
  | to teach web development with
  a<> href="http://rubyonrails.org/"
    | Ruby on Rails
  | This is the sample application for the tutorial.
```

became this:

```markdown
h1 About
markdown:
  The [Ruby on Rails Tutorial] is a [book] and [screencast series] to teach web
  development with [Ruby on Rails].

  This is the sample application for the tutorial.

  [Ruby on Rails Tutorial]: http://www.railstutorial.org/
  [book]: http://www.railstutorial.org/book
  [screencast series]: http://screencasts.railstutorial.org/
  [Ruby on Rails]: http://rubyonrails.org/
```

I don't know whether I will keep using slim in the future, but for now I am
liking it very much.

On the topic of style I decided to write slim in such was that can be more
easily (in my opinion) read by people that don't use slim and because I read
and understand the code faster when done this way.

Example:

```slim
- if @user.errors.any?
  #error_explanation
    .alert.alert-danger
      | The form contains
      = pluralize(@user.errors.count, "error")
    ul
      - @user.errors.full_messages.each do |msg|
        li = msg
```

```slim
- if @user.errors.any?
  div id="error_explanation"
    div class="alert alert-danger"
      This form contains #{ pluralize(@user.error.count, "error") }
    ul
      - @user.errors.full_messages.each do |msg|
        li #{ msg }
```

So basically:

- all div elements should be explicit
- classes and ids should be separated and explicit
- inline ruby should be in "#{}"
- use markdown for content (paragraphs and inline links), slim for structure

This will probably change in future, but for now it makes it more readable for
me.
#### [boostrap](https://github.com/twbs/bootstrap-rubygem)

Decided to try out Bootstrap 4 Alpha and that made the Bootstrap 3 based code
not work as it should, which ended up to be a good opportunity to learn a
little bit more about bootstrap rather than just copy pasting it (or in my case
retyping it since I like to type out the code to better understand it). The
quackit site provided a nice overview of the changes between Bootstrap 3 and 4
that helped me update the code.

Helpful resources:

- http://www.quackit.com/bootstrap/bootstrap_4/tutorial/

### Changelog

While I don't know what use is the changelog in a rails app (in gems and
anything that provides a public api to be used it makes more sense) I keep
using it to get used to it.

## Observations

### Documentation

In my previous project I have documented so that it can be generated and read
by using [YARD]. The question that arises here is what should I document in a
rails application?

[T10]:https://github.com/mbrand12/t10
[railstutorial]: http://rubyonrails.org/
[slim]:http://slim-lang.com/
[heroku]: http://www.heroku.com
[YARD]: http://yardoc.org/
