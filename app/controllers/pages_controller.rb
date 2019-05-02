class PageController < ApplicationController
  def home
    render plain: "homepage"
  end
end