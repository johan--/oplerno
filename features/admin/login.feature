Feature: Admin

  Scenario: Create a user without email fails
    * I have a AdminUser
    * I entered my email: 'test@oplerno.com'
    * I press save
    * I get an error

  Scenario: Create a user with email and password succeeds
    * I have a AdminUser
    * I entered my email: 'test@oplerno.com'
    * I entered my password: 'password'
    * I entered my password confirmation: 'password'
    * I press save
    * It succeeds

  Scenario: Create a user with the same email fails
    * I have a AdminUser
    * I entered my email: 'test@oplerno.com'
    * I entered my password: 'password'
    * I entered my password confirmation: 'password'
    * I press save
    * It succeeds
    * I have a AdminUser
    * I entered my email: 'test@oplerno.com'
    * I entered my password: 'password'
    * I entered my password confirmation: 'password'
    * I press save
    * I get an error

	Scenario: Login as an admin user
		* I am not authenticated as an AdminUser
		* I am a AdminUser
		* I login as an AdminUser
		* It succeeds
