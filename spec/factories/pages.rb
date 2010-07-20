# encoding:utf-8
Factory.define 'page_mbaobao', :class => :page do |p|
  p.name :mbaobao

  #p.logo { |page| Logo.new }

  p.navs do |page| 
    [
      Factory.build(:nav, :name => '会员中心'),
      Factory.build(:nav, :name => '订单查询'),
      Factory.build(:nav, :name => '网站导航'),
      Factory.build(:nav, :name => '帮助')
    ]
  end
end
