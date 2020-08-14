# Proposed assignment by Ligo

This a the repository for the proposed assignment by Ligo

# Implemented user stories:

1. As a user I should be able to enter my name at the start of the Quiz
2. As a Quiz user, I see one question at a time to answer
3. During the Quiz the user can go back and forth through the different
questions
4. After submission at the end of the Quiz the user can see the final result
5. As a user, I have 2 wildcards per Quiz. A wildcard can be used in any question at any time. Using a wildcard in any question will remove the worst answer from the answer list that is shown at the question page. (The worst answer is calculated based on the answer points)

# Installing and running the server

1. Clone repository:
```
  git clone https://github.com/Joanf81/ligo_survey.git
```

2. Make sure you have Postgresql installed, running, and attending requests on port 5432.

3. Create a new user in Postgress:
```
  username: ligo_survey
  password: 1234
```
(Make sure the new user has permission to crate a new database)

4. Execute commnads:
```
  bundle install
  yarn install --check-files
  rake db:create
  rake db:migrate
  yarn add bootstrap jquery popper.js
  rails server
 ```
 
 5. Ready! :)




