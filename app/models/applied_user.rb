class AppliedUser < ApplicationRecord
  belongs_to :user
  belongs_to :travel
end
