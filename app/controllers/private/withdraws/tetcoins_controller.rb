module Private::Withdraws
  class TetcoinsController < ::Private::Withdraws::BaseController
    # Disable Require Identity Verification for Czarcoin
    # before_filter :auth_verified!
    include ::Withdraws::CtrlCoinable
  end
end
