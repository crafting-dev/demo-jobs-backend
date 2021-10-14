# Demo App Rails backend 

This is the backend rails service api for the demo app.

## Versions

#### Ruby

The following ruby version is used:
```
ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-linux]
```

#### Rails

The following rails version is used:
```
Rails 6.1.4.1
```

#### Rvm

The following rvm version is used:
```
rvm 1.29.12-next (master) by Michal Papis, Piotr Kuczynski, Wayne E. Seguin [https://rvm.io]
```

## App configuration

The following `App configuration` is used for the demo app:

```yaml
endpoints:
- http:
    routes:
    - backend:
        port: api
        target: backend
    path_prefix: /
name: api
- http:
    routes:
    - backend:
        port: web
        target: frontend
    path_prefix: /
name: web
services:
- description: 'Rails backend '
name: backend
workspace:
    checkouts:
    - path: src/backend
    repo:
        git: git@github.com:crafting-dev/demo-jobs-backend.git
    ports:
    - name: api
    port: 3001
    protocol: HTTP/TCP
- description: React frontend
name: frontend
workspace:
    checkouts:
    - path: src/frontend
    repo:
        git: git@github.com:crafting-dev/demo-jobs-ui.git
    ports:
    - name: web
    port: 3000
    protocol: HTTP/TCP
- managed_service:
    properties:
    database: superhero
    password: brucewayne
    username: batman
    service_type: mysql
    version: "8"
name: mysql
- managed_service:
    service_type: redis
    version: "6.2"
name: redis
```