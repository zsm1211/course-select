# CourseSelect [![Build Status](https://travis-ci.org/PENGZhaoqing/CourseSelect.svg?branch=master)](https://travis-ci.org/PENGZhaoqing/CourseSelect)
 本项目依托于https://github.com/PENGZhaoqing/CourseSelect 进行开发

 Heroku演示地址（https://wqscourseselect.herokuapp.com/ ）

### 目前功能：

**原系统功能**
* 多角色登陆（学生，老师，管理员）
* 学生动态选课，退课
* 老师动态增加，删除课程
* 老师对课程下的学生添加、修改成绩
* 权限控制：老师和学生只能看到自己相关课程信息
* 管理员后台

**本系统新添功能**

_管理员功能_
* 管理员发布公告

_教师功能_
* 新闻主页
* 查看公告列表
* 公告详情页
* 图形化显示选课学生信息
* 查看学生评价
* 教师按学期开课
* 增加选课的开放、关闭功能
* Excel格式的数据导入、导出

_学生功能_
* 新闻主页
* 查看公告列表
* 通知详情页
* 处理选课冲突
* 站内查找检索 （课程按分类查找，过滤等）
* 统计选课学分，学时
* 个人课表
* 选课旁听功能
* 课程评估
* 增加选课的开放、关闭功能
* 绑定用户邮箱
* 发送通知申请加课
* 选课系统与评教系统关联

### 截图

<img src="/lib/screenshot11.png" width="700">  

<img src="/lib/screenshot12.png" width="700">

<img src="/lib/screenshot13.png" width="700">   

<img src="/lib/screenshot14.png" width="700">

<img src="/lib/screenshot5.png" width="700">

### 操作指南：

#### 学生登录：

学生可进入选课系统进行选课，选课系统提供课程检索以及课程多样化演示，冲突提醒等众多功能。

<img src="/lib/filehelper_1483841921595_68.png" width="300"> 

课程检索中的默认筛选功能折叠，将其打开即可进行课程详细类目的搜索。

<img src="/lib/filehelper_1483842049835_83.png" width="300"> 

课程搜索可以对课程编号，课程名称，考试类型，课程属性等进行搜索。

检索结果中显示检索结果数量提示。

<img src="/lib/filehelper_1483842174226_99.png" width="100"> 

检索结果中可对相关类别进行智能化排序（当前按照课时学分进行排序，还可按照其他的类别进行相关排序）

<img src="/lib/filehelper_1483843526524_54.png" width="500"> 

检索结果中课程多样化展示。

<img src="/lib/filehelper_1483842497663_57.png" width="700"> 

- 当课程限选未满或者当前课程与已选课程（包括旁听）没有冲突时，课程可操作区为：加入课程与旁听
- 当课程限选已满时，学生仅可对该课程提出申请增加选课人数
- 用户旁听某课程时，该课程仅会记入到当前用户的属性中，某课程的老师无法查看该旁听用户相关信息并且某课程的成绩信息中也无该用户
- 当课程与已选课程（包括旁听）有冲突时，一键选课可将学生冲突课程删除并选择上当前选择课程

<img src="/lib/filehelper_1483842787731_85.png" width="400"> 

<img src="/lib/filehelper_1483842860789_32.png" width="400"> 

- <img src="/lib/filehelper_1483842951261_78.png" width="400"> 

了解本课程更多详细信息课查看本课程相关信息：

<img src="/lib/filehelper_1483843119915_20.png" width="400"> 

- 其中课程评分为评教系统中回传过来的值，当且仅当有学生对该课程进行评教并且老师查看了相关评教结果后才可显示为具体数值，否则即为暂无课程评分。
- 还有点击当前课表查看用户课表
- 倘若该课程为冲突课程的话，了解本课程更多详细信息即为查看冲突

<img src="/lib/filehelper_1483843393464_54.png" width="400"> 

<img src="/lib/filehelper_1483843440837_7.png" width="400"> 

在进入已选界面时，用户查看已选课程，显示用户旁听以及正选的结果，并对相关的课程可以对老师进行提问

<img src="/lib/filehelper_1483843697792_11.png" width="400"> 

<img src="/lib/filehelper_1483843738581_48.png" width="400"> 

点击查看课表功能

- 可以查看当前的所修总课程学分，当前的所修总课程学时（ 不含旁听）
- 将鼠标悬浮在相关课程上时可以查看当前课程的相关周次以及教学楼位置
- 旁听课程与正选课程用不同颜色标准，并对旁听课程添加旁听标签进行智能化显示

<img src="/lib/filehelper_1483843791971_64.png" width="500"> 

评估系统

- 学生可以对已选的相关课程进行评估
- 评估一共分为19项，每一项都可可选，用户可仅针对自己熟悉的项进行评分
- 学生也可对旁听课程进行相应的评价

<img src="/lib/filehelper_1483844194590_55.png" width="700">

<img src="/lib/filehelper_1483844240650_75.png" width="700">

#### 老师登录：

课程管理系统：

- 老师可以分学期查看相关学期课程
- 可以对相关课程进行编辑，查看选课情况，对课程进行删除以及关闭功能

<img src="/lib/7368649697@chatroom_1483844483359_26.png" width="400">

针对选课情况还可进行图表化展示

<img src="/lib/7368649697@chatroom_1483844586211_45.png" width="400">

<img src="/lib/7368649697@chatroom_1483844666280_46.png" width="400">

成绩管理系统:

- 用户可以对成绩进行单个的编辑以及提交
- 用户还可以通过导出相关选课学生信息，进行批量化编辑，然后通过浏览上传批量导入学生成绩

<img src="/lib/7368649697@chatroom_1483844829681_2.png" width="400">

评估系统：

- 用户可以分学期查看相关课程的评估结果
- 仅当老师查看完评估结果之后（且有学生对该课程进行评估），相关课程的选课系统中的课程评分才会进行改变（选课系统中的课程评分又暂无评分改为具体得分的充分必要条件为：用学生对该课程进行评估并且老师查看了相关的评估结果）（旁听用户也可对课程进行评估）
- 评估结果中的每一项都有其相关均值得分以及其相关评估人数，并且在最后一项中给出了所有项的均值，方便用户查看该课程的整体评价

<img src="/lib/filehelper_1483845436926_79.png" width="700">

#### 管理员登录：

- 管理员可以对评价，成绩，课程，学期，用户以及通知进行管理
- 管理员发布相关通知信息
- 通知信息在网站首页进行显示（登录或者不登录都可以）

<img src="/lib/filehelper_1483845776295_79.png" width="400">

<img src="/lib/filehelper_1483845827837_82.png" width="400">



## 说明

目前使用的库和数据库：

* 使用[Bootstrap](http://getbootstrap.com/)作为前端库
* 使用[Rails_admin Gem](https://github.com/sferik/rails_admin)作为后台管理
* 使用[Postgresql](http://postgresapp.com/)作为数据库

使用前需要安装Bundler，Gem，Ruby，Rails等依赖环境。

请根据本地系统下载安装[postgresql](https://devcenter.heroku.com/articles/heroku-postgresql#local-setup)数据库，并运行`psql -h localhost`检查安装情况。


## 安装
本组成员所整理的本地环境安装教程

Ubuntu下安装Ruby on Rails环境教程及问题汇总[请戳这里](http://www.jinqiao.name/2016/12/28/no-rakefile-found-looking-for-rakefile-rakefile-rakefile-rb-rakefile-rb/)

Win10上安装Ruby on Rails全教程[请戳这里](http://www.jinqiao.name/2016/12/29/windows%E4%B8%8A%E5%AE%89%E8%A3%85ruby-on-rails/)

在终端中执行以下代码

```
$ git clone https://github.com/RongtongJin/CourseSelect
$ cd CourseSelect
$ bundle install
$ rake db:migrate
$ rake db:seed
$ rails s 
```

在浏览器中输入`localhost:3000`访问主页

##使用

1.学生登陆：

账号：`student1@test.com`

密码：`password`

2.老师登陆：

账号：`teacher1@test.com`

密码：`password`


3.管理员登陆：

账号：`admin@test.com`

密码：`password`

账号中数字都可以替换成2,3...等等


## Heroku云部署

项目可直接在Heroku上免费部署

1.fork此项目到自己Github账号下

2.创建Heroku账号以及Heroku app

3.将Heroku app与自己Github下的fork的项目进行连接

4.下载配置[Heroku CLI](https://devcenter.heroku.com/articles/heroku-command-line)命令行工具

5.运行`heroku login`在终端登陆，检查与heroku app的远程连接情况`git config --list | grep heroku`，若未检查到相应的app，请看[这里](http://stackoverflow.com/questions/5129598/how-to-link-a-folder-with-an-existing-heroku-app)

6.运行部署，详情[请戳这里](https://devcenter.heroku.com/articles/getting-started-with-rails4#rails-asset-pipeline)

```
git push heroku master
heroku run rake db:migrate
heroku run rake db:seed
```




## 测试

本项目包含了部分的测试（integration/fixture/model test），测试文件位于/test目录下。运行测试：

```
$ rake test
Run options: --seed 15794

# Running:
.........

Finished in 1.202169s, 7.4865 runs/s, 16.6366 assertions/s.

9 runs, 20 assertions, 0 failures, 0 errors, 0 skips
```


## How to Contribute

先fork此项目，在分支修改后，pull request到主分支

提问请到issues里创建，欢迎contributor！

如果觉得好，给项目点颗星吧～

## 功能更新

2016/12/20   增加图表展示功能

2016/12/21   课程多样化显示

2016/12/24   增加课程公告

2016/12/26   增加课程检索功能

2016/12/26   更新了主页

2016/12/28   智能提醒课程冲突

2016/12/28   增加学期功能

2016/12/29   增加旁听

2016/12/31   增加选课人数动态更新

2016/12/31   增加申请加课功能

2017/01/01   增加个人课表功能

2017/01/01   增加课程或学生信息导入导出

2017/01/02   评教功能 

2017/01/03   更新旁听及学分统计功能

2017/01/03   更新系统说明，加入站长工具

2017/01/05   更新评教系统

2017/01/07   评教系统与选课系统关联
