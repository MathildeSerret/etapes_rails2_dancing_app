savoir dans quel dossier on se trouve : pwd
et quels éléments le composent : ls
changer de dossier : cd nom_du_dossier
revenir en arrière : cd ..

créer app rails : rails new nom_de_ton_app
ou avec base de données (BDD) postgresql : rails new -d postgresql nom_de_ton_app
puis créer base de données : rails db:create

aller dans l'app rails : cd nom_de_ton_app
bundle install
vérifier version de rails : rails -v

lancer le serveur : rails server
site de l'application : localhost:3000

ouvrir nouvel onglet terminal : cmd d

#créer un controller static dans le dossier controller : static_controller.rb 
#puis lui attribuer la classe static_controller qui dépend de ApplicationController :
#class StaticController < ApplicationController
#end

créer des controller static avec des méthodes index et index_in_french : 
rails generate controller static index index_in_french
(cela génère aussi les views liées aux méthodes et les routes correspondantes)
possible de créer à la main, et toujours penser : méthode + view + route 

modifier dans fichier routes pour avoir le format : 
get 'welcome', to: 'static#index'

modifier les views correspondantes afin d'afficher ce qu'on veut

pour afficher toutes les routes de notre application : rails routes

en mettant une variable dans la méthode contenue dans le controller, 
on peut la réutiliser en views : @variable
pour afficher variable dans view : <%= @variable %>

créer un modèle utilisateur : rails g model user first_name:string last_name:string

(pour annuler une commande, écrire la même chose en remplaçant g par d :
rails d model user first_name:string last_name:string)

puis faire migration : rails db:migrate

aller en console pour créer des users : rails console
créer user : u = User.new
puis donner prénom : u.first_name = 'mathilde'
puis nom : u.last_name = "serret"
le sauver : u.save 
quitter console : quit 

on peut ensuite appeler cet utilisateur dans le controller : 
@user = User.first 
puts "Ceci est mon user : #{@user}"

on peut aussi l'afficher dans view : 
<h1> welcome <%= @user.first_name %> <%= @user.last_name %> </h1>

voir tous les users dans la console : User.all 

faire une nouvelle route post dans le fichier route :
  post '/', to: 'static#index_post'
puis créer un formulaire dans la view index en ajoutant bien un authenticity token:
<form action="/" method="post">
<input type="hidden" name="authenticity_token" value="<%= form_authenticity_token %>">
</form>

créer une méthode index_post dans le controller :
def index_post
end 

dans cette méthode, on peut récupérer les paramètres intéressants 
(comme les éléments remplis par le visiteur)
en mettant dans la méthode dans le controller : puts params["first_name"]

dans cette méthode, on peut aussi créer de nouveaux users avec les infos visiteurs :
user = User.new
user.first_name = params["first_name"]
user.save
puts user

pour voir le dernier user créé dans la console : User.last 
