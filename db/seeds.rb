
Statement.delete_all
Version.delete_all

Timecop.freeze("01.01.2013")
s = Statement.create!(name: "Foo", price: 20_000, planned_date: "10.02.2013")

Timecop.freeze("10.01.2013")
s.update_attributes(price: 30_000)

Timecop.freeze("20.01.2013")
s.update_attributes(planned_date: "20.02.2013")

Timecop.freeze("30.01.2013")
s.destroy

Timecop.return

Statement.create! name: "Bar", price: 15_000, planned_date: "10.10.2013"
