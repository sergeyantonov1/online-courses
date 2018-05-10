module Teachers
  class MessagesController < ApplicationController
    expose :conversation, -> { current_teacher.mailbox.conversations.find(params[:conversation_id]) }

    def create
      receipt = current_teacher.reply_to_conversation(conversation, params[:body])
      redirect_to teachers_conversation_path(receipt.conversation)
    end
  end
end
