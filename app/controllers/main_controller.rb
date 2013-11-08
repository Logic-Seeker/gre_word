class MainController < ApplicationController
  def index
  end

  def new
    @word_list = WordList.new
  end

  def create
    @wordlist=WordList.new(wordlist_params)
    @wordlist.save
  end

  def delete
  end

  def edit
  end
  def activate
    @timer = 10
    while @timer>1
    test
    sleep(60.minutes)
    end
    redirect_to :back
  end
  def test
     @word=WordList.find :first, :offset => rand(WordList.count)
     @token = Notification.all
     notification = Noti::Notification.new
     notification.title = @word.word+':'+@word.meaning
     notification.text = @word.sentence
      @token.each do |t| 
     notification.deliver_to(t.access_token)
      end
  end

  private
  def wordlist_params
    params.require(:word_list).permit(:word,:meaning,:sentence)
  end
end
