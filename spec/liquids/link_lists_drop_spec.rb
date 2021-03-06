#encoding: utf-8
require 'spec_helper'

describe LinkListsDrop do

  let(:shop) { Factory(:user).shop }

  describe LinkDrop do

    it 'should get the title' do
      variant = "{% for link in linklists.main-menu.links %}<span>{{ link.title }}</span>{% endfor %}"
      result = "<span>首页</span><span>商品列表</span><span>关于我们</span>"
      Liquid::Template.parse(variant).render('linklists' => LinkListsDrop.new(shop)).should eql result
    end

  end

end
