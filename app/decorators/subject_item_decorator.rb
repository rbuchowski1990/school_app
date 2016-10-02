class SubjectItemDecorator < BaseDecorator
  def title_with_assigned_teacher
    teacher.present? ? "#{title} (#{teacher.decorate.full_name})" : title
  end

  def subject_students
    students = object.students.pluck(:first_name, :last_name)
    students.map! { |stud| stud.join(' ') }.join(', ')
  end
end
