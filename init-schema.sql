\c postgres

DROP DATABASE IF EXISTS sixty_fourdb;
CREATE DATABASE sixty_fourdb;

\c sixty_fourdb

DROP TABLE IF EXISTS Stores CASCADE;

CREATE TABLE Stores (
    id SERIAL PRIMARY KEY,
    location VARCHAR
);


DROP TABLE IF EXISTS Available_Pizzas CASCADE;

CREATE TABLE Available_Pizzas (
    id SERIAL PRIMARY KEY,
    pizza_type VARCHAR,
    cost DECIMAL(8,2)
);


DROP TABLE IF EXISTS Available_Toppings CASCADE;

CREATE TABLE Available_Toppings (
    id SERIAL PRIMARY KEY,
    topping_name VARCHAR,
    cost_per_pizza DECIMAL(8,2)
);

DROP TABLE IF EXISTS Customers CASCADE;

CREATE TABLE Customers (
    id SERIAL PRIMARY KEY,
    street VARCHAR,
    city VARCHAR,
    zip VARCHAR,
    country VARCHAR
);

DROP TABLE IF EXISTS Orders CASCADE;

CREATE TABLE Orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES Customers(id),
    ordered_date DATE,
    pizza_type_id INTEGER REFERENCES Available_Pizzas(id),
    store_id INTEGER REFERENCES Stores(id)

);



DROP TABLE IF EXISTS Drivers CASCADE;

CREATE TABLE Drivers (
    id SERIAL PRIMARY KEY,
    store_id INTEGER REFERENCES Stores(id),
    full_name VARCHAR
);

DROP TABLE IF EXISTS Deliveries;

CREATE TABLE Deliveries (
    id SERIAL PRIMARY KEY,
    driver_id INTEGER REFERENCES Drivers(id),
    order_id INTEGER REFERENCES Orders(id),
    started_delivery TIME,
    completed_delivery TIME
);

DROP TABLE IF EXISTS Order_Toppings;

CREATE TABLE Order_Toppings (
    id SERIAL PRIMARY KEY,
    topping_id INTEGER REFERENCES Available_Toppings(id),
    order_id INTEGER REFERENCES Orders(id)
);

