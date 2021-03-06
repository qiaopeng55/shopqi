# encoding: utf-8
require 'spec_helper'

describe TagFilter do

  let(:shop) { Factory(:user).shop }

  let(:link_list) { Factory :link_list, shop: shop }

  it 'should get stylesheet_tag' do
    variant = "{{ 'textile.css' | stylesheet_tag }}"
    Liquid::Template.parse(variant).render.should eql "<link href='textile.css' rel='stylesheet' type='text/css' media='all' />"
  end

  it 'should get script_tag' do
    variant = "{{ 'jquery.js' | script_tag }}"
    Liquid::Template.parse(variant).render.should eql "<script src='jquery.js' type='text/javascript'></script>"
  end

  it 'should get img_tag' do
    variant = "{{ 'avatar.jpg' | img_tag }}"
    Liquid::Template.parse(variant).render.should eql "<img src='avatar.jpg' alt='' />"
  end

  it 'should get link_to' do
    link = LinkDrop.new link_list.links.build title: '查询', link_type: 'search'
    variant = "{{ link.title | escape | link_to: link.url }}"
    Liquid::Template.parse(variant).render('link' => link).should eql "<a href='/search'>查询</a>"
  end

end
