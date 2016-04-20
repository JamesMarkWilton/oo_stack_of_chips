require 'spec_helper'
require 'stack'

RSpec.describe "Stack" do
  def seed_chips
    seed_chips = [
        Chip.new(:black, 100),
        Chip.new(:black, 100),
        Chip.new(:green, 25),
        Chip.new(:green, 25),
        Chip.new(:green, 25),
        Chip.new(:green, 25),
        Chip.new(:red, 5),
        Chip.new(:red, 5),
        Chip.new(:red, 5),
        Chip.new(:red, 5),
        Chip.new(:red, 5),
        Chip.new(:white, 1),
        Chip.new(:white, 1),
        Chip.new(:white, 1),
        Chip.new(:white, 1),
        Chip.new(:white, 1),
      ]
  end
  context "has public attribute" do
    describe "#chips" do
      it "returns a hash" do
        stack = Stack.new
        assert_equal Hash, stack.chips.class
      end

      it "has a key for each of the chip colors (:black, :green, :red, :white)" do
        stack = Stack.new
        keys = [:black, :green, :red, :white].sort
        assert_equal keys, stack.chips.keys.sort
      end

      it "initiates with an empty array for each of its hash values" do
        stack = Stack.new
        assert_equal Array, stack.chips[:black].class
      end
    end
  end

  describe "#add_chips" do
    it "accepts an array of chips and stores them in the #chips attribute" do
      stack = Stack.new
      stack.add_chips(seed_chips)
      assert_equal 2, stack.chips[:black].length
      assert_equal Chip, stack.chips[:black][0].class
      assert_equal 4, stack.chips[:green].length
      assert_equal Chip, stack.chips[:green][0].class
      assert_equal 5, stack.chips[:red].length
      assert_equal Chip, stack.chips[:red][0].class
      assert_equal 5, stack.chips[:white].length
      assert_equal Chip, stack.chips[:white][0].class

    end
  end

  describe "#count" do
    it "returns the sum of all chip values" do
      stack = Stack.new
      stack.add_chips(seed_chips)
      assert_equal 330, stack.count
    end
  end

  describe "#remove_chips" do
    context "accepts an integer representing a total value as an argument" do
      it "returns an array of chips whose value totals the requested amount" do
        stack = Stack.new
        stack.add_chips(seed_chips)
        assert_equal 150, stack.remove_chips(150).map(&:value).reduce(:+)
      end

      it "returns the minimum number of chips required for amount" do
        stack = Stack.new
        stack.add_chips(seed_chips)
        assert_equal 4, stack.remove_chips(80).length
      end
    end
  end

  context "handles edge cases" do
    describe "#remove_chips" do
      it "handles bets over chip amount gracefully" do
        stack = Stack.new
        stack.add_chips(seed_chips)
        assert_equal "You don't have enough chips to make that bet Doyle Brunson!", stack.remove_chips(400)
      end
    end
  end

end#Stack

