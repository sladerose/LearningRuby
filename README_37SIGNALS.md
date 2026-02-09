# Getting Started with Your 37signals-Style App

This application is built with Rails 8, Hotwire, Tailwind CSS, and SQLite.

## Prerequisites
- Ruby 3.4+ (Installed)
- Rails 8.1+ (Installed)
- SQLite3 (Included)

## Running the App locally

To start the development server with Tailwind CSS watching for changes:

On MacOS/Linux:
```bash
bin/dev
```

On Windows:
```bash
bin\server.bat
```

Then open your browser to: http://localhost:3000

## Managing Data

To create a new Post (scaffolded resource):
http://localhost:3000/posts

## Database

The database is SQLite, located at `storage/development.sqlite3`.

## Deployment

Refer to `KAMAL_DEPLOYMENT.md` for deployment instructions.
