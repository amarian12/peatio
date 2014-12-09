module Private
  module Deposits
    class WorldcoinsController < ::Private::Deposits::BaseController
      include ::Deposits::CtrlCoinable
    end
  end
end
