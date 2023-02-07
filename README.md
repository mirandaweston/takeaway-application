# Takeaway Application

### This program allows the user to order food from a menu and receive confirmation of their order via text. The program utilises the Twilio API as a Ruby gem to allow the user to receive text confirmation.

## 1. User stories

As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices.

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes.

As a customer
So that I can verify that my order is correct
I would like to see an itemised receipt with a grand total.

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered.

## 2. Installation

_Clone this repo and run the following commands in your terminal_

```
gem install bundler
gem install twilio-ruby
bundle install

# you will also need to create a Twilio account and input your info into TwilioAPI

```

_Then run the program from the command line in IRB_

```ruby

irb
require ./lib/order.rb

```

## 3. Technologies used

- Ruby
- RSpec
- Ruby Gems
- Twilio API
- Timecop Gem to freeze time within a test suite

## 4. Test coverage: 100%


<img width="675" alt="Screenshot 2023-02-07 at 13 27 54" src="https://user-images.githubusercontent.com/117643324/217257896-38f72b7d-b404-482a-9f97-361846b320b4.png">



<!-- BEGIN GENERATED SECTION DO NOT EDIT -->

---


<!-- END GENERATED SECTION DO NOT EDIT -->
