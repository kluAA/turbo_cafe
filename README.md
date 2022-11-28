# README

Experimental project to try out Hotwire Turbo to create a dynamic menu order form plus pricing engine with zero JS and state management.

## Installation

Ruby local version should be set to 3.1.2

`$ bundle install`

`$ rails db:setup`

## Start Instructions

`$ rails s`

`$ rails tailwindcss:watch`

Make sure redis server is running in background for hotwire turbo to work.

## Overview of the app

The app utilizes turbo stream and turbo stream broadcasts to update the order entries, orders, and status transitions asynchronously in real time. Zero javscript was written.

![image](https://user-images.githubusercontent.com/55899911/201931519-1e911a8d-b2d3-4bdc-9fa3-0ba19e478660.png)
![image](https://user-images.githubusercontent.com/55899911/201931847-8237148f-aa4b-4efc-b66c-64f96c4eea9d.png)
![image](https://user-images.githubusercontent.com/55899911/204285454-c0f8c225-d028-425e-9dfd-ca6044e7ccef.png)
![image](https://user-images.githubusercontent.com/55899911/204285211-74f973fa-dc09-4095-9e0b-6fc5bef94d07.png)
![image](https://user-images.githubusercontent.com/55899911/204285648-6e54333c-f09b-4ed2-88f4-fbb32117b5bd.png)
