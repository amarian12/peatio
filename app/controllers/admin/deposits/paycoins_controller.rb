module Admin
  module Deposits
    class PaycoinsController < ::Admin::Deposits::BaseController
      load_and_authorize_resource :class => '::Deposits::Paycoin'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @paycoins = @paycoins.includes(:member).
          where('created_at > ?', start_at).
          order('id DESC')
      end

      def update
        @paycoin.accept! if @paycoin.may_accept?
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
