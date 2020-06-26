class Transfer
  attr_accessor :sender, :receiver, :amount, :status 
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end 
  
  def both_valid?
    if @sender.valid? && @receiver.valid?
      true 
    else 
      false 
    end 
  end 
end
