require 'spec_helper'
require 'chip'

RSpec.describe "Chip" do
  context "has public attributes" do
    describe "#color" do
      it "returns a Symbol representing the color of the card" do
        chip = Chip.new(:black, 100)
        assert_equal :black, chip.color
      end
    end

    describe "#value" do
      it "returns a Fixnum representing the chip denomination" do
        chip = Chip.new(:green, 25)
        assert_equal Fixnum, chip.value.class
      end
    end
  end

  describe "#face_up?" do
    it "returns a boolean representing if the chip is face up or face down" do
      #hint: Think heads vs tails
      chip = Chip.new(:red, 5)
      assert_equal true, [true, false].include?(chip.face_up?)
    end
  end

  describe "#flip" do
    it "randomizes the position of the chip (face_up?)" do
      chip = Chip.new(:white, 1)
      status = []
      50.times do
        chip.flip
        status << chip.face_up?
      end
      assert_equal 2, status.uniq.length
    end
  end

  context "is comparable to other chips; compare chips by value" do

    black_chip = Chip.new(:black, 100)
    red_chip = Chip.new(:red, 5)

    describe "#>" do
      it "returns true if chip value is greater than other chip" do
        assert_equal true, black_chip > red_chip
      end

      it "returns false if chip value is not greater than other chip" do
        assert_equal false, red_chip > black_chip
      end
    end

    describe "#<" do
      it "returns true if chip value is less than other chip" do
        assert_equal true, red_chip < black_chip
      end

      it "returns false if chip value is not less than other chip" do
        assert_equal false, black_chip < red_chip
      end
    end

    describe "#==" do
      second_black_chip = Chip.new(:black, 100)
      it "returns true if chip is of equal value to other chip" do
        assert_equal true, black_chip == second_black_chip
      end

      it "returns false if chip is not of equal value to other chip" do
        assert_equal false, black_chip == red_chip
      end
    end
  end

end#Chip
