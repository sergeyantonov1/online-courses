module Managers
  class ConversationsController < ApplicationController
    expose :conversation, -> { current_manager.mailbox.conversations.find(params[:id]) }
    expose :conversations, -> { current_manager.mailbox.conversations }
    expose :recipients, -> { User.all + Manager.all + Teacher.all - [current_manager] }
    expose :user_recipient, -> { User.find(params[:profile_id]) }
    expose :teacher_recipient, -> { Teacher.find(params[:profile_id]) }
    expose :manager_recipient, -> { Manager.find(params[:profile_id]) }
    expose :manager, -> { current_manager }

    def create
      find_recipient if @recipient.nil?
      receipt = current_manager.send_message(@recipient, params[:body], params[:subject])
      redirect_to managers_conversation_path(receipt.conversation)
    end

    def new
      find_recipient if params[:profile_role]
    end

    private

    def find_recipient
      @recipient = case params[:profile_role]
                   when "user"
                     user_recipient
                   when "teacher"
                     teacher_recipient
                   when "manager"
                     manager_recipient
      end
    end
  end
end
