class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    params = note_params
    params[:title] = parse_title(params[:text]) if params[:title].blank?
    @note = Note.new(params)
    if @note.save
      redirect_to "/"
    else
      render 'new'
    end
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
