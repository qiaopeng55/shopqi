# encoding: utf-8
class HotsController < InheritedResources::Base
  layout nil
  actions :new, :create, :edit, :update, :destroy
  respond_to :js, :only => [:create, :update, :destroy]

  edit! do |format|
    format.html { render :action => "new" }
  end

  create! do |success, failure|
    # 初始化位置
    resource.parent.children.init_list!
    # reload重新加载pos属性值
    resource.reload.move(params[:direct].to_sym => end_of_association_chain.find(params[:neighbor])) unless params[:direct].blank?
  end

  def sort
    params[:hot].each_with_index do |id, index|
      Hot.find(id).update_attributes :pos => index
    end
  end

  protected
  def begin_of_association_chain
    current_user.store
  end
end