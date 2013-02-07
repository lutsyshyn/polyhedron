class SymmetryOperation
  attr_accessor :x, :y, :z

  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def multiply_atom(atom)
    new_atom_x = @x.gsub('x', atom.x.to_s)
    new_atom_x = new_atom_x.gsub('y', atom.y.to_s)
    new_atom_x = eval new_atom_x.gsub('z', atom.z.to_s)
    if new_atom_x >= 1
      new_atom_x = new_atom_x-1
    end
    if new_atom_x < 0
      new_atom_x = new_atom_x+1
    end

    new_atom_y = @y.gsub('y', atom.y.to_s)
    new_atom_y = new_atom_y.gsub('x', atom.x.to_s)
    new_atom_y = eval new_atom_y.gsub('z', atom.z.to_s)
    if new_atom_y >= 1
      new_atom_y = new_atom_y-1
    end
    if new_atom_y < 0
      new_atom_y = new_atom_y+1
    end

    new_atom_z = @z.gsub('z', atom.z.to_s)
    new_atom_z = new_atom_z.gsub('y', atom.y.to_s)
    new_atom_z = eval new_atom_z.gsub('x', atom.x.to_s)
    if new_atom_z >= 1
      new_atom_z = new_atom_z-1
    end
    if new_atom_z < 0
      new_atom_z = new_atom_z+1
    end

    Atom.new(atom.label, atom.type, new_atom_x, new_atom_y, new_atom_z)
  end

end
