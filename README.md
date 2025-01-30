## Subscribe Challenge
 - [Challenge Information](https://gist.github.com/safplatform/792314da6b54346594432f30d5868f36)

## How to execute locally

- Requirements:
    - Ruby 3.3.7

- First you will need to clone the project, so run the command below:

    `git@github.com:rpaffaro/subscribe-challenge.git`

- Once you have cloned the repository, you can run the project with:

    `ruby app/main.rb`

- To run the test suite locally will be necessary install the dependencies:

    `bundle install`

- When finished you can run:

    `bundle exec rspec`

## How to execute using Docker

- Requirements:
    - Docker

- First you will need to clone the project, so run the command below:

    `git@github.com:rpaffaro/subscribe-challenge.git`

- After cloning the repository, you can build the Docker image with the following command:

    `docker build -t challenge .`

- Once the build is complete, you can run the container with:

    `docker run challenge`

- To run the test suite in docker you can execute the command:

    `docker run challenge rspec`
