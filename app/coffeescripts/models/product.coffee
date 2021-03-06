# 自定义集合中会用到
Product = Backbone.Model.extend
  name: 'product'

  initialize: (args) ->
    #backbone.rails的initialize被覆盖，导致无法获取id，需要手动调用
    this.maybeUnwrap args
    this.with_options()
    # 保存商品后要重置选项集合
    this.bind 'change:options', this.with_options

  #重载，支持子实体
  toJSON : ->
    attrs = this.wrappedAttributes()
    #手动调用_clone，因为toJSON会加wraper
    if @options?
      options_attrs = @options.models.map (model) ->
        _.clone model.attributes
      attrs['product']['options_attributes'] = options_attrs
    attrs

  #设置关联
  with_options: ->
    if @id? and @attributes.options
      #清除原有选项
      @last_options = @options
      if @last_options
        _(@last_options.models).each (model) ->
          model.view.remove()
      #@see http://documentcloud.github.com/backbone/#FAQ-nested
      @options = new App.Collections.ProductOptions
      @options.refresh @attributes.options
      this.unset 'options', silent: true
      #找出已删除的选项，用于更新款式选项值
      if @last_options
        options_size = @last_options.length
        removed_options = _(@last_options.models).select (model) ->
          model.attributes._destroy is '1'
        _(removed_options).each (option) ->
          position = option.attributes.position
          _(App.product_variants.models).each (variant) ->
            _(_.range(position, options_size)).each (i) ->
              attr = {}
              attr["option#{i}"] = variant.get("option#{i+1}")
              variant.set attr, silent: true
    this

  addedTo: (collection) ->
    self = this
    collection.detect (model) ->
      model.attributes.product_id == self.id

  markFeaturedImage = ->
    $('.featured').remove()
    $('ul li:first-child').append("<div class='featured'></div>")

# 商品选项
ProductOption = Backbone.Model.extend
  name: 'product_option'

# 商品款式
ProductVariant = Backbone.Model.extend
  name: 'product_variant'

  validate: (attrs) ->
    return unless attrs.option1? #没有修改option值则不校验
    self = this
    i = 1
    error = {}
    # 必填
    _(App.product.options.models).each (model) ->
      unless attrs["option#{i++}"]
        error["基本选项#{model.attributes.name}"] = "不能为空!"
    # 唯一性
    exists = App.product_variants.find (variant) ->
      result = variant.id isnt self.id
      i = 1
      _(App.product.options.models).each ->
        attr = "option#{i++}"
        result = result and variant.attributes[attr] is attrs[attr]
      result
    if exists then error["基本选项"] = "已经存在!"
    if _(error).size() is 0
      return
    else
      error
