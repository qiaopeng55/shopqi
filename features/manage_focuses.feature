# language: zh-CN
功能: 管理聚焦广告容器
  为了管理广告
  作为用户
  可以添加、修改和删除聚焦广告

  @focus
  @javascript
  场景大纲: 添加聚焦广告容器
    假如我已经以用户名saberma登录
    当我访问网店布局管理页面
    而且把鼠标移进容器操作横栏
    当点击聚焦广告
    那么我应该能看到标题1
    当我把鼠标移到标题1
    * 页面会显示操作表单
    假如我点击<按钮>
    当我输入名称为夏季特惠
    * 输入链接地址为/summar
    而且点击保存
    那么应该能看到夏季特惠
    而且夏季特惠显示在标题1之<位置>
  例子:
    |      按钮    | 位置 |
    | <<在其前添加 |  前  |
    | 在其后添加>> |  后  |

  @javascript
  场景: 修改聚焦广告
    假如我已经以用户名saberma登录
    当我访问网店布局管理页面
    而且把鼠标移进容器操作横栏
    当点击聚焦广告
    当我把鼠标移到标题1
    * 页面会显示操作表单
    当我输入名称为夏季特惠
    * 输入链接地址为/summar
    而且点击保存
    那么应该能看到夏季特惠

  @javascript
  场景: 删除聚焦广告
    假如我已经以用户名saberma登录
    当我访问网店布局管理页面
    而且把鼠标移进容器操作横栏
    当点击聚焦广告
    当我把鼠标移到标题1
    * 页面会显示操作表单
    当我点击删除
    那么应该看不到标题1
