class NotesController < ApplicationController
  
  before_filter :authenticate_user!, except: [:index]

  def index
    @notes = Note.all
    #@notes = current_user.notes
  end

  def new
    #@note = Note.new
    @note = current_user.notes.new
  end

  def create
    #@note = Note.new(note_params)
    @note = current_user.notes.new(note_params)

    if @note.save
      redirect_to root_path, notice: "Nota Guardada!"
    else
      render :new
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def destroy
    #@note = Note.find(params[:id])
    @note = current_user.notes.find(params[:id])
    @note.destroy

    redirect_to root_path, notice: "Nota Eliminada!"
  end

  private
  def note_params
    params.require(:note).permit(:title, :body)
  end
end
