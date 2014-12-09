module Private::Withdraws
  class WorldcoinsController < ::Private::Withdraws::BaseController
    include ::Withdraws::CtrlCoinable
  end
end
