module ApplicationHelper
  def title
    base_titre = "Simple App du Tutoriel Ruby on Rails"
    if @title.nil? # Si titre est vide ou non remplit
      base_titre # affiche base_titre uniquement
    else
      "#{base_titre} | #{@title}" # Affiche "base_titre |" +"@titre".  @titre que l'on récupère dans notre pages_controller.rb
    end
  end
end
