module Private::Withdraws
  class CzarcoinsController < ::Private::Withdraws::BaseController
    # Disable - Require Identity Verification for Czarcoin
    # before_filter :auth_verified!
    include ::Withdraws::CtrlCoinable
  end
end
