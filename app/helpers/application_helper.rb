module ApplicationHelper
  
  def client_full_name
    "#{@client[:name].humanize} #{@client[:surname].humanize} #{@client[:secondSurname].humanize}" if @client
  end

end
