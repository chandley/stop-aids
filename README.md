[![Test Coverage](https://codeclimate.com/github/chandley/stop-aids/badges/coverage.svg)](https://codeclimate.com/github/chandley/stop-aids)
[![Code Climate](https://codeclimate.com/github/chandley/stop-aids/badges/gpa.svg)](https://codeclimate.com/github/chandley/stop-aids)

# stop-aids

## Synopsis

A project to help students engage with politicians, for charity Students Stop Aids 


## Tools

| Languages  | Technologies  | Testing  | APIs              |   
|------------|---------------|----------|-------------------|
| Ruby       | Angular       | Rspec    | They Work For You |   
| Javascript | JQuery        | Cucumber | Twitter           |   
| HTML5      | Rails         | Capybara | Bitly             |   
| CSS3       | Active Record | Karma    | Mailgun           |   
|            | Action Mailer |          |                   | 
|            | Postgresql    |          |                   |


## How to install

1. Clone the Repo:
  * Run `$ git clone git@github.com:chandley/stop-aids.git`
  * Then '$ bundle install'
  * And Finally `$ rake db:create db:migrate`

3. Set Enviromental Variables:
  You must get api keys for the following and set then in your bash RC file like so `export API_KEY_NAME='your api key'`
  * Twitter
  * Mailgun
  * They work for you
  * Bitly

4. Run the tests:
  * Run `rspec` and `cucumber`
