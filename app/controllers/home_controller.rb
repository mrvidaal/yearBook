class HomeController < ApplicationController
  def index
  	@user = current_user
  	@visitas = Visita.select("user.nome_completo").joins(:user).distinct
  end
end
