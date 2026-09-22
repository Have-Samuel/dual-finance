class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :transactions, dependent: :destroy
  has_many :budgets, dependent: :destroy
  has_many :pots, dependent: :destroy
  has_many :recurring_bills, dependent: :destroy
  has_many :categories, dependent: :destroy

  validates :name, presence: true

  def balance_cents
    transactions.income.sum(:amount_cents) - transactions.expense.sum(:amount_cents)
  end

  def monthly_income_cents(date = Date.current)
    transactions.income.where(occurred_on: date.all_month).sum(:amount_cents)
  end

  def monthly_expense_cents(date = Date.current)
    transactions.expense.where(occurred_on: date.all_month).sum(:amount_cents)
  end

  def total_saved_in_pots_cents
    PotTransaction.joins(:pot).where(pots: { user_id: id }).sum(:amount_cents)
  end

  def available_balance_cents
    balance_cents - total_saved_in_pots_cents
  end
end
