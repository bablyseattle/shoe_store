# _Shoe Store_

#### _An application to track shoe brands and stores ._

#### By _**Bably Kumari**_

## Description

This web application allows users to add, update, delete and list shoe stores. The user can add and list shoe brands, which include price, add existing shoe brands to a a store.

## Specifications
* Store names and shoe brands are saved with a capital letter regardless of how they are entered.
  * Example input: shoe house
  * Example output: SHOE HOUSE
* Entered prices should be changed to currency format
  * Example input: 50
  * Example output: $50.00
* All stores and brands are unique, no two entries are the same
  * Example input: Nike
  * Example output: Doesn't add Nike two times.
* Store and brand names have a max of 100 characters
  * Example input: Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean mas
  * Example output: Doesn't add above to list.
* Stores and shoe brands can't be created with a blank name
  * Example input: ""
  * Example output: Doesn't add empty string to list.

## Setup/Installation Requirements

* _Clone directory from github using git_


### Installing the necessary database:

* _Do you have postgres and psql installed? [Download](https://www.postgresql.org/download/)_

* _In terminal, navigate into main project directory folder_

* _In your terminal enter:_ ``` $ bundle install ```

* _In your terminal enter:_ ``` $ rake db:migrate ```

* _Enter:_ ```$ruby app.rb```

* _In web browser of choice copy and paste the following into the address field :_ ```http://localhost:4567/```


## 🐛Known Bugs🐛

_There are no known bugs at this time._

## 📧Support and contact details📧

_Feel free to contact me at bablyhyd@gmail.com_

## Technologies Used

_Ruby, Sinatra, SQL, HTML, CSS, Bootstrap, ActiveRecord, Postgres_

### License

*This software is licensed under the MIT license.*

Copyright (c) 2017 **_Bably Kumari_**