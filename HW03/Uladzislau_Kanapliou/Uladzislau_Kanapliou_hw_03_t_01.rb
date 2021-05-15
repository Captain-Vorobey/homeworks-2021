# frozen_string_literal: true

EXP = %r{/*.+\berror/*.+}.freeze

def task1(logs)
  logs.match(EXP).to_s
end
