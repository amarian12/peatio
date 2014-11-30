module Admin
  module Deposits
    class TetcoinsController < ::Admin::Deposits::BaseController
      load_and_authorize_resource :class => '::Deposits::Tetcoin'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @tetcoins = @tetcoins.includes(:member).
          where('created_at > ?', start_at).
          order('id DESC')
      end

      def update
        @tetcoin.accept! if @tetcoin.may_accept?
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
