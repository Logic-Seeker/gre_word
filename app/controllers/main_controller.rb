class MainController < ApplicationController
  def index
  end

  def new
    @word_list = WordList.new
  end

  def create
    @times = 10
    while @times>1
      test
      @times = @times-1
    end
    @wordlist=WordList.new(wordlist_params)
    @wordlist.save
    redirect_to :back
  end

  def delete
  end

  def edit
  end
  def test
    binding.pry
  end

  private
  def wordlist_params
    params.require(:word_list).permit(:word,:meaning,:sentence)
  end
end
