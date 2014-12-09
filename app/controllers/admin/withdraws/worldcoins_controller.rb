module Admin
  module Withdraws
    class WorldcoinsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Worldcoin'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_worldcoins = @worldcoins.with_aasm_state(:accepted).order("id DESC")
        @all_worldcoins = @worldcoins.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @worldcoin.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @worldcoin.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
