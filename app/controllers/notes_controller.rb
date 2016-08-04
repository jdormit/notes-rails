class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    # empty function - /notes/new will render new.html.erb
  end

  def create
    params = note_params
    params[:title] = parse_title(params[:text]) if params[:title].blank?
    @note = Note.new(params)
    @note.save
    redirect_to "/"
  end

  def show
    @note = Note.find(params[:id])
  end

  private
    def parse_title(text)
      text.lines.first
    end

  private
    def note_params
      params.require(:note).permit(:title, :text)
    end
end
