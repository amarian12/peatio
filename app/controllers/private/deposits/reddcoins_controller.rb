module Private
  module Deposits
    class ReddcoinsController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
