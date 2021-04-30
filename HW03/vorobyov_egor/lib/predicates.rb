module Predicates
  def self.with_error(el)
    el if el.include? 'error'
  end
end
