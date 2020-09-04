class MentionsController < ApplicationController
  # GET /mentions
  # GET /mentions.json
  def index
    @mentions = Mention.all
  end
end
