class MessagesController < ApplicationController

  def index
    messages = Message.new
    @feed_items = messages.list
  end

end
