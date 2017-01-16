# Cable: Chat-commerce application built with Rails for fun

This for-fun, educational application is made for the following objectives:

1. To demonstrate the Ruby language
2. To demonstrate Rails and its capabilities
3. To demonstrate the use of Midtrans Snap library for handling payment
4. To demonstrate ActionCable, MVC, and semi-advanced Rails features

## Setting up procedures

1. Install `Ruby`, `bundler`, `Ruby on Rails`, `Redis`, `SQLite`. [Automate installation with vagrant!](https://github.com/saveav/rails-vagrant)
2. Clone this repo.
3. Run `bundle install` on the root folder of the cloned repo.
4. If you have a standard MySQL installation, execute `rake db:create db:migrate` on the console. Otherwise edit `config/database.yml` as necessary and then run the same command. 
5. Run `rake db:seed` to initialise the database state with some data.
6. Run `rails s` to start the web server. By default the system is served at `http://localhost:3000`.
7. Run `bundle exec sidekiq` to run the sidekiq background job processor that process incoming chat message and properly broadcast them.

## Making payment

Each payment link ("Beli") appear on a message that contains a pattern in the form of:

> (some text if any) jual (item name) (comma) (item price)

Example of texts that will create the "Beli" link:

1. Jual buku, 50.000
2. Nih gue jual stick PS, 50.000
3. Gue jual stick PS, 50.000; memory card, 200.000 
