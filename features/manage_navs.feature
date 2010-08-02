# language: zh-CN
功能: 管理网店布局
  为了调整网店布局
  作为用户
  可以直接在网页上修改网店导航信息
  
  @focus
  @javascript
  场景大纲: 添加导航
    假如系统有以下导航:
      |会员中心|订单查询|网站导航|帮助|
    而且我已经以用户名saberma登录
    当我访问网店布局管理页面
    * 把鼠标移到会员中心
    * 页面会显示操作表单
    假如我点击<按钮>
    * 页面会显示操作表单
    当我输入名称为客户中心
    * 输入链接地址为/customer
    而且点击保存
    * 应该能看到客户中心
    而且客户中心显示在会员中心之<位置>
  例子:
    |      按钮    | 位置 |
    | <<在其前添加 |  前  |
    | 在其后添加>> |  后  |
  
  @javascript
  场景: 修改导航
    假如系统有以下导航:
      |会员中心|订单查询|网站导航|帮助|
    而且我已经以用户名saberma登录
    当我访问网店布局管理页面
    * 把鼠标移到会员中心
    那么页面会显示操作表单
    当我输入名称为客户中心
    * 输入链接地址为/customer
    而且点击保存
    * 应该能看到客户中心
  
  @javascript
  场景: 删除导航
    假如系统有以下导航:
      |会员中心|订单查询|网站导航|帮助|
    而且我已经以用户名saberma登录
    当我访问网店布局管理页面
    * 把鼠标移到会员中心
    那么页面会显示操作表单
    当我点击删除
    那么应该看不到会员中心
  
  @javascript
  场景: 调整顺序
    假如系统有以下导航:
      |会员中心|订单查询|网站导航|帮助|
    当我访问网店布局管理页面
    而且将会员中心移至网站导航前面
    那么会员中心显示在网站导航之前
