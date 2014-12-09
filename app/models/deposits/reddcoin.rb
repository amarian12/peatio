module Deposits
  class Reddcoin < ::Deposit
    include ::AasmAbsolutely
    include ::Deposits::Coinable

    validates_uniqueness_of :txout, scope: :txid
  end
end
