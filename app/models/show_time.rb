class ShowTime < ApplicationRecord
  include ActiveModel::AttributeMethods
  belongs_to :movie
  belongs_to :room

  has_many :movie_tickets, dependent: :destroy
  validates :room_id,
            uniqueness: {
              scope: :when,
              message: 'Ya existe una función en ese horario en esa sala.'
            }

  enum when: %i[morning afternoon evening]

  def when_spanish
    { 'morning' => 'matine', 'afternoon' => 'tanda', 'evening' => 'Noche' }[
      self.when
    ]
  end
end
