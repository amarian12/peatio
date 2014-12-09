module Private::Withdraws
  class ReddcoinsController < ::Private::Withdraws::BaseController
    include ::Withdraws::CtrlCoinable
  end
end
