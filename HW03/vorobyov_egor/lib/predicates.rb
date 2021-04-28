module Predicates
  def self.has_error?(el)
    el if el.include? 'error'
  end
end
