# Active Model Serializer
Demonstrates Model Serializing for `rails` APIs differentiated by versions.

## Description
The project have been implemented to serve versioned APIs in ruby on rails framework.
It serves serialize data objects over the network by `active_model_serializers` gem.

## Install
To setup project locally, follow below instructions.

### Project Configuration
Have ruby version [ruby-2.7.1](https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-7-1-released) installed as mentioned in Gemfile.

Install necessary dependencies.
```bash
# install dependencies mentioned in Gemfile
$ bundle install

# verification of already installed files in node_modules
$ yarn install --check-files
```

### Database Setup
Create and Initialize database.
```bash
# migration of database
$ rails db:migrate

# initialization of database with data
# defined in seed file
$ rails db:seed
```
