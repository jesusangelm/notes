module Api
  module V1
    class NotesController < BaseController

      before_action :set_note, only: [:show, :update, :destroy]

      def index
        @notes = Note.all
        render json: @notes, status: 200
      end

      def create
        @note = Note.new(note_params)

        if @note.save
          render nothing: true, status: 204
        else
          render json: @note.errors, status: 422
        end
      end

      def show
        render json: @note, status: 200
      end

      def update
        if @note.update(note_params)
          render json: @note, status: 200
        else
          render json: @note.errors, status: 422
        end
      end

      def destroy
        @note.destroy
        head 204
      end


      private

      def set_note
        @note = Note.find(params[:id])
      end

      def note_params
        params.require(:note).permit(:title, :body, :user_id)
      end

    end
  end
end
