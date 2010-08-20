# encoding: utf-8
#首页顶端导航
class Nav
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Sortable
  sortable_belong_to :page

  field :name
  field :url
end