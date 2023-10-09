require 'rails_helper'
require 'active_support/all'
describe 'ProductsControllerSpec', type: :request do

  describe 'POST /products' do
    it 'should create a valid product' do

      # {
      #     "endpoint": "/products",
      #     "method": "POST",
      #     "headers": {
      #         "Content-Type": "application/json"
      #     },
      #     "body": {
      #         "name": "Pen",
      #         "description": "Black",
      #         "vendor": "Parker",
      #         "price": 1010,
      #         "stock": 5,
      #         "currency": "EUR"
      #         "image_url": "https://via.placeholder.com/150"
      #         "sku": "SKU001"
      #     },
      #     "response": "",
      #     "response_code": 201
      # }

      params = {
        name: 'Pen',
        description: 'Black',
        vendor: 'Parker',
        price: 1010,
        stock: 5,
        currency: 'EUR',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU001'
      }

      post '/products', params: params, as: :json
      expect(response.status).to eq 201
    end

    it 'should not create a product with negative price' do

      # {
      #     "endpoint": "/products",
      #     "method": "POST",
      #     "headers": {
      #         "Content-Type": "application/json"
      #     },
      #     "body": {
      #         "name": "Blouse",
      #         "description": "Red",
      #         "vendor": "Gucci",
      #         "price": -30010,
      #         "stock": 2,
      #         "currency": "USD"
      #         "image_url": "https://via.placeholder.com/150"
      #         "sku": "SKU012"
      #     },
      #     "response": "",
      #     "response_code": 422
      # }

      params = {
        name: 'Blouse',
        description: 'Red',
        vendor: 'Gucci',
        price: -30010,
        stock: 2,
        currency: 'USD',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU012'
      }

      post '/products', params: params, as: :json
      expect(response.status).to eq 422
    end

    it 'should not create a product with no name specified' do

      # {
      #     "endpoint": "/products",
      #     "method": "POST",
      #     "headers": {
      #         "Content-Type": "application/json"
      #     },
      #     "body": {
      #         "description": "Summer sale",
      #         "vendor": "Apple",
      #         "price": 199910,
      #         "stock": 50,
      #         "currency": "EUR"
      #         "image_url": "https://via.placeholder.com/150"
      #         "sku": "SKU999"
      #     },
      #     "response": "",
      #     "response_code": 422
      # }

      params = {
        description: 'Summer sale',
        vendor: 'Apple',
        price: 199910,
        stock: 50,
        currency: 'EUR',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU999'
      }

      post '/products', params: params, as: :json
      expect(response.status).to eq 422
    end

    it 'should not create a product with a name longer than 40 characters' do

      # {
      #     "endpoint": "/products",
      #     "method": "POST",
      #     "headers": {
      #         "Content-Type": "application/json"
      #     },
      #     "body": {
      #         "name": "Summer sale 90% discount, only last sizes are in stock"
      #         "description": "Summer sale",
      #         "vendor": "DG",
      #         "price": 1955,
      #         "stock": 50,
      #         "currency": "EUR"
      #         "image_url": "https://via.placeholder.com/150"
      #         "sku": "SKU999"
      #     },
      #     "response": "",
      #     "response_code": 422
      # }

      params = {
        name: 'Summer sale 90% discount, only last sizes are in stock',
        description: 'Summer sale',
        vendor: 'DG',
        price: 1955,
        stock: 50,
        currency: 'EUR',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU999'
      }

      post '/products', params: params, as: :json
      expect(response.status).to eq 422
    end

    it 'should not create a product with a vendor longer than 100 characters' do

      # {
      #     "endpoint": "/products",
      #     "method": "POST",
      #     "headers": {
      #         "Content-Type": "application/json"
      #     },
      #     "body": {
      #         "name": "Shoes"
      #         "description": "Summer sale",
      #         "vendor": "The incredibly long winded etymologically restrictive dictionary design company and association CO LTD.",
      #         "price": 1955,
      #         "stock": 50,
      #         "currency": "EUR"
      #         "image_url": "https://via.placeholder.com/150"
      #         "sku": "SKU999"
      #     },
      #     "response": "",
      #     "response_code": 422
      # }

      params = {
        name: 'Shoes',
        description: 'Summer sale',
        vendor: 'The incredibly long winded etymologically restrictive dictionary design company and association CO LTD.',
        price: 1955,
        stock: 50,
        currency: 'EUR',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU999'
      }

      post '/products', params: params, as: :json
      expect(response.status).to eq 422
    end

    it 'should not create a product with no price specified' do

      # {
      #     "endpoint": "/products",
      #     "method": "POST",
      #     "headers": {
      #         "Content-Type": "application/json"
      #     },
      #     "body": {
      #         "name": "Smartphone",
      #         "description": "Rose Gold",
      #         "vendor": "Windows",
      #         "stock": 1,
      #         "currency": "USD"
      #         "image_url": "https://via.placeholder.com/150"
      #         "sku": "SKU000001"
      #     },
      #     "response": "",
      #     "response_code": 422
      # }

      params = {
        name: 'Smartphone',
        description: 'Rose Gold',
        vendor: 'Windows',
        stock: 1,
        currency: 'USD',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU000001'
      }

      post '/products', params: params, as: :json
      expect(response.status).to eq 422
    end

    it 'should not create a product when price is not an integer' do

      # {
      #     "endpoint": "/products",
      #     "method": "POST",
      #     "headers": {
      #         "Content-Type": "application/json"
      #     },
      #     "body": {
      #         "name": "Pillow case",
      #         "description": "40x40, flower print",
      #         "vendor": "Home OU",
      #         "stock": 198,
      #         "price": 40.55
      #         "currency": "USD"
      #         "image_url": "https://via.placeholder.com/150"
      #         "sku": "SKU000561"
      #     },
      #     "response": "",
      #     "response_code": 422
      # }

      params = {
        name: 'Pillow case',
        description: '40x40, flower print',
        vendor: 'Home OU',
        stock: 198,
        price: 40.555,
        currency: 'USD',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU000561'
      }

      post '/products', params: params, as: :json
      expect(response.status).to eq 422
    end

    it 'should not create a product with no currency specified' do

      # {
      #     "endpoint": "/products",
      #     "method": "POST",
      #     "headers": {
      #         "Content-Type": "application/json"
      #     },
      #     "body": {
      #         "name": "Pen case",
      #         "description": "Blue",
      #         "vendor": "Parker",
      #         "price": 50099,
      #         "stock": 3,
      #         "image_url": "https://via.placeholder.com/150"
      #         "sku": "SKU002"
      #     },
      #     "response": "",
      #     "response_code": 422
      # }

      params = {
        name: 'Pen case',
        description: 'Blue',
        vendor: 'Parker',
        price: 50099,
        stock: 3,
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU002'
      }

      post '/products', params: params, as: :json
      expect(response.status).to eq 422
    end

    it 'should not create a product with no stock specified' do

      # {
      #     "endpoint": "/products",
      #     "method": "POST",
      #     "headers": {
      #         "Content-Type": "application/json"
      #     },
      #     "body": {
      #         "name": "Ring",
      #         "description": "Silver",
      #         "vendor": "Pandora",
      #         "price": 10000,
      #         "currency": "USD"
      #         "image_url": "https://via.placeholder.com/150"
      #         "sku": "SKU00-88-99-1"
      #     },
      #     "response": "",
      #     "response_code": 422
      # }

      params = {
        name: 'Ring',
        description: 'Silver',
        vendor: 'Pandora',
        price: 10000,
        currency: 'USD',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU00-88-99-1'
      }

      post '/products', params: params, as: :json
      expect(response.status).to eq 422
    end

    it 'should not create a product with negative stock specified' do

      # {
      #     "endpoint": "/products",
      #     "method": "POST",
      #     "headers": {
      #         "Content-Type": "application/json"
      #     },
      #     "body": {
      #         "name": "Shoulder bag",
      #         "description": "Dark grey",
      #         "vendor": "Channel",
      #         "price": 99999,
      #         "stock": -5,
      #         "currency": "EUR"
      #         "image_url": "https://via.placeholder.com/150"
      #         "sku": "CHA-00034"
      #     },
      #     "response": "",
      #     "response_code": 422
      # }

      params = {
        name: 'Shoulder bag',
        description: 'Dark grey',
        vendor: 'Channel',
        price: 99999,
        stock: -5,
        currency: 'EUR',
        image_url: 'https://via.placeholder.com/150',
        sku: 'CHA-00034'
      }

      post '/products', params: params, as: :json
      expect(response.status).to eq 422
    end

    it 'should not create a product when stock is not an integer' do

      # {
      #     "endpoint": "/products",
      #     "method": "POST",
      #     "headers": {
      #         "Content-Type": "application/json"
      #     },
      #     "body": {
      #         "name": "MacBook PRO",
      #         "description": "Space grey",
      #         "vendor": "Apple",
      #         "price": 2800,
      #         "stock": 20.05,
      #         "currency": "EUR"
      #         "image_url": "https://via.placeholder.com/150"
      #         "sku": "SKU8877001"
      #     },
      #     "response": "",
      #     "response_code": 422
      # }

      params = {
        name: 'MacBook PRO',
        description: 'Space grey',
        vendor: 'Apple',
        price: 2800,
        stock: 20.05,
        currency: 'EUR',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU8877001'
      }

      post '/products', params: params, as: :json
      expect(response.status).to eq 422
    end

    it 'should not create a product with invalid currency' do

      # {
      #     "endpoint": "/products",
      #     "method": "POST",
      #     "headers": {
      #         "Content-Type": "application/json"
      #     },
      #     "body": {
      #         "name": "Smart watch",
      #         "description": "Gold",
      #         "vendor": "Samsung",
      #         "price": 40045,
      #         "stock": 30,
      #         "currency": "INVALID"
      #         "image_url": "https://via.placeholder.com/150"
      #         "sku": "SKU12345"
      #     },
      #     "response": "",
      #     "response_code": 422
      # }

      params = {
        name: 'Smart watch',
        description: 'Gold',
        vendor: 'Samsung',
        price: 40045,
        stock: 30,
        currency: 'INVALID',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU12345'
      }

      post '/products', params: params, as: :json
      expect(response.status).to eq 422
    end
  end

  describe 'GET /products/:id' do
    it 'should find a product by ID (JSON response)' do

      # {
      #     "endpoint": "/products/1",
      #     "method": "GET",
      #     "headers": {
      #         "Accept": "application/json",
      #     },
      #     "response": {
      #         "id": 1,
      #         "name": "Pen",
      #         "description": "Black",
      #         "vendor": "Parker",
      #         "price": 1010,
      #         "stock": 5,
      #         "currency": "EUR"
      #         "image_url": "https://via.placeholder.com/150"
      #         "sku": "SKU001"
      #     },
      #     "response_code": 200
      # }

      params = {
        name: 'Pen',
        description: 'Black',
        vendor: 'Parker',
        price: 1010,
        stock: 5,
        currency: 'EUR',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU001'
      }
      post '/products', params: params, as: :json
      expect(response.status).to eq 201
      product_id = JSON.parse(response.body)['id']

      params = {
        name: 'Pen case',
        description: 'Blue',
        vendor: 'Parker',
        price: 50099,
        stock: 3,
        currency: 'EUR',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU002'
      }
      post '/products', params: params, as: :json
      expect(response.status).to eq 201

      get "/products/#{product_id}", headers: {Accept: 'application/json'}

      expected = {
        id: product_id,
        name: 'Pen',
        description: 'Black',
        vendor: 'Parker',
        price: 1010,
        stock: 5,
        currency: 'EUR',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU001'
      }

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to eq(expected.deep_stringify_keys)
    end

    it 'should find a product by ID (XML response)' do

      # {
      #     "endpoint": "/products/1",
      #     "method": "GET",
      #     "headers": {
      #       "Accept": "application/xml"
      #     },
      #     "response": "<?xml version="1.0" encoding="UTF-8"?>
      #     <product>
      #       <id type="integer">1</id>
      #       <name>Pen</name>
      #       <price type="integer">1010</price>
      #       <stock type="integer">5</stock>
      #       <description>Black</description>
      #       <vendor>Parker</vendor>
      #       <currency>EUR</currency>
      #       <image-url>https://via.placeholder.com/150</image-url>
      #       <sku>SKU001</sku>
      #     </product>
      #     ",
      #     "response_code": 200
      # }

      params = {
        name: 'Pen',
        description: 'Black',
        vendor: 'Parker',
        price: 1010,
        stock: 5,
        currency: 'EUR',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU001'
      }
      post '/products', params: params, as: :json
      expect(response.status).to eq 201
      product_id = JSON.parse(response.body)['id']

      params = {
        name: 'Pen case',
        description: 'Blue',
        vendor: 'Parker',
        price: 50099,
        stock: 3,
        currency: 'EUR',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU002'
      }
      post '/products', params: params, as: :json
      expect(response.status).to eq 201

      get "/products/#{product_id}", headers: {Accept: 'application/xml'}

      expected = {
        product: {
          id: 1,
          name: 'Pen',
          description: 'Black',
          vendor: 'Parker',
          price: 1010,
          stock: 5,
          currency: 'EUR',
          image_url: 'https://via.placeholder.com/150',
          sku: 'SKU001'
        }
      }

      expect(response.status).to eq 200
      expect(Hash.from_xml(response.body)).to eq(expected.deep_stringify_keys)
    end

    it 'should not find any product by non-existing ID' do

      # {
      #     "endpoint": "/products/1",
      #     "method": "GET",
      #     "headers": {
      #         "Accept": "application/json",
      #     },
      #     "body": {},
      #     "response": {}
      #     "response_code": 404
      # }

      get '/products/1', headers: {Accept: 'application/json'}
      expect(response.status).to eq 404
    end
  end

  describe 'GET /products' do
    it 'should return all products ordered by ID (JSON)' do

      # {
      #     "endpoint": "/products",
      #     "method": "GET",
      #     "headers": {
      #         "Accept": "application/json"
      #     },
      #     "response": [
      #         {
      #           "id": 1,
      #           "name": "Smartphone",
      #           "description": "Rose Gold",
      #           "vendor": "Rose gold",
      #           "price": 50000,
      #           "stock": 1,
      #           "currency": "USD"
      #           "image_url": "https://via.placeholder.com/150"
      #           "sku": "SKU000001"
      #         },
      #         {
      #           "id": 2,
      #           "name": "Smart watch",
      #           "description": "Gold",
      #           "vendor": "Samsung",
      #           "price": 40045,
      #           "stock": 30,
      #           "currency": "USD"
      #           "image_url": "https://via.placeholder.com/150"
      #           "sku": "SKU12345"
      #         },
      #     ]
      #     "response_code": 200
      # }

      params = {
        name: 'Smartphone',
        description: 'Rose Gold',
        vendor: 'Windows',
        stock: 1,
        price: 50000,
        currency: 'USD',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU000001'
      }
      post '/products', params: params, as: :json
      expect(response.status).to eq 201

      params = {
        name: 'Smart watch',
        description: 'Gold',
        vendor: 'Samsung',
        price: 40045,
        stock: 30,
        currency: 'USD',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU12345'
      }
      post '/products', params: params, as: :json
      expect(response.status).to eq 201

      get '/products', headers: {Accept: 'application/json'}

      expected = [
        {
          id: 1,
          name: 'Smartphone',
          description: 'Rose Gold',
          vendor: 'Windows',
          stock: 1,
          price: 50000,
          currency: 'USD',
          image_url: 'https://via.placeholder.com/150',
          sku: 'SKU000001'
        },
        {
          id: 2,
          name: 'Smart watch',
          description: 'Gold',
          vendor: 'Samsung',
          price: 40045,
          stock: 30,
          currency: 'USD',
          image_url: 'https://via.placeholder.com/150',
          sku: 'SKU12345'
        }
      ]

      expect(response.status).to eq 200
      expect(JSON.parse(response.body)).to eq(expected.map(&:deep_stringify_keys))
    end

    it 'should return all products ordered by ID (XML)' do
      # {
      #     "endpoint": "/products",
      #     "method": "GET",
      #     "headers": {
      #         "Accept": "application/xml"
      #     },
      #     "response": "<?xml version="1.0" encoding="UTF-8"?>
      #     <products type="array">
      #       <product>
      #         <id type="integer">1</id>
      #         <name>Smartphone</name>
      #         <price type="integer">50000</price>
      #         <stock type="integer">1</stock>
      #         <description>Rose Gold</description>
      #         <vendor>Windows</vendor>
      #         <currency>USD</currency>
      #         <image-url>https://via.placeholder.com/150</image-url>
      #         <sku>SKU000001</sku>
      #       </product>
      #       <product>
      #         <id type="integer">2</id>
      #         <name>Smart watch</name>
      #         <price type="integer">40045</price>
      #         <stock type="integer">30</stock>
      #         <description>Gold</description>
      #         <vendor>Samsung</vendor>
      #         <currency>USD</currency>
      #         <image-url>https://via.placeholder.com/150</image-url>
      #         <sku>SKU12345</sku>
      #       </product>
      #     </products>
      #     "
      #     "response_code": 200
      # }

      params = {
        name: 'Smartphone',
        description: 'Rose Gold',
        vendor: 'Windows',
        stock: 1,
        price: 50000,
        currency: 'USD',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU000001'
      }
      post '/products', params: params, as: :json
      expect(response.status).to eq 201

      params = {
        name: 'Smart watch',
        description: 'Gold',
        vendor: 'Samsung',
        price: 40045,
        stock: 30,
        currency: 'USD',
        image_url: 'https://via.placeholder.com/150',
        sku: 'SKU12345'
      }
      post '/products', params: params, as: :json
      expect(response.status).to eq 201

      get '/products', headers: {Accept: 'application/xml'}

      expected = {
        products: [
          {
            id: 1,
            name: 'Smartphone',
            description: 'Rose Gold',
            vendor: 'Windows',
            stock: 1,
            price: 50000,
            currency: 'USD',
            image_url: 'https://via.placeholder.com/150',
            sku: 'SKU000001'
          },
          {
            id: 2,
            name: 'Smart watch',
            description: 'Gold',
            vendor: 'Samsung',
            price: 40045,
            stock: 30,
            currency: 'USD',
            image_url: 'https://via.placeholder.com/150',
            sku: 'SKU12345'
          }
        ]
      }

      expect(response.status).to eq 200
      expect(Hash.from_xml(response.body)).to eq(expected.deep_stringify_keys)
    end
  end
end
