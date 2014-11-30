module Admin
  module Withdraws
    class CzarcoinsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Czarcoin'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_czarcoins = @czarcoins.with_aasm_state(:accepted).order("id DESC")
        @all_czarcoins = @czarcoins.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @czarcoin.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @czarcoin.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
