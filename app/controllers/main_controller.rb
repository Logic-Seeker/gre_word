class MainController < ApplicationController
  def index
  end

  def new
    @word_list = WordList.new
  end

  def create
    @wordlist=WordList.new(wordlist_params)
    @wordlist.save
    redirect_to :back
  end

  def delete
  end

  def edit
  end

  private
  def wordlist_params
    params.require(:word_list).permit(:word,:meaning,:sentence)
  end
end
