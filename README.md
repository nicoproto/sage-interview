<p align="center">
  <img width="100" alt="image" src="https://pngimg.com/uploads/chuck_norris/chuck_norris_PNG4.png">
</p>

<h1 align="center">
  Readme & Documentation
</h1>

Coding interview developed for Sage. The application is a fact search web that uses the Chuck Norris API.


## Table of Contents

0. [Environment Setup](#environment-setup)
1. [Primary Function One](#primary-function-one)
2. [DB Schema](#db-schema)
3. [Testing](#testing)
3. [Potential Improvements](#potential-improvements)

## Environment Setup

This application is using:
* Ruby 3.1.0
* Rails 6.1.4.3

In your terminal, run the following to clone the project onto your local machine:
```
git clone https://github.com/nicoproto/sage-interview.git
```

### Without Docker
For the final setup for the packages, gems, remotes, and prepping databases run the following:
```
bin/setup
```
Finally, to run the server:
```
./bin/dev
```
### With Docker

```
docker build --no-cache -t sage-interview .
docker-compose up
```


## Considerations

- It's important to have every request on the database, so we would lose information if we group them and add a counter on the request if repeated.
- Because requests that don't provide any results might be useful for creating new facts, we also store them in the database.
- The main focus of the challenge was regarding the functionallity so making the front-end responsive for mobile wasn't a priority.

## DB Schema
The only table on this Schema it's the 'queries' one, a categories table wasn't considered because they are dynamic and provided by the API.

## Testing
<p>
  🛑 TODO: PLEASE CUSTOMIZE AS NEEDED
</p>

To run the test suite run:
```
bundle exec rspec
```

To view the coverage report run:
```
open coverage/index.html
```

The primary toolset is managed by rspec; coverage is managed by simplecov; and additional services are provided by shoulda-matchers.

The primary web driver is handled by capybara.

## Potential Improvements
During the development of the application there were a few ideas of improvement in case the project would require, here are some of them:
- Under the assumption that we need to reduce the number of requests from the API, we could start only calling the API if the input requested doesn't exist in our database.
- Adding more restrictions for words and email validations.

