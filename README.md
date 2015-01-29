[![Test Coverage](https://codeclimate.com/github/chandley/stop-aids/badges/coverage.svg)](https://codeclimate.com/github/chandley/stop-aids)
[![Code Climate](https://codeclimate.com/github/chandley/stop-aids/badges/gpa.svg)](https://codeclimate.com/github/chandley/stop-aids)

# Would you Rather?
--photo--
## Synopsis

Team Stop Aids, working with the charity Students Stop Aids are proud to present <i>Would You Rather?<i>

Students Stop Aids wanted to give students another way to engage with their local candidates in the run up to the 2015 General Election, something a little less stifly formal than the existing options. So, they approached Makers Academy about creating a would you rather game that lets students ask fun and pertinant questions of their local candidate. 
Our team loved the idea of working with a charity client and creating something that could be used in the real world to meet real needs! Rising to the challange with this flowing, colourful webapp which we hope shows the potential of this idea.



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
  * Then `$ bundle install`
  * And Finally `$ rake db:create db:migrate`

3. Set Enviromental Variables:
  You must get api keys for the following and set then in your .bashrc file like so `export API_KEY_NAME='your api key'`
  * Twitter
  * Mailgun
  * They work for you
  * Bitly

4. Run the tests:
  * Run `rspec` and `cucumber`
