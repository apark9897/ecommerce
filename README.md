# Ecommerce Demo
An ecommerce website I built to practice full-stack app dev

![home page](https://github.com/apark9897/ecommerce/blob/main/ecommerce_homepage.png?raw=true)
![product details](https://github.com/apark9897/ecommerce/blob/main/ecommerce_productpage.png?raw=true)
![signup](https://github.com/apark9897/ecommerce/blob/main/ecommerce_signup.png?raw=true)
![order page](https://user-images.githubusercontent.com/47507106/86501452-cb599a80-bd4d-11ea-9c69-3ca95072d8f4.png)

## Features
- Browse different categories and products 
- Add products to cart or save to wishlist
- View pending and past orders
- Checkout via Stripe API
- Add new products and categories as an admin

## Tools
- Spring framework for backend
- MySQL as relational database storage
- Vue for frontend components and managing state
- Bootstrap for CSS
- Docker and Docker Compose for quick local testing and deployment

## Getting Started
Quick steps to start the project on your local machine for development and testing purposes.

1. In `docker-compose.yml`, add Stripe public and secret keys to the environment variables of the frontend and backend services.
2. Install docker desktop and run the commands below:
```
docker-compose build
docker-compose up
```

## Testing
WIP