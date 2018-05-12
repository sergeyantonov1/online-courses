module Managers
  class MessagesController < ApplicationController
    expose :conversation, -> { current_manager.mailbox.conversations.find(params[:conversation_id]) }

    def create
      receipt = current_manager.reply_to_conversation(conversation, params[:body])
      redirect_to managers_conversation_path(receipt.conversation)
    end
  end
end
