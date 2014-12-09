module Private
  class AssetsController < BaseController
    skip_before_action :auth_member!, only: [:index]

    def index
      #@cny_assets  = Currency.assets('cny')
      @btc_proof   = Proof.current :btc
      @czr_proof   = Proof.current :czr
      @tet_proof   = Proof.current :tet
      @ltc_proof   = Proof.current :ltc
      @rdd_proof   = Proof.current :rdd
      @wdc_proof   = Proof.current :wdc
      #@cny_proof   = Proof.current :cny

      if current_user
        @btc_account = current_user.accounts.with_currency(:btc).first
        @czr_account = current_user.accounts.with_currency(:czr).first
        @tet_account = current_user.accounts.with_currency(:tet).first
        @ltc_account = current_user.accounts.with_currency(:ltc).first
        @rdd_account = current_user.accounts.with_currency(:rdd).first
        @wdc_account = current_user.accounts.with_currency(:wdc).first
        #@cny_account = current_user.accounts.with_currency(:cny).first
      end
    end

    def partial_tree
      account    = current_user.accounts.with_currency(params[:id]).first
      @timestamp = Proof.with_currency(params[:id]).last.timestamp
      @json      = account.partial_tree.to_json.html_safe
      respond_to do |format|
        format.js
      end
    end

  end
end
