IP_PATTERN = /([^\s]+)/.freeze
PATH_PATTERN = /(?<=POST).*(?=HTTP)/.freeze
TIME_PATTERN = /(?<=\[).*(?=\])/.freeze

def filter_log(text)
  arr = []
  array_text = text.split("\n")
  array_text.each do |string|
    if string =~ /POST/
      ip = string[IP_PATTERN]
      timestamp = string[TIME_PATTERN].gsub('\"POST', '').gsub('\]', '')
      path = string[PATH_PATTERN].upcase
      arr << "#{timestamp} FROM: #{ip} TO: #{path}"
    else
      arr
    end
  end
end
