#encoding: utf-8
Factory.define :order do |f|
  f.email "mahb45@gmail.com"
  f.billing_address_attributes name: '马海波', province: '广东', city: '深圳', district: '南山', address1: '311', phone: '13928452888'
  f.shipping_address_attributes name: '马海波', province: '广东', city: '深圳', district: '南山', address1: '311', phone: '13928452888'
end
