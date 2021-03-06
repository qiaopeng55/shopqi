class BlogsDrop < Liquid::Drop

  def initialize(shop)
    @shop = shop
  end

  def before_method(handle) #相当于method_missing
    BlogDrop.new @shop.blogs.where(handle: handle).first
  end

end

class BlogDrop < Liquid::Drop

  def initialize(blog)
    @blog = blog
  end

  def title
    @blog.title
  end

  def articles
    @blog.articles.map do |article|
      ArticleDrop.new article
    end
  end

end
