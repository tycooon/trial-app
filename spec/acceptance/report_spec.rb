# encoding: utf-8
require "spec_helper"

feature "Report" do
  def statement_for(date)
    Statement.for_date(date).last
  end

  before do
    Timecop.freeze("01.01.2013")
    s = Statement.create!(name: "Foo", price: 20_000, planned_date: "10.02.2013")

    Timecop.freeze("10.01.2013")
    s.update_attributes(price: 30_000)

    Timecop.freeze("20.01.2013 10:00")
    s.update_attributes(planned_date: "15.02.2013")

    Timecop.freeze("20.01.2013 12:00")
    s.update_attributes(planned_date: "20.02.2013")

    Timecop.freeze("30.01.2013")
    s.destroy

    Timecop.return
  end

  scenario "5 january" do
    s = statement_for("05.01.2013")
    s.price.should        == 20_000
    s.planned_date.should == Date.parse("10.02.2013")
  end

  scenario "15 january" do
    s = statement_for("15.01.2013")
    s.price.should        == 30_000
    s.planned_date.should == Date.parse("10.02.2013")
  end

  scenario "20 january 11:00" do
    s = statement_for("20.01.2013 11:00")
    s.price.should        == 30_000
    s.planned_date.should == Date.parse("15.02.2013")
  end

  scenario "25 january" do
    s = statement_for("25.01.2013")
    s.price.should        == 30_000
    s.planned_date.should == Date.parse("20.02.2013")
  end

  scenario "1 february" do
    s = statement_for("01.02.2013")
    s.should be_nil
  end

  scenario "30 december 2012" do
    s = statement_for("30.12.2012")
    s.should be_nil
  end
end
