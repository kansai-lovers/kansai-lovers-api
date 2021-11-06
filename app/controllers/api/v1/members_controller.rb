module Api
  module V1
    class MembersController < ApplicationController
      def index
        @member = Member.find_by(id: params[:members_id])
        render json: @member
      end
    end
  end
end
