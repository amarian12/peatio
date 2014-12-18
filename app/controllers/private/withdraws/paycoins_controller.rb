module Private::Withdraws
  class PaycoinsController < ::Private::Withdraws::BaseController
    include ::Withdraws::CtrlCoinable
  end
end
