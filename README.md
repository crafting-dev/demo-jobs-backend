# Demo Jobs Backend

This is the backend API for a two sided marketplace (job board) demo app. 

It is built with Ruby on Rails in `api_only` mode, along with MySQL db, Rspec testing, and Sidekiq jobs on Redis server.

## Authentication

Users require [Bearer Tokens](https://datatracker.ietf.org/doc/html/rfc6750) in order to interact with most endpoints exposed by the API. 

You can use Basic Auth to acquire a new bearer token:
```bash
curl --location --request POST 'localhost:3000/api/v1/authenticate' \
--header 'Authorization: Basic [token]'
```

where `[token]` is a base64 encoded string containing `'email:password'` credentials.

API will respond with a new token in the form:
```json
{
    "data": {
        "id": "123",
        "type": "api_key",
        "attributes": {
            "token": "my_token",
            "bearer": {
                "id": "",
                "name": "",
                "email": "",
                "type": ""
            }
        }
    }
}
```

You can then make subsequent requests using a Bearer scheme with the newly generated token:
```bash
curl --location --request GET 'localhost:3000/api/v1/postings' \
--header 'Authorization: Bearer my_token'
```

To delete a token, you can make a  DELETE request to `/api/v1/authenticate/:id` with your authorization header and api key `:id`:
```bash
curl --location --request DELETE 'localhost:3000/api/v1/authenticate/123' \
--header 'Authorization: Bearer my_token'
```

## Endpoints

The following endpoints are exposed by the API `v1`. 

| Method | Endpoint | Description | Need Auth |
| :---: | :--- | :--- | :---: |
| POST | */api/v1/authenticate* | Create an authentication token for request authorization | No |
| DELETE | */api/v1/authenticate/:id* | Delete a previously authenticated token | Yes |
| GET | */api/v1/employers/:id* | Get Employer by unique ID | Yes |
| POST | */api/v1/employers* | Create a new Employer | No |
| PUT | */api/v1/employers/:id* | Update an existing Employer | Yes |
| DELETE | */api/v1/employers/:id* | Delete an existing Employer | Yes |
| GET | */api/v1/workers/:id* | Get Worker by unique ID | Yes |
| POST | */api/v1/workers* | Create a new Worker | No |
| PUT | */api/v1/workers/:id* | Update an existing Worker | Yes |
| DELETE | */api/v1/workers/:id* | Delete an existing Worker | Yes |
| INDEX | */api/v1/postings* | List all job Postings | Yes |
| GET | */api/v1/postings/:id* | Get Posting by unique ID | Yes |
| POST | */api/v1/postings* | Create a new job Posting | Yes |
| PUT | */api/v1/postings/:id* | Update an existing job Posting | Yes |
| DELETE | */api/v1/postings/:id* | Delete an existing job Posting | Yes |
| INDEX | */api/v1/applications* | List all job Applications for current user | Yes |
| GET | */api/v1/applications/:id* | Get job Application by unique ID | Yes |
| POST | */api/v1/applications* | Create a new job Application | Yes |
| PUT | */api/v1/applications/:id* | Update an existing job Application | Yes |
| DELETE | */api/v1/applications/:id* | Delete an existing job Application | Yes |

All responses are in `json` format.

## Serialization

This API uses [jsonapi-serializer](https://github.com/jsonapi-serializer/jsonapi-serializer) to serialize all models. Responses are of the form:
```json
{
    "data": {
        "id": "",
        "type": "",
        "attributes": { }
    }
}
```

## Jobs

Active Job is used to run background jobs, configured with Sidekiq for queuing backend. 
```ruby
config.active_job.queue_adapter = :sidekiq
```

To run Sidekiq:
```bash
bundle exec sidekiq
```

## Testing

API uses [Rspec](https://rspec.info/) for tests, along with [Factory Bot](https://github.com/thoughtbot/factory_bot_rails) to set up Ruby objects as test data, and [Faker](https://github.com/faker-ruby/faker) to generate fake data.

You can run all spec files by executing:
```bash
bundle exec rspec
```

The file `db/seeds.rb` contains some testing data to populate and test the database locally:
```bash
rails db:seed
```

Seed data contains the following sample credentials:
| Model | Email | Password |
| :--- | :--- | :--- |
| Employer | batman@crafting.dev | crafting.dev |
| Worker | superman@crafting.dev | crafting.dev |

## Local setup

To get started in your local sandbox:

1. Checkout this repo during your `App configuration` stage, selecting MySQL and Redis as managed services.
2. Start sidekiq: `bundle exec sidekiq`
3. Populate database with seed data: `rails db:seed`
4. Start rails server: `rails s`
5. Access any endpoint following authentication rules.

The following [App Definition](https://docs.sandboxes.cloud/docs/app-definition) was used to create this API.
```yaml
endpoints:
- name: api
  http:
    routes:
    - pathPrefix: "/"
      backend:
        target: backend
        port: api
    authProxy:
      disabled: true
workspaces:
- name: backend
  description: Demo App backend using Ruby on Rails
  ports:
  - name: api
    port: 3001
    protocol: HTTP/TCP
  checkouts:
  - path: backend
    repo:
      git: https://github.com/crafting-dev/demo-jobs-backend
dependencies:
- name: mysql
  serviceType: mysql
  version: '8'
  properties:
    database: superhero
    password: batman
    username: brucewayne
```

## Notes and Caveats

Sandbox external URL `https://XXX.sandboxes.run` is readily available for development. But if you are using local Visual Studio Code and want some remote ports locally available, you can define [workspace settings](https://code.visualstudio.com/docs/getstarted/settings) to [forward](https://code.visualstudio.com/docs/remote/ssh#_forwarding-a-port-creating-ssh-tunnel) the desired remote ports to your local machine. 

For example, to forward port `3001` locally, you can create the file `.vscode/settings.json` and add:
```json
{
  "remote.SSH.defaultForwardedPorts": [
    {
      "localPort": 3001,
      "name": "api",
      "remotePort": 3001
    }
  ]
}
```

Then `http://localhost:3001` will be accessible for local development. 

You can take a look at [Demo Jobs UI](https://github.com/crafting-dev/demo-jobs-ui) for an example UI app that consumes this API.
