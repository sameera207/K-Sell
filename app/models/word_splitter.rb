class WordSplitter
  def self.build_search search_param
    msg = key = city = nil
    paras = search_param.split(',')
    key = paras[0].strip if paras[0]
    msg = paras[1].strip if paras[1]
    city = paras[2].strip if paras[2]  
    [key, msg, city]  
  end
end