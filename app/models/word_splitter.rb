class WordSplitter
  def self.build_search(search_param)
    msg = key = city = nil
    paras = search_param.split(',')
    key = paras[0].strip if paras[0]
    msg = paras[1].strip if paras[1]
    city = paras[2].strip if paras[2]  
    [key, msg, city]  
  end
  
  def self.format_word(search_param)

    type = category = message = ""
    search = search_param.to_s.strip
    parts = search.split(' ')

    if search.length < 3 or parts.count < 2
      raise 'invalid format'
    end

    type = search[0..3]
    category = parts[1]
    message = WordSplitter.recreate_message(search, 1)
    [type.strip, category.strip, message.strip]

  end
  
  def self.recreate_message(str, start_from)
    count = 0
    message = ""
    str.split(" ").each {|item|
      message += " #{item}" if count > start_from #we dont need SELL and category here
      count += 1
    }
    message
  end
  
end