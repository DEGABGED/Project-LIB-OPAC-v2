# Project LIB OPAC

## Description

Project LIB OPAC is an OPAC system for the library in the Recoletas Chapel

## Installation

> To be followed...

## Database Setup

> Note: These instructions are for Linux

First install PostgreSQL [here](https://www.postgresql.org/download/linux/ubuntu/) (instructions may vary depending on system)
You can test by checking if you can run `psql`.

Create the database and users by going into the PostgreSQL shell:
```
$ sudo -u postgres psql
```

Then run the following commands:
```
CREATE USER projectlibopac WITH ENCRYPTED PASSWORD 'bakitkopasyamahal' ;
CREATE DATABASE projectlibopac_development OWNER projectlibopac ;
CREATE DATABASE projectlibopac_test OWNER projectlibopac ;
CREATE DATABASE projectlibopac_production OWNER projectlibopac ;
```

Finally, you can run the Rails commands for the database:
```
$ rails db:create
$ rails db:migrate
```
If you're getting Peer Authentication failed errors, you might have to edit your pg_hba.conf file.

[Check this StackOverflow link for details.](https://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge)

## API Guide

### Book Catalog

#### GET /api/books/
View all books

Response format:
```
[
	{
		"id": 1,
        "title": "The Last Question",
        "author": "Isaac Asimov",
        "section": "Games and Learning",
        "batch": 3,
        "size": 3,
        "callnr": 1,
        "time_in": "2017-07-18T14:56:19.178Z",
        "time_out": "2017-07-18T14:56:19.178Z",
        "created_at": "2017-07-18T14:56:19.176Z",
        "updated_at": "2017-07-18T14:56:19.176Z",
        "status": "in_shelf"
	},
	...
]
```

#### GET /api/books/:id/
View a specific book

Response format:
```
{
    "id": 1,
    "title": "The Last Question",
    "author": "Isaac Asimov",
    "section": "Games and Learning",
    "batch": 3,
    "size": 3,
    "callnr": 1,
    "time_in": "2017-07-18T14:56:19.178Z",
    "time_out": "2017-07-18T14:56:19.178Z",
    "created_at": "2017-07-18T14:56:19.176Z",
    "updated_at": "2017-07-18T14:56:19.176Z",
    "status": "in_shelf"
}
```

#### PATCH /api/books/:id/borrow/
Borrow a specific book

#### PATCH /api/books/:id/return/
Return a specific book

### Administrative functions

#### POST /api/books/
Create a new book

Headers:
```
Content-Type: application/json
```

Request body:
```
{
    "title": "CLRS",
    "author": "Cormen",
    "section": "Games and Learning",
    "batch": 3,
    "size": 3
}
```

Response format:
```
\\ Same as 'View a specific book'
```

#### PATCH /api/books/:id/
Edit a specific book

Headers:
```
Content-Type: application/json
```

Request body:
```
{
	"title": "Data Structures",
	"author": "Evangel Quiwa"
}
\\ Can contain any subset of the required fields for 'Create a new book'
```

Response format:
204 No Content

#### DELETE /api/books/:id/
Delete a specific book

Response format:
204 No Content
