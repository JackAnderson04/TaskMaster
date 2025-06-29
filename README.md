Taskmaster
A Ruby on Rails task management application.
Features

Event/task management system
Task completion tracking
Clean, simple interface

Getting Started
Prerequisites

Ruby 3.x
Rails 8.x
PostgreSQL 15

Installation

Clone the repository:
bashgit clone https://github.com/JackAnderson04/taskmaster.git
cd taskmaster

Install dependencies:
bashbundle install

Set up the database:
bashbin/rails db:create
bin/rails db:migrate

Start the server:
bashbin/rails server

Visit http://localhost:3000 in your browser

Docker Support
This project includes Docker configuration for easy deployment and development.
Using Docker

Build and run with Docker Compose:
bashdocker-compose up --build

The application will be available at http://localhost:3000

Development

Run tests: bin/rails test
Access Rails console: bin/rails console
Generate new migrations: bin/rails generate migration MigrationName

Contributing

Fork the repository
Create a feature branch
Make your changes
Submit a pull request
