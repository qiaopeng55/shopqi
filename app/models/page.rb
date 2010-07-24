# encoding: utf-8
require 'carrierwave/orm/mongoid'

class Page
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name
  validates_uniqueness_of :name

  embeds_one :logo
  embeds_many :navs
  embeds_many :menus

  before_create :create_logo

  #必需有Logo
  def create_logo
    self.logo = Logo.new
  end

  def sorted_menus
    menus.sort {|x, y| x.pos <=> y.pos}
  end

  def sorted_navs
    navs.sort {|x, y| x.pos <=> y.pos}
  end

  def self.mbaobao
    where(:name => :mbaobao).first
  end

  #网店菜单背景图路径
  def menu_sprite_path
    "#{Rails.root}/public" + menu_sprite_url
  end

  def menu_sprite_url
    "/images/menu/#{id}.png"
  end
end

#首页Logo
class Logo
  include Mongoid::Document
  embedded_in :page, :inverse_of => :logo

  field :url, :default => '/images/logo/default.gif'

  #在线文字合成ID
  field :image_id
  #mount_uploader :image, ImageUploader
end
