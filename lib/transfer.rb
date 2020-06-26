class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :count 
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end 
  
  def valid?
    if sender.valid? && receiver.valid?
      true 
    else 
      false 
    end 
  end 
  
  def execute_transaction 
    return if self.status == "complete"
    if !self.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else 
      
      @receiver.deposit(amount)
      self.status = "complete"
    end 
  end 
end
