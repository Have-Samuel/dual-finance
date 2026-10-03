class PotTransaction < ApplicationRecord
  belongs_to :pot

  validates :amount_cents, presence: true,
            numericality: { only_integer:true, greater_than: 0 }
  validates :transacted_on, presence: true
  validates :deposit_with_in_available_balance, if: -> { amount_cents.to_i.positive? }
  validates :withdrawal_within_savings, if: -> { amount_cents.to_i.negative? }

  # Virtual attribute: so forms can accept dollar amounts while the column stays integer cents.
  def amount
    amount_cents && amount_cents / 100.0
  end

  private

  def deposit_within_available_balance
    return unless pot&.user
    if amount_cents > pot.user.available_balance_cents
      errors.add(:amount, "exceeds your available balance")
    end
  end

  def withdrawal_within_savings
    return unless pot
    errors.add(:amount, "exceeds the pot's savings") if pot.saved_cents + amount_cents < 0
  end
end
