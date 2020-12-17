class PagesController < ApplicationController
  def home
    @title = 'Accueil'
  end

  def contact
    @title = 'Contactez nous!'
  end

  def about
    @title = 'À propos'
  end

  def help
    @tilte = "Besoin d'aide"
  end
end
