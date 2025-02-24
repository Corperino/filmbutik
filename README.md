# Filmbutik

## Installation

Follow these steps to set up the project:

### 1. Clone the Repository

```bash
git clone https://github.com/corperino/filmbutik.git
cd filmbutik

```
### 2. Install dependencies
```bash
bundle install
```
### 3. Database Setup
```bash
bin/rails db:create
bin/rails db:migrate
```

### 4. Start server
```bash
bin/rails server
```
### 5. Add Guest-user Seed
```bash
bin/rails db:seed
```
## Features

### Movie categories
"Nya utgåvor" (200 SEK - 20 points)
"Vanliga filmer" (100 SEK - 10 points)
"Gamla filmer" (50 SEK - 5 points)

### Movies
Create a new movie: 
```bash
newMovie = Movie.create(title: "Movie Title", category: "Nya utgåvor")
```
Change movie category: 
```bash
updatedMovie = newMovie.update(category: "Vanliga filmer")
```
Delete movie: 
```bash
updatedMovie.delete
```
### Customer
Create a new customer: 
```bash
customer = Customer.create(name: "Customer name", points: 0)
```
update customer points: 
```bash
customer.update(points: customer.points + 10)
```
Delete customer: 
```bash
customer.delete
```
### Purchase
Create a new purchase: 
```bash
purchase = Purchase.create(movie_id: movie.id, customer_id: customer.id)
```
Create a new purchase with a guest-user: 
```bash
purchase = Purchase.create(movie_id: movie.id, customer_id: 0)
```
### Invoice
Create a new invoice with a customer: 
```bash
invoice = Invoice.create(customer_id: customer_id, purchase_ids: [purchase1.id, purchase2.id])
```
Create a new invoice without a customer: 
```bash
invoice = Invoice.create(purchase_ids: [purchase1.id, purchase2.id])
```


## Testing
```bash
bin/rails test
```