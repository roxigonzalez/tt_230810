# Ruby on Rails: Warehouse API 

## Project Specifications

**Read-Only Files**
- spec/*

**Environment**  

- Ruby version: 2.7.1
- Rails version: 6.0.2
- Default Port: 8000

**Commands**
- run: 
```bash
bin/bundle exec rails server --binding 0.0.0.0 --port 8000
```
- install: 
```bash
source ~/.rvm/scripts/rvm && rvm --default use 2.7.1 && bin/bundle install
```
- test: 
```bash
RAILS_ENV=test bin/rails db:migrate && RAILS_ENV=test bin/bundle exec rspec
```
    
## Question description

Each product should have the following structure:

* id: the unique ID of the product
* name: the name of the product
* description: the description of the product
* vendor: the product vendor name
* price: the price, represented as a non-negative integer denoting cents
* currency: the currency of product (either EUR or USD)
* stock: the number of product items in the warehouse
* image_url: the URL of the product image
* sku: the product stock-keeping unit (SKU)

Example of a product data JSON object:

```
{
   "id": 1,
   "name": "Pen",
   "description": "Black",
   "vendor": "Parker",
   "price": 1010,
   "stock": 5,
   "currency": "EUR",
   "image_url": "https://via.placeholder.com/150",
   "sku": "SKU001"
}
```

Example of a product data XML object:

```
<?xml version="1.0" encoding="UTF-8"?>
<product>
  <id type="integer">1</id>
  <name>Smartphone</name>
  <price type="integer">50000</price>
  <stock type="integer">1</stock>
  <description>Rose Gold</description>
  <vendor>Windows</vendor>
  <currency>USD</currency>
  <image-url>https://via.placeholder.com/150</image-url>
  <sku>SKU000001</sku>
</product>
```

Requirements:

`POST` request to `/products`:

* Accepts a JSON payload
* The endpoint should validate the following conditions:
    * name is set
    * The length of name is not more than 40 characters
    * The length of vendor (if provided) is not more than 100 characters
    * price is set
    * price is a non-negative integer
    * currency is set
    * currency is USD or EUR
    * stock is set
    * stock is an integer  
* If any of the above requirements fail, the server should return the response code 422. Otherwise, in the case of a successful request, the server should return the response code 201.
* The server returns the response in JSON format only.

`GET` request to `/products`:

* Returns response in JSON if JSON format is requested: request header contains `"Accept": "application/json"`
* Returns response in XML if XML format is requested: request header contains `"Accept": "application/xml"`
* Products should be ordered by `id`.
* The HTTP response code should be 200.

`GET` request to `/products/:id`:

* Returns response in JSON if JSON format is requested: request header contains `"Accept": "application/json"`
* Returns response in XML if XML format is requested: request header contains `"Accept": "application/xml"`
* If the product with the given `id` does not exist, then the response code should be 404. Otherwise, the response code should be 200.
