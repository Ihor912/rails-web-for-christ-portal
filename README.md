# Rails web portal for sharing the Good News.

## Steps to run application:

###### Database setup:
- First of all install and configure PostgreSQL on your machine.

- In Terminal:
```
bundle install;
```
```
sudo -u postgres psql
CREATE USER login_name_you_like PASSWORD 'any_password_you_like‘;
ALTER USER login_name_you_like CREATEDB;
\q
```
- Add changes to config/database.yml (under 'timeout' property):
```
host: localhost
username: login_name_that_you_created
password: password_that_you_created
```
- In Terminal:
```
bundle exec rails db:create
bundle exec rails db:migrate
```
###### Admin User Setup:
- In Terminal:
```
rails generate migration AddAdminToUsers
```
- Add code to change method in db/migrate/..._add_admin_to_users.rb:
```
add_column :users, :admin, :boolean, default: false
```
- In Terminal:
```
bundle exec rails db:migrate
```
```
rails c
admin_user = User.new(:email => "admin@mail.com", :password => 'testtest', :password_confirmation => 'testtest', :admin => true)
admin_user.save
exit
```
```
rake routes;
```
###### To run app:
```
rails server
```
###### To Login as Admin:
```
admin@mail.com
testtest
```
Enjoy! :)
