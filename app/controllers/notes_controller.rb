class NotesController < ApplicationController
 
 def index
    @Notes = Note.where(user_id: params[:uid]).all
  end

end