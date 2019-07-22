## Article create

Application allowed user to create article/news/post. Browsing post created by other user


### Installation

Below are bash command to be execute to fully run project in development environment. 

```bash
mkdir project
cd project
git@github.com:roshanshrestha01/article-backend.git app
cd app
bundle
bundle exec rspec
rails s
```

Server running at http://localhost:3000/

### Demo 

URL: https://powerful-citadel-52674.herokuapp.com


### Necessary Endpoint

Development \
BASE_URL = http://localhost:3000/ 


####  Post List

URL: BASE_URL + 'v1/posts/' \
Method: GET 

####  Post Create

URL: BASE_URL + 'v1/posts/' \
Method: POST \
Header : {Authorization: 'Token <token>'} \
Data:
```json
{
  "title": "Title",
  "link": "link",
  "source": "source"
}
``` 

####  Post Delete

URL: BASE_URL + 'v1/posts/<post_slug>' \
Header : {Authorization: 'Token <token>'} \
Method: DELETE 


#### Search

Ascending\
URL: BASE_URL + 'v1/posts/?search=keyword' \
Method: GET


####  User Create

URL: BASE_URL + 'v1/users/' \
Method: POST \
Data:
```json
{
  "email": "Email",
  "password": "password",
  "password_confimation": "password_confimation"
}
```

####  Auth token

URL: BASE_URL + 'v1/sessions/' \
Method: POST \
Data:
```json
{
  "email": "Email",
  "password": "password"
}
```

#### Comment

URL: BASE_URL + 'v1/posts/<slug>/comments/' \
Method: POST \
Header : {Authorization: 'Token <token>'} \
Data:
```json
{
  "message": "Message"
}
```

#### Like Post

URL: BASE_URL + 'v1/posts/<slug>/comments/' \
Method: POST \
Header : {Authorization: 'Token <token>'} 

If user already have liked the post set as unliked
