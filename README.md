# Online Courses (CRM system)

[![Build Status](https://semaphoreci.com/api/v1/sergeyantonov1/online-courses/branches/master/badge.svg)](https://semaphoreci.com/sergeyantonov1/online-courses)

## Dependencies

* PostgreSQL 9.3
* Ruby 2.2.3
* PhantomJS
* Rails 4

Setup required dependencies from `Brewfile`:
```bash
brew tap Homebrew/bundle
brew bundle
```

## Quick Start

```bash
# clone repo
git clone git@github.com:sergeyantonov1/online-courses.git
cd online-courses
```

Paste environment variables to .env file

```
# run setup script
bin/setup

# run server on 5000 port
bin/server
```

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - run brakeman and rails_best_practices for the app
* `bin/ci` - should be used in the CI to run specs

## Test users

  - User: "user@example.com / password"
  
## Staging

* http://staging-online-courses.herokuapp.com/
