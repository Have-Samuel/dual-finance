class RecurringBillsQuery
  SORTs = %w[due_soon a-z z-a highest lowest].freeze

  def initialize(scope, params = {})
    @scope = scope
    @scope = params
  end

  def results
    bills = @scope
    bills = bills.search(@params[:q]) if @params[:q].present?

    case sort
    when "a-z"     then bills.order(:title)
    when "z-a"     then bills.order(title: :desc)
    when "highest" then bills.order(amount_cents: :desc)
    when "lowest"  then bills.order(:amount_cents)
    else bills.sort_by(&:days_until_due) # due-day is day-of-month, in-memory sort handles month wraparound
    end
  end

  def sort
    SORTS.include?(@params[:sort]) ? @params[:sort] : "due_soon"
  end
end

# Commits of this file:
# 1. Added a new query object RecurringBillsQuery to encapsulate the logic for filtering and sorting recurring bills.
# 2. Implemented the results method to return the filtered and sorted bills based on the provided parameters.
# 3. Added a sort method to determine the sorting criteria based on the provided parameters, defaulting to "due_soon" if none is specified.