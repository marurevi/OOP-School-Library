# Base class

class Nameable
  def correct_name
    raise NotImplementedError, "Subclass must implement correct_name"
  end
end