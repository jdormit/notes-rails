class NotesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = Note.new
  end

  def edit
    @note = Note.find(params[:id])
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

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      redirect_to notes_path
    else
      render 'edit'
    end
  end


  def destroy
    @note = Note.find(params[:id])
    @note.destroy

    redirect_to notes_path
  end

  private
    def parse_title(text)
      text.lines.first
    end

    def note_params
      if params.key?("note")
        params.require(:note).permit(:title, :text)
      else
        {:title => params.require(:title), :text => params.require(:text)}
      end
    end
end
