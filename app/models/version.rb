# encoding: utf-8

class Version < ActiveRecord::Base
  attr_accessible :name, :planned_date, :price
  belongs_to :statement
end
