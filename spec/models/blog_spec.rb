#encoding: utf-8
require 'spec_helper'

describe Blog do

  let(:shop) { Factory(:user).shop }

  context '#create' do

    context '(without handle)' do

      it 'should save handle' do
        blog = shop.blogs.create title: '最新发布'
        blog.handle.should eql 'zui-xin-fa-bu'
      end
    end

    context '(with handle)' do

      it 'should save handle' do
        blog = shop.pages.create title: '最新发布', handle: 'latest'
        blog.handle.should eql 'latest'
      end

    end

  end

end
