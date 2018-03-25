# Online Courses (CRM system)

[![Build Status](https://semaphoreci.com/api/v1/sergeyantonov1/online-courses/branches/master/badge.svg)](https://semaphoreci.com/sergeyantonov1/online-courses)

## Dependencies

* PostgreSQL 9.х
* Ruby 2.4.2
* PhantomJS
* Rails 5.1.2

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
  - Manager: "manager@example.com / password"
  - Super manager: "super_manager@example.com / password"
  
  Sign in manager link: https://online-courses-staging.herokuapp.com/managers/sign_in
  
## Staging

* https://online-courses-staging.herokuapp.com/
