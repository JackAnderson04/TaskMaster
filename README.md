# Taskmaster

A Ruby on Rails task management application.

## Features

- Event/task management system
- Task completion tracking
- Clean, simple interface
- Mailer reminders

## Getting Started

### Prerequisites

- Ruby 3.x
- Rails 8.x
- PostgreSQL 15

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/JackAnderson04/taskmaster.git
   cd taskmaster
   ```

2. Install dependencies:
   ```bash
   bundle install
   ```

3. Set up the database:
   ```bash
   bin/rails db:create
   bin/rails db:migrate
   ```

4. Start the server:
   ```bash
   bin/rails server
   ```

5. Visit `http://localhost:3000` in your browser

## Docker Support

This project includes Docker configuration for easy deployment and development.

### Using Docker

1. Build and run with Docker Compose:
   ```bash
   docker-compose up --build
   ```

2. The application will be available at `http://localhost:3000`

## Development

- Run tests: `bin/rails test`
- Access Rails console: `bin/rails console`
- Generate new migrations: `bin/rails generate migration MigrationName`

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request
