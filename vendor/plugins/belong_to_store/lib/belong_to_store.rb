# encoding: utf-8
# 所有实体都需要归属于store实体
module Mongoid
  module BelongToStore
    def self.included(base)
      base.send :extend, ClassMethods
    end

    module ClassMethods
      def belong_to_store
        referenced_in :store

        # 回调方法
        before_create :init_store

        define_method :init_store do
          self.store = User.current.store
          raise 'security prevent' if respond_to?(:parent) and parent and parent.store != self.store
        end
      end

      def store_has_many(*args)
        args.each do |children_name|
          references_many children_name, :dependent => :destroy
        end
      end
    end
  end
end