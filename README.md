# LOCALBRUSH

_Flatiron School Module 2 group project_

_Dana, Michael, Nate_

[Link to Demo(Heroku)] heroku (url)

### About LocalBrush

An online platform where painters can look for a painting project at desired price offer and where users (clients) can look for painters by post their room pictures with price offer.

### Dummy Account

- **Painter**

  ID: painter

  PW: painter

- **User**

  ID: user

  PW: user

### Language

- Ruby (Frontend)
- Ruby on Rails with SQLite3 (Backend)

### Features / App Description

- Users:
  - Account ActiveRecord CRUD
  - Post their rooms with price offer
  - Upload picture of their rooms
  - Post reviews and rate painters
  - See which painter accepted which room
- Painter:
  - View all the rooms that all users have uploaded
  - Can accept the room and start project
  - Check painter's (self only) reviews and rate
  - Can also view average rating
- Authentication and authorization with session_id and Bcrypt gem
