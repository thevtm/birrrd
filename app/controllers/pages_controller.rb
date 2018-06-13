class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @birds = Bird.all.limit(8)
  end
end
