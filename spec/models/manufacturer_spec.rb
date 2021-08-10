require "rails_helper"

RSpec.describe Manufacturer, type: :model do
  describe "Direct Associations" do
    it { should have_many(:cars) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
