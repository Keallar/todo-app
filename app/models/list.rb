# frozen_string_literal: true

class List < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :user

  def percent_complete
    return 0 if total_items.zero?

    (100 * completed_items.to_f / total_items).round
  end

  def completed_items
    @completed_items ||= items.completed.count
  end

  def total_items
    @todo_items ||= items.count
  end

  def status
    case percent_complete.to_i
    when 0
      'Not started'
    when 100
      'Complete'
    else
      'In progress'
    end
  end

  def badge_color
    case percent_complete.to_i
    when 0
      'dark'
    when 100
      'success'
    else
      'info'
    end
  end
end
