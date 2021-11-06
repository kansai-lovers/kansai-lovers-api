module Api
  module V1
    class MembersController < ApplicationController
      def index
        render json: Member.all
      end

      def show
        member = Member.find_by(id: params[:members_id])
        render json: member
      end

      def calcurate_score
        member = Member.find_by(id: params[:members_id])
        skillScore = {"design": member.dev_design(),"implementation": member.dev_implementation(), "communication": member.dev_communication()}
        render json: skillScore
      end
    end
  end
end
