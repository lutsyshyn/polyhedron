class Atom
  attr_accessor :x, :y, :z, :type, :label

  def initialize(label, type, x, y, z)
    @label = label
    @type = type
    @x = x
    @y = y
    @z = z
  end

  def ==(other)
    @x == other.x && @y == other.y && @z == other.z && @label == other.label
  end

  def to_s
    "#{@label} #{@x}/#{@y}/#{@z}"
  end

end
