module Admin
  module Deposits
    class WorldcoinsController < ::Admin::Deposits::BaseController
      load_and_authorize_resource :class => '::Deposits::Worldcoin'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @worldcoins = @worldcoins.includes(:member).
          where('created_at > ?', start_at).
          order('id DESC')
      end

      def update
        @worldcoin.accept! if @worldcoin.may_accept?
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
