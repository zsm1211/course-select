#------------------------首页-----------------------#


When(/^进入首页$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^查看新闻，快捷方式$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end


#----------------------------课程检索---------------------------#


Given(/^选课页面$/) do
  # Write code here that turns the phrase above into concrete actions
end

When(/^处于选课时期$/) do
  # Write code here that turns the phrase above into concrete actions
end

When(/^选择各检索条件$/) do |arg1|
  # Write code here that turns the phrase above into concrete actions
end

Then(/^显示满足检索条件的所有课程$/) do |arg1|
  # Write code here that turns the phrase above into concrete actions
end

When(/^选择以学生分类$/) do
  # Write code here that turns the phrase above into concrete actions
end

#-----------------------------个人课表----------------------------#

Given(/^尚未选课$/) do
    # Write code here that turns the phrase above into concrete actions
end

Given(/^学生身份$/) do
    # Write code here that turns the phrase above into concrete actions
end

Given(/^选课界面中$/) do
    # Write code here that turns the phrase above into concrete actions
end

When(/^添加一门正式课程"([^"]*)"$/) do |arg1|
    # Write code here that turns the phrase above into concrete actions
end

Then(/^课表中显示正式课程，学分改变$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^尚未选课$/) do
  # Write code here that turns the phrase above into concrete actions
end

Given(/^学生身份$/) do
  # Write code here that turns the phrase above into concrete actions
end

Given(/^选课界面中$/) do
  # Write code here that turns the phrase above into concrete actions
end

When(/^添加一门旁听课程"([^"]*)"$/) do |arg1|
  # Write code here that turns the phrase above into concrete actions
end

Then(/^显示课表$/) do
#  pending # Write code here that turns the phrase above into concrete actions
end


#-----------------------------申请加课----------------------------#

Given(/^学生"([^"]*)"参加选课$/) do |arg1|
    # Write code here that turns the phrase above into concrete actions
end

When(/^学生选择申请加课$/) do |arg1, arg2, arg3|
    # Write code here that turns the phrase above into concrete actions
end

Then(/^发送邮件给管理员"([^"]*)"$/) do |arg1|
    # Write code here that turns the phrase above into concrete actions
end

#-----------------------------成绩页面----------------------------#


Given(/^在我的课程界面$/) do
    # Write code here that turns the phrase above into concrete actions
end

When(/^点击所有成绩页面$/) do
    # Write code here that turns the phrase above into concrete actions
end

Then(/^显示成绩页面$/) do
    # Write code here that turns the phrase above into concrete actions
end


