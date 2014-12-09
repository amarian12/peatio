module Admin
  module Withdraws
    class ReddcoinsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Reddcoin'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_reddcoins = @reddcoins.with_aasm_state(:accepted).order("id DESC")
        @all_reddcoins = @reddcoins.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @reddcoin.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @reddcoin.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
