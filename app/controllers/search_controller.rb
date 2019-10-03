# frozen_string_literal: true

class SearchController < ApplicationController
  def show
    @searcher = User.where(lastname: params[:search].capitalize).or(User.where(firstname: params[:search].capitalize))
  end
end
