class Chip
  attr_reader :color, :value, :faces
  def initialize(color, value)
    @color = color
    @value = value
    @faces = [true, false]
  end

  def face_up?
    faces.first
  end

  def flip
    faces.shuffle!
  end

  include Comparable

  def <=>(other_chip)
    value <=> other_chip.value
  end
end
