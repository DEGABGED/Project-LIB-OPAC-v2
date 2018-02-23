# Project LIB OPAC

## Description

Project LIB OPAC is an OPAC system for the library in the Recoletas Chapel

## Installation

> To be followed...

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
