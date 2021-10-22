# Demo Jobs Backend API

This is the backend Rails API for a demo app.

The demo app is a two sided marketplace (job board), where:

- Employers can post jobs for workers to apply to
- Workers can see a list of jobs, filter by keywords or tags, and apply
- Employers can see their applicants and make a hire/no-hire decision
- Job postings and applications can expire
- Employers, workers, and job postings can have any custom tags

## Endpoints

### Sessions

`POST /api/v1/sessions` Creates an authentication token to be used for subsequent requests for authorization.

`DELETE /api/v1/sessions/:id` Deletes a previously authenticated token.

### Employers

- TODO

### Workers

- TODO

### Postings

- TODO

### Applications

- TODO

## Authentication

- TODO 

## Serialization

- TODO 

## Testing

- TODO

## Local setup

- TODO