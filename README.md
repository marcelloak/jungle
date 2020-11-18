# Jungle

A mini e-commerce application built with Rails 4.2.

## Features
- Users can add products to cart and place order
- Admin can add categories and add or delete products

# Additions
- Fixed money formatting
- Added empty cart, sold out badge and order details
- Added admin dashboard and categories
- Added about page
- Added user and admin authentication
- Added model and feature testing

## Final Product

!["Screenshot of home page"](https://github.com/marcelloak/jungle/blob/master/docs/home-page.png)
!["Screenshot of admin dashboard page"](https://github.com/marcelloak/jungle/blob/master/docs/admin-page.png)

## Dependencies

- Rails 4.2
- PostgreSQL 9.x
- Stripe

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>