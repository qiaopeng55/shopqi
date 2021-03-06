#encoding: utf-8
require 'spec_helper'

describe ProductsController do
  include Devise::TestHelpers
  
  let(:iphone4) {Factory.build(:iphone4)}

  before :each do 
    sign_in(Factory(:user_liwh))
  end

  context '#create' do
    it "should create new product " do 
      attrs = iphone4.attributes
      attrs.delete('shop_id')
      post :create ,:product => attrs
      response.should be_redirect
      flash[:notice].should == "新增商品成功!"
    end
  end

end
