module Admin
  module Withdraws
    class TetcoinsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Tetcoin'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_tetcoins = @tetcoins.with_aasm_state(:accepted).order("id DESC")
        @all_tetcoins = @tetcoins.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @tetcoin.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @tetcoin.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
