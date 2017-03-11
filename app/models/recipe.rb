class Recipe < ApplicationRecord
    belongs_to :kitchen
    belongs_to :type_food

    has_attached_file :picture, styles: { medium: '300x300>', thumb: '100x100>' }
    validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

    scope :most_recent, -> {order(id: :desc)}
end
