# encoding: utf-8

require "spec_helper"

describe Statement do
  let(:statement) do
    Statement.create!(name: "Foo", planned_date: "21.12.2012", price: 10_000)
  end

  context "creating" do
    it "sets proper values to the record" do
      statement.name.should == "Foo"
      statement.planned_date.should == Date.parse("21.12.2012")
      statement.price.should == 10_000
    end

    it "creates with new version" do
      statement.versions.size.should == 1
    end

    it "sets proper values to the new version" do
      version = statement.versions.last

      version.name.should == "Foo"
      version.planned_date.should == Date.parse("21.12.2012")
      version.price.should == 10_000
    end
  end

  context "editing" do
    it "creates new version when changed" do
      statement.update_attributes(name: "Bar")
      statement.versions.size.should == 2
    end

    it "doesn't create new version when not changed" do
      statement.update_attributes(name: "Foo")
      statement.versions.size.should == 1
    end
  end

  context "destroying" do
    it "sets deleted_at when destroyed" do
      statement.destroy
      statement.reload.deleted_at.should_not be_nil
    end
  end
end
