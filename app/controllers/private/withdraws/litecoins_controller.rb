module Private::Withdraws
  class LitecoinsController < ::Private::Withdraws::BaseController
    include ::Withdraws::CtrlCoinable
  end
end
