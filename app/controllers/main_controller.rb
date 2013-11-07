class MainController < ApplicationController
  def index
  end

  def new
    @word_list = WordList.new
  end

  def create
    @times = 10
    @wordlist=WordList.new(wordlist_params)
    @wordlist.save
  end

  def delete
  end

  def edit
  end
  def activate
    test
    redirect_to :back
  end
  def test
     @word=WordList.find :first, :offset => rand(WordList.count)
     @token = Notification.first
     notification = Noti::Notification.new
     notification.title = @word.word+':'+@word.meaning
     notification.text = @word.meaning
     notification.deliver_to(@token.access_token)
  end

  private
  def wordlist_params
    params.require(:word_list).permit(:word,:meaning,:sentence)
  end
end
