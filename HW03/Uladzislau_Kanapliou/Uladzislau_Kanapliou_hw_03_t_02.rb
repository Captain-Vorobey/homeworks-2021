# frozen_string_literal: true

EXP_FIND = %r{/*.+\bPOST/*.+}.freeze
EXP_DATE = %r{\d{2}/\w{3}/\d{4}(:\d{2}){3}..\d{4}}.freeze
EXP_IP = /\b\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\b/.freeze
EXP_PATH = %r{^/|//|(/[\w-]+)+[\s]}.freeze

def task2(logs)
  logs.split("\n")
    .select { |line| line.match(EXP_FIND) }
    .map do |line|
      line.match(EXP_DATE).to_s + ' FROM: ' +
      line.match(EXP_IP).to_s + ' TO: ' +
      line.match(EXP_PATH).to_s.upcase
  end
end
