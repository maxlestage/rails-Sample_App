# Tutoriel Ruby on Rails : Application Exemple

C'est l'Application Exemple pour le
[*Tutoriel Ruby on Rails : Apprendre Rails par l'exemple*](http://railstutorial.org/)
par [Michael Hartl](http://michaelhartl.com/).

$ cd ~/rails_projects
$ rails new sample_app -T
$ cd sample_app

Ici, l'option -T ajoutée à la commande rails demande à Rails de ne pas générer le dossier test associé au frameword par défaut Test::Unit. Cela ne signifie pas que nous n'exécuterons pas de tests ; au contraire, dès la section 3.2 nous utiliserons un framework de test alternatif appelé RSpec pour réaliser une suite approfondie de tests.


Générer un contrôleur de Pages:

    $ rails generate controller Pages home contact
        create  app/controllers/pages_controller.rb
        route  get "pages/contact"
        route  get "pages/home"
        invoke  erb
        create    app/views/pages
        create    app/views/pages/home.html.erb
        create    app/views/pages/contact.html.erb
        invoke  rspec
        create    spec/controllers/pages_controller_spec.rb
        create    spec/views/pages
        create    spec/views/pages/home.html.erb_spec.rb
        create    spec/views/pages/contact.html.erb_spec.rb
        invoke  helper
        create    app/helpers/pages_helper.rb
        invoke    rspec

La génération de pages de contrôleurs de l'extrait 3.4 actualise automatiquement le fichier de routage, nommé config/routes.rb, que Rails utilise pour trouver la correspondance entre URLs et pages web. C'est notre première rencontre avec le dossier config, donc il peut être utile d'y jeter un coup d'œil (illustration 3.4). Le dossier config est l'endroit où Rails rassemble les fichiers nécessaires à la configuration de l'application — d'où bien sûr son nom.

Les ROUTES: 

Extrait 3.5. Le routage pour l'action home et l'action contact dans le contrôleur Pages.
config/routes.rb
SampleApp::Application.routes.draw do
  get "pages/home"
  get "pages/contact"
  .
  .
  .
end
Ici la règle :

get "pages/home"
… se charge de la requête pour l'URL /pages/home pour la page d'accueil (action home) dans le contrôleur Pages. Plus encore, en utilisant get nous nous arrangeons pour que la route réponde à la requête GET, qui est un des verbes HTTP fondamentaux supporté par le Hypertext Transfer Protocol (Box 3.1). Dans notre cas, cela signifie que lorsque nous générons une action home à l'intérieur du contrôleur Pages nous atteignons automatiquement une page à l'adresse /pages/home. Pour voir le résultat, « tuez » le serveur avec Ctrl-C, jouez la commande rails server, et naviguez alors à l'adresse /pages/home.


Les helper:
Une façon courante de traiter ce cas est de définir un helper (un « assistant », un « auxiliaire ». NdT), qui est une fonction conçue pour être utilisée avec les vues. Définissons un helper titre qui retourne une base de titre, « Simple App du Tutoriel Ruby on Rails », si aucune variable @titre n'est définie, et ajoute une barre verticale dans le cas où cette variable serait définie (extrait 4.2).1

Extrait 4.2. Définir un helper de titre.
app/helpers/application_helper.rb
module ApplicationHelper

# Retourner un titre basé sur la page.
```
# app/helpers/application_helper.rb
def titre
    base_titre = "Simple App du Tutoriel Ruby on Rails"
        if @titre.nil?
        base_titre
        else
        "#{base_titre} | #{@titre}"
        end
    end
end
`