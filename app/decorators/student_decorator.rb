class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    notes = SubjectItemNote.where(:subject_item_id => subject_item, :student_id => object).pluck(:value)
    notes = [0] if notes.empty?
    avg = notes.inject(:+).to_f / notes.size
    "%.2f" % avg
  end

  def all_notes(subject_item)
    noteArr = SubjectItemNote.where(:subject_item_id => subject_item, :student_id => object).pluck(:value)
    noteArr.map(&:inspect).join(', ')
  end
end
