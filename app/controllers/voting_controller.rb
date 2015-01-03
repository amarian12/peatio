require 'json'
class VotingController < ApplicationController
  layout 'voting'
  
  def index
    vres = File.read('public/voting.json')
    vdata = JSON.parse(vres)
    @vhash = 10
    @vhashppc = vdata['PPC']
  end
  
  #def vhash
  #  JSON.parse(vres)
  #end
end
