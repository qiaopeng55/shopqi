# encoding: utf-8
require 'spec_helper'

describe MembersController do
  include Devise::TestHelpers

  before :each do
    with_resque{ @saberma = Factory(:user_saberma) }
    @store = @saberma.store
    request.host = "#{@saberma.store.subdomain}.shopqi.com"

    @member = @store.members.create(Factory.attributes_for(:member_ben))
    sign_in @member
  end

  it 'update members addresses' do
    address = @member.addresses.create(Factory.attributes_for(:address))
    @controller.current_member.addresses.size.should eql 1
  end
end
