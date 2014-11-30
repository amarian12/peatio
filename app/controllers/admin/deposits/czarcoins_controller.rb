module Admin
  module Deposits
    class CzarcoinsController < ::Admin::Deposits::BaseController
      load_and_authorize_resource :class => '::Deposits::Czarcoin'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @czarcoins = @czarcoins.includes(:member).
          where('created_at > ?', start_at).
          order('id DESC')
      end

      def update
        @czarcoin.accept! if @czarcoin.may_accept?
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
