**A evaluar**
Asset pipeline
Foundation (Framework de estilos)
Modelos
  Validaciones
Resources (en el router)
Form_for
strong_parameters
flash y flash.now
Puma
Sesiones y cookies (session)

1. Installing rails w/ a specific gemset
from: http://railsapps.github.io/installrubyonrails-mac.html
=========================================================
$ mkdir myapp
$ cd myapp
$ rvm use ruby-2.3.1@myapp --ruby-version --create
$ gem install rails
$ rails new .
=========================================================
2. gems
-- Install foundation - Front end framework
-- Install bcrypt - password hashing for Rails' has_secure_password
-- Move sqlite3 to group :development
-- Install pg in group :production
---- Remember to run bundle install --without production (so pg doesn't
                                                          crash installation)
-- install group :test (copied from sample-app)
-- install devise
3. Configure Devise and Foundation (look at documentation for this)
4. Create repo in github and push to remote
5. Create a StaticPagesController to handle home page
6. Add route for home page
7. Deploy to heroku
-- heroku create *domain name*
-- git push heroku master
8. Crear home page
