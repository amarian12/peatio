module Admin
  module Deposits
    class ReddcoinsController < ::Admin::Deposits::BaseController
      load_and_authorize_resource :class => '::Deposits::Reddcoin'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @reddcoins = @reddcoins.includes(:member).
          where('created_at > ?', start_at).
          order('id DESC')
      end

      def update
        @reddcoin.accept! if @reddcoin.may_accept?
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
