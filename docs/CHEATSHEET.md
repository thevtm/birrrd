# CheatSheet

Use `rails console` to test!

## Git

Rollback file.

```shell
git checkout path/to/file
```

## Database

Every time you migrate or change the seed you should run.

```shell
rails db:drop db:create db:migrate db:seed
```
