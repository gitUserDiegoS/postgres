class Comment < ApplicationRecord
  belongs_to :appuser
  belongs_to :article
  validates :body, presence: true

end
