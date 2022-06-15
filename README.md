# Sweater Weather

![ruby](https://img.shields.io/badge/Ruby-2.7.4-red)
![rails](https://img.shields.io/badge/Rails-5.2.8-red)
![rspec](https://img.shields.io/badge/RSpec-3.11.0-green)

## Table of Contents
- [Background](#background)
- [Setup](#setup)
- [Endpoints](#endpoints)
- [Contributor](#contributor)

## Background
Sweather Weather is a backend application that consumes and exposes API's to support a front end application for planning roadtrips based on weather conditions.

* Expose an API that retrieves data from multiple external APIs.
* Expose an API that requires an authentication token.
* Determine completion criteria based on the needs of front end developers.
* Research, select, and consume an API based on your needs as a developer.


## Setup
1. Clone this repo
2. Install gem packages: `bundle install`
3. Set up the database: `rails db:{create,migrate}`
4. Get API keys from [MapQuest](https://developer.mapquest.com/documentation/), [OpenWeather](https://openweathermap.org/api), and [Unsplash](https://unsplash.com/documentation#creating-a-developer-account)
5. Run `figaro install` then enter API keys into your `/config/application.yml` file

````
mapquest_api_key: '<enter your key here>'
openweather_api_key: '<enter your key here>'
unsplash_api_key: '<enter your key here>'
````

## Endpoints
- GET `/api/v1/forecast?location=<location>`
````
  "data": {
    "id": null,
    "type": "forecast",
    "attributes": {
      "current_weather": {
        "datetime": "2020-09-30 13:27:03 -0600",
        "temperature": 79.4,
        etc
      },
      "daily_weather": [
        {
          "date": "2020-10-01",
          "sunrise": "2020-10-01 06:10:43 -0600",
          etc
        },
        {...} etc
      ],
      "hourly_weather": [
        {
          "time": "14:00:00",
          "conditions": "cloudy with a chance of meatballs",
          etc
        },
        {...} etc
      ]
    }
  }
````

- GET `/api/v1/backgrounds?location=<location>`
````
"data": {
    "type": "image",
    "id": null,
    "attributes": {
      "image": {
        "location": "denver,co",
        "image_url": "https://pixabay.com/get/54e6d4444f50a814f1dc8460962930761c38d6ed534c704c7c2878dd954dc451_640.jpg",
        "credit": {
          "source": "pixabay.com",
          "author": "quinntheislander",
          "logo": "https://pixabay.com/static/img/logo_square.png"
        }
      }
    }
  }
````
- POST `/api/v1/users`
````
"data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
````
- POST `/api/v1/sessions`
````
"data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
}
````  
- POST `/api/v1/road_trip`
````
"data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
````

## Contributor

#### Joseph Downs
[GitHub](https://github.com/josephdowns) | [LinkedIn](https://www.linkedin.com/in/josdowns/)
