# Takeaway
This program emulates a simple Takeaway ordering system to meet the user stories below and has been achieved using the BDD cycle with a test driven approach. Unit tests include test doubles to effectively isolate the single class being tested and feature tests check correct integration behaviour between the classes. I have created four separate classes, Takeaway, Menu, Order and Printer to ensure each class has a single responsibility and have injected dependencies where needed. The design ensures that the classes are open for extension but closed for modification.

The code also defends against edge cases such as trying to add a dish that is not on the menu, choosing an invalid quantity of a dish and trying to submit an empty order.

## User Stories
```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I know how much I am spending
I would like to check the total sum of the dishes I have selected

As a customer
So that I can confirm my selected dishes
I would like to submit my order and receive confirmation it has been received
```

## How to set up
Clone the repo to your local machine, change into the directory and install the needed gems:
```
$ bundle install
```
To run the test suite:
```
$ rspec
```

## How to use
```
2.5.1 :001 > require './lib/menu.rb'
 => true
2.5.1 :002 > standard_menu = Menu.new(salad: 4.75, soup: 3.50, sandwich: 6.25)
 => #<Menu:0x00007f871e856130 ..>
2.5.1 :003 > require './lib/takeaway.rb'
 => true
2.5.1 :004 > t = Takeaway.new(menu: standard_menu)
 => #<Takeaway:0x00007f871e9836e8 ..>
2.5.1 :005 > t.choose(:salad, 1)
 => {:salad=>1}
2.5.1 :006 > t.choose(:salad, 2)
 => {:salad=>3}
2.5.1 :007 > t.choose(:pizza, 1)
RuntimeError (Cannot add pizza: it is not on the menu)
2.5.1 :008 > t.choose(:soup, 0)
RuntimeError (Cannot add soup: invalid quantity chosen)
2.5.1 :009 > t.choose(:soup, 1)
 => {:salad=>3, :soup=>1}
2.5.1 :010 > t.view_total
 => 17.75
2.5.1 :011 > t.submit_order
 => "Order received!"
```
