module Predicates
  def valid(value, &block)
    block.call(value) ? value : return
  end
end
