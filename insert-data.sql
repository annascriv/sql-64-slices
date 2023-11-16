\copy Stores FROM './stage-1/data/stores.csv' DELIMITER ',' CSV HEADER;

\copy Available_Pizzas FROM './stage-1/data/available_pizzas.csv' DELIMITER ',' CSV HEADER;

\copy Available_Toppings FROM './stage-1/data/available_toppings.csv' DELIMITER ',' CSV HEADER;

\copy Customers FROM './stage-1/data/customers.csv' DELIMITER ',' CSV HEADER;

\copy Drivers FROM './stage-1/data/drivers.csv' DELIMITER ',' CSV HEADER;

\copy Orders FROM './stage-1/data/orders2.csv' DELIMITER ',' CSV HEADER;

\copy Deliveries(driver_id,order_id,started_delivery,completed_delivery) FROM './stage-1/data/deliveries.csv' DELIMITER ',' CSV HEADER;

\copy Order_Toppings(order_id, topping_id) FROM './stage-1/data/order_toppings.csv' DELIMITER ',' CSV HEADER;