module Api
  module V1
    class MessagesController < ApplicationController
      def index
        top_communication_message = Message.where(members_id: params[:members_id]).order(heart_count: "DESC").first
        top_implementation_message = Message.where(members_id: params[:members_id]).order(rocket_count: "DESC").first
        top_communication_message = Message.where(members_id: params[:members_id]).order(hooray_count: "DESC").first
        top_messages = {top_communication_message: top_communication_message, top_implementation_message: top_implementation_message, top_communication_message: top_communication_message}
        render json: top_messages
      end
    end
  end
end
