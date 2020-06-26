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
      @sender.withdraw(amount)
      @receiver.deposit(amount)
      self.status = "complete"
    end 
  end 
  
  def reverse_transfer
    return if self.status == "pending"
    @sender.deposit(amount)
    @receiver.withdraw(amount)
    self.status = "reversed"
  end 
end
