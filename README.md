# README

<div style="background: grey;">

## Project Scope

### Overview
    * This Solo Project is my take on Rails Engine from Turing Mod 3. The point of this project is to demonstrate the ability of creating API endpoints and importing pre-existing CSV data into our database. 
---

### Learning Goals
    * Exposing an API
    * Use serializers to format JSON responses
    * Test API exposure
    * Compose Advanced ActiveRecord queries to analyze information stored in SQL Databases
    * Write basic SQL statements without the assistance of an ORM
 ---

### Versions
    * ![](https://img.shields.io/badge/Rails-5.2.4-informational?style=flat&logo=<LOGO_NAME>&logoColor=white&color=2bbc8a)
    * ![](https://img.shields.io/badge/Ruby-2.5.3-orange)
---

### Using this Application
    * Clone this repository onto your local system
    * Clone [this repo](https://github.com/robertorodriguez12/rails_driver) in the same directory that Rails Engine is located
        * Run the following commands when you are in the ```Rails Driver``` repository
            1. bundle
            2. rails db:create && rails db:migrate
            3. bundle exec figaro install
                * This command creates the config/application.yml, within this file append ```RAILS_ENGINE_DOMAIN: http://localhost:3000```
        * In the Solo Project/Rails Engine repository run the following commands
            1. bundle
            2. rails db:create
            3. rails db:reset (this process may take a while while the database is seeded with the required data)
    * Testing: Follow these steps
        1. While in the ```Solo Project/Rails Engine``` directory in your local terminal run ```rails s``` (this will start a local host server)
        2. In a new terminal tab, ```cd``` into the Rails Driver repository then run ```bundle exec rspec```, this command runs the test suite that is within the Rails Driver repository. 
---
### Testing
    * ![Spec Harness](https://img.shields.io/badge/Spec--Tests-17%20total%2016%20passing%201%20skipped-yellowgreen)
    * ![Local Tests](https://img.shields.io/badge/Local__Tests-45%20total%2C%200%20failures%2C%201%20pending-green)
---
### Created Tables
    * Customers
    * Invoices
    * Invoice_Items
    * Items
    * Merchants
    * Transactions

</div>
<br>

## Schema

    ![Schema](https://app.lucidchart.com/publicSegments/view/a967f0a2-86fe-4bf7-b5ad-3ed056ec7e71/image.jpeg)]



