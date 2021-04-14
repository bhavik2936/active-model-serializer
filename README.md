# Active Model Serializer
Demonstrates Model Serializing for `rails` APIs differentiated by versions.

## Description
The project have been implemented to serve versioned APIs in ruby on rails framework.
It serves serialize data objects over the network by `active_model_serializers` gem.

## Install
To setup project locally, follow below instructions.

### Project Configuration
Have ruby version [ruby-2.7.1](https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-7-1-released) installed as mentioned in Gemfile.

Install necessary dependencies.
```bash
# install dependencies mentioned in Gemfile
$ bundle install

# verification of already installed files in node_modules
$ yarn install --check-files
```

### Database Setup
Create and Initialize database.
```bash
# migration of database
$ rails db:migrate

# initialization of database with data
# defined in seed file
$ rails db:seed
```

### Starting the server
To start the server on localhost run the command below. The server will start on default port 3000.
```bash
$ rails s
```

## Examples
For different API versions, there would be different serializers being used implicitly. For which the output of some API endpoints are given below.

### Employee
For `http://localhost:3000/v1/employees`
```json
{
  "data":[
    {
      "id":1,
      "name":"Carley Lindgren",
      "email":"bridgett.cartwright@ruecker.io",
      "designation":"voluptas",
      "manager":{
        "id":12,
        "name":"Bethel Sanford"
      }
    }
  ],
  "message":[
    "Employee list fetched successfully"
  ],
  "status":200,
  "type":"Success"
}
```

For `http://localhost:3000/v2/employees`
```json
{
  "data":[
    {
      "id":1,
      "name":"Carley Lindgren"
    }
  ],
  "message":[
    "Employee list fetched successfully"
  ],
  "status":200,
  "type":"Success"
}
```

### Manager
For `http://localhost:3000/v1/managers`
```json
{
  "data":[
    {
      "id":1,
      "name":"Brandy Hahn PhD",
      "employees":[
        {
          "id":15,
          "name":"Louis Bayer",
          "email":"vaughn.christiansen@kassulke.com",
          "designation":"non"
        },
        {
          "id":35,
          "name":"Stephnie Cronin PhD",
          "email":"brooks@keebler-ryan.name",
          "designation":"hic"
        }
      ]
    }
  ],
  "message":[
    "Manager list fetched successfully"
  ],
  "status":200,
  "type":"Success"
}
```

For `http://localhost:3000/v2/managers`
```json
{
  "data":[
    {
      "id":1,
      "name":"Brandy Hahn PhD",
      "employees":[
        {
          "id":15,
          "name":"Louis Bayer"
        },
        {
          "id":35,
          "name":"Stephnie Cronin PhD"
        }
      ]
    }
  ],
  "message":[
    "Manager list fetched successfully"
  ],
  "status":200,
  "type":"Success"
}
```
