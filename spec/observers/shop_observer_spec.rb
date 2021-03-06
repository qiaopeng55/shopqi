require 'spec_helper'

describe ShopObserver do

  let(:shop) { Factory(:user).shop }

  context '#create' do

    it "should save link list" do
      expect do
        expect do
          shop
        end.to change(LinkList, :count).by(2)
      end.to change(Link, :count).by(5)
    end

    it "should save page" do
      expect do
        shop
      end.to change(Page, :count).by(2)
    end

    it "should save collection and products" do
      shop.custom_collections.where(handle: :frontpage).first.should_not be_nil
      shop.products.empty?.should be_false
    end

    it "should save latest-news blog" do
      shop.blogs.where(handle: 'latest-news').first.should_not be_nil
    end

  end
  
end
