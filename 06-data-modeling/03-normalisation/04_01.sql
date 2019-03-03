CREATE TABLE country(code, name);
CREATE TABLE region(country, name);
CREATE TABLE city(country, region, name, zipcode);
CREATE TABLE street(name);
CREATE TABLE city_street_numbers(country, region, city, street, number, location);
