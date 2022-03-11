# Simple Rails Site - Blog App

> The Blog app is classic example of a blog website. it will show the list of posts and empower readers to interact with them by adding comments and liking posts.

## Built With
- Ruby
- git
- Rails
- postgresql

## Getting Started

To get a local copy up and running follow these simple example steps.
- Open terminal
- Clone this project by the command: 

```
$ git clone git@github.com:gracekabaghe/rails-simple-site.git
```

- Then go to the main folder using the next command:

```
$ cd rails-simple-site.
```

```
rails db:create
```

```
rails db: migrate
```

```
rails s
```

# Testing

```
rspec
```

# API End Points

- `GET` user with the id:

``````
/api/v1/users/(user_id)
``````

- `GET` user's post:

```
/api/v1/users/(user_id)/posts
```

- `GET` user's comments:

```
/api/v1/users/(user_id)/posts/(post_id)/comments
```

- `POST` user's new comment:

```
/api/v1/users/(user_id)/posts/(post_id)/comments
```

## Authors

👤 **Grace Kabaghe**

- GitHub: [@gracekabaghe](https://github.com/gracekabaghe)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/grace-kabaghe)

👤 **Orçun Uğur**

- GitHub: [@githubhandle](https://github.com/luftedar)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/orcunugur)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](./MIT.md) licensed.