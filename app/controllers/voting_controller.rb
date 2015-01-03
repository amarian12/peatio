require 'json'
class VotingController < ApplicationController
  layout 'voting'
  
  def index
    vres = File.read('public/voting.json')
    vdata = JSON.parse(vres)
    @vhash = vdata
  end
  
  #def vhash
  #  JSON.parse(vres)
  #end
end
