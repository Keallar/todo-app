# frozen_string_literal: true

module ItemsHelper
  def item_statuses
    [['Not started', 'not_started'], ['In progress', 'in_progress'], %w[Completed completed]]
  end
end
