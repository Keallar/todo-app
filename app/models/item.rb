# frozen_string_literal: true

class Item < ApplicationRecord
  enum status: [:not_started, :in_progress, :completed]

  belongs_to :list
end
