module ApplicationHelper
  
  def client_full_name
    "#{@client[:name].humanize} #{@client[:surname].humanize} #{@client[:secondSurname].humanize}" if @client
  end

  #[01: Cuenta corriente, 02: Cuenta crédito]
  def account_type type
    case type
      when "01" 
        "Current Account"
      when "02"
        "Credit Account"
      else
        type
    end
  end

  #[01: Debit Card, 02: Credit Card, 03: Prepaid Card]
  def card_type type
    case type
      when "01" 
        "Debit Card"
      when "02"
        "Credit Card"
      when "03"
        "Prepaid Card"
      else
        type
    end
  end


end
