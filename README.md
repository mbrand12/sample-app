# sample-app

[![Build Status](https://semaphoreci.com/api/v1/projects/77ee18d9-46bc-4f30-ab45-68c05cecd9ac/579834/badge.svg)](https://semaphoreci.com/mbtand12/sample-app)

A rails 4 application project for learning rails by following [railstutorial]
by Michael Hartl. This project uses [gitflow] workflow.

You can read development details/diary in the DEVCORE.md document.

## Changelog

See CHANGELOG.md document for a list of changes.

## Notable gems used in the app

**note:** see DEVCORE if you want to know why I used these gems

- [pg](https://rubygems.org/gems/pg) - postgreSQL
- [slim-rails](https://github.com/slim-template/slim) - html template language
- [bootstrap](https://github.com/twbs/bootstrap-rubygem) - Bootstrap 4 Alpha

## Notable services used in the app

- [mandrill](https://www.mandrill.com/) - email service


## Checking it out localy

See how it looks and works do the following:

**note:** this app uses postgreSQL so be sure to install it before proceeding
(consult `DEVCORE.md` for details on how to install it on Ubuntu).


1. Check `Gemfile` for the required ruby version, have bundler installed via `$
   gem install bundle`.

Open the terminal and:

```
$ cd ~/workspace
$ git clone https://github.com/mbrand12/sample-app.git
$ cd sample-app
$ bundle install
$ bundle exec rake db:migrate
$ bundle exec rake test
```
If the tests are all green (passing):

```
$ bundle exec rake db:seed
$ rails server
```

If `bundle install` fails to build native extensions you are probably missing
some libraries (nokogiri in my case) that you need to install. This might
happen for the `pg` gem as well if you didn't install PostreSQL database.

You can check the username and password in `db/seeds.rb` for login or create
your own account and search the rails server log for the activation link.

## License

Sample-app is licensed under the MIT license. Read the LICENCE document
supplied with this project for more information.

[railstutorial]: https://www.railstutorial.org/
[gitflow]: https://github.com/nvie/gitflow
