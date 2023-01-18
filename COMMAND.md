Run server

```bash
rails s -p 3000 -b '0.0.0.0'
```

rails generate controller StaticPages with `home` & `help` func

```bash
rails generate controller StaticPages home help
```

rails test

```bash
rails test
```

generate user model

```bash
rails generate model User name:string email:string
```

generate migration user model

```bash
rails generate migration add_index_to_users_email
```

add col to model

```
rails generate migration add_password_digest_to_users password_digest:string
```

generate uploader

```bash
rails generate uploader Picture
```
