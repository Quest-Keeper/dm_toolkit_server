# Quest Keeper - Backend

Welcome to the backend repository of the Quest Keeper application! This backend API is built using Ruby on Rails, providing essential services to the frontend. This application serves the frontend with data related to campaigns, characters, encounters, initiatives, items, and loot.

## Overview

Quest Keeper's backend is a Rails API that serves JSON responses. It uses PostgreSQL as its database. The API is divided into multiple controllers corresponding to each key feature in the frontend:

- **Characters:** Manage character data. This controller interacts with the Character Generator on the frontend.
- **Monsters:** Build encounters with monsters using dynamic data provided by this controller.
- **Items:** Fetch items and loot data, interacting with Item Search and Loot Generator on the frontend.

## Getting Started

1. Clone the repository to your local machine:
2. Navigate into the project directory and install dependencies:

    ```bash
    bundle install
    ```

3. Setup and migrate the database:

    ```bash
    rails db:create db:migrate
    ```

4. Start the Rails server:

    ```bash
    rails s
    ```

5. The server is now running at `http://localhost:3001`.

## Running Tests

This project uses RSpec for testing. Run the tests with the following command:

```bash
bundle exec rspec
```
Thanks for being part of Quest Keeper! Enjoy your adventure!
