
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

15.times do |i|
  Statement.create!(
    name: Faker::Lorem.word.capitalize,
    price: (rand 1..20) * 4000,
    planned_date: (rand 1..100).days.from_now
  )
end

