class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to root_path, notice: "Nota Guardada!"
    else
      render :new
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    redirect_to root_path, notice: "Nota Eliminada!"
  end

  private
  def note_params
    params.require(:note).permit(:title, :body)
  end
end
