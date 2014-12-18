module Admin
  module Withdraws
    class PaycoinsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Paycoin'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_paycoins = @paycoins.with_aasm_state(:accepted).order("id DESC")
        @all_paycoins = @paycoins.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @paycoin.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @paycoin.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
