class Stack
  attr_accessor :chips
  def initialize
    @chips = {black: [], green: [], red: [], white: []}
  end

  def add_chips(chip_stack)
    chip_stack.each do |chip|
      chips[chip.color] << chip
    end
  end

  def count
    chip_count = 0

    chips.values.flatten.each do |chip|
      chip_count += chip.value
    end

    chip_count
  end

  def remove_chips(chip_total)
    removed_chips = []
    if chip_total > count
      return "You don't have enough chips to make that bet Doyle Brunson!"
    else
      until chip_total == 0
        if chip_total >= 100 and chips[:black].length != 0
          removed_chips << chips[:black].pop
          chip_total = chip_total - removed_chips.last.value
        elsif chip_total >= 25 and chips[:green].length != 0
          removed_chips << chips[:green].pop
          chip_total = chip_total - removed_chips.last.value
        elsif chip_total >= 5 and chips[:red].length != 0
          removed_chips << chips[:red].pop
          chip_total = chip_total - removed_chips.last.value
        else
          removed_chips << chips[:white].pop
          chip_total = chip_total - removed_chips.last.value
        end
      end
      removed_chips
    end
  end
end
