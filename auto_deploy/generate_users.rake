# -*- coding: utf-8 -*-
namespace :generate do
  task :users_for_sast => :environment do
    admin = User.new :username => 'admin', :password => '311kexie311', :password_confirmation => '311kexie311'
    p 'admin', '311kexie311'
    %w(材料系 电机系 电子系 法学院 工程物理系 工业工程系 航天航空学院 化学工程系 化学系 环境系 机械系 计算机系 建筑学院 经管学院 精仪系 美术学院 汽车系 热能工程系 人文社科学院 软件学院 生命学院 水利系 土木工程系 物理系 新闻与传播学院 校团委（校科协） 医学院 自动化).each_with_index do |value, index|
      tmp_password = rand(36**8).to_s 36
      user = User.new :username => value, :password => tmp_password, :password_confirmation => tmp_password
      if user.save
        p user.username, user.password
      end
    end
  end
end	   
