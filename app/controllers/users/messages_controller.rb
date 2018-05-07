module Users
  class MessagesController < ApplicationController
    expose :conversation, -> { current_user.mailbox.conversations.find(params[:conversation_id]) }

    def create
      receipt = current_user.reply_to_conversation(conversation, params[:body])
      redirect_to users_conversation_path(receipt.conversation)
    end
  end
end
