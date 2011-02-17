# language: zh-CN
功能: 管理用户
  为了使用平台
  作为访问者
  可以注册
  
  @focus
  场景: 用户注册
    假如我访问首页
    * 点击注册试用
    当我输入以下内容:
      |用户名  |mahb45@gmail.com |
      |密码    |666666           |
      |确认密码|666666           |
      |昵称    |saberma          |
    而且点击现在注册
    那么我应该能看到工作平台
    那么我应该能看到请输入网店基本配置信息，以后如需修改请点击右上角的[设置]
  
  场景: 用户登录
    假如我已经以用户名saberma@shopqi.com成功注册
    而且我访问首页
    * 点击登录管理您的网店
    当我输入以下内容:
      |用户名  |saberma@shopqi.com |
      |密码    |666666             |
    而且点击登录
    那么我应该能看到工作平台
