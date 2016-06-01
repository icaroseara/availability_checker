require "spec_helper"

describe Availability do
  before do
    db[:availabilities].insert(
      year: 2015, month: 1,
      #      1234567890123456789012345678901
      days: "1111111000000000000000000000000")
    db[:availabilities].insert(
      year: 2015, month: 6,
      #      123456789012345678901234567890
      days: "000000000000000000001111111100")
    db[:availabilities].insert(
      year: 2015, month: 7,
      #      1234567890123456789012345678901
      days: "0000111111100000100000000000000")
    db[:availabilities].insert(
      year: 2015, month: 12,
      #      1234567890123456789012345678901
      days: "0000000000000000000111100000000")
  end

  subject(:availability) { described_class.new(db) }

  describe "#available_between?" do
    it { is_expected.to be_available_between(
                          Date.new(2015, 6, 29),
                          Date.new(2015, 7, 5)) }

    it { is_expected.to_not be_available_between(
                              Date.new(2015, 6, 28),
                              Date.new(2015, 7, 5)) }

    it { is_expected.to_not be_available_between(
                              Date.new(2015, 6, 29),
                              Date.new(2015, 7, 6)) }

    it { is_expected.to_not be_available_between(
                              Date.new(2015, 7, 15),
                              Date.new(2015, 7, 19)) }

    it { is_expected.to be_available_between(
                          Date.new(2015, 12, 24),
                          Date.new(2016, 1, 2)) }

    it { is_expected.to_not be_available_between(
                          Date.new(2015, 12, 22),
                          Date.new(2016, 1, 2)) }
  end
end
