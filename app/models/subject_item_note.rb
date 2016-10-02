class SubjectItemNote < ActiveRecord::Base

  belongs_to :student
  belongs_to :subject_item

  validates :student_id, :subject_item_id, presence: true
  validates :value, inclusion: { in: 1..5 }, presence: true

  scope :for_subject_item, -> (subject_item) { where(subject_item: subject_item) }
end
