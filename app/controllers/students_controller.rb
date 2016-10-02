class StudentsController < ApplicationController
  expose(:students)
  expose(:student, attributes: :student_params)
  expose(:student_subject_items) { student.subject_items }
  expose(:subject_item_note, attributes: :subject_item_params)

  # def index
  # end
  #
  # def new
  # end
  #
  # def show
  # end

  def create_new_subject_item_note
    if subject_item_note.save
      redirect_to student_subjects_path(params[:subject_item_note][:student_id]), notice: I18n.t('shared.created', resource: 'subject_item_note')
    else
      redirect_to student_subjects_path(params[:subject_item_note][:student_id]), :flash => { :error => subject_item_note.errors.full_messages.join(', ') }
    end
  end

  def create
    if student.save
      redirect_to student_path(student), notice: I18n.t('shared.created', resource: 'Student')
    else
      render :new
    end
  end

  def update
    if student.save
      redirect_to student_path(student), notice: I18n.t('shared.updated', resource: 'Student')
    else
      render :edit
    end
  end

  def destroy
    student.destroy
    redirect_to students_path, notice: I18n.t('shared.deleted', resource: 'Student')
  end


  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, subject_item_ids: [])
  end

  def subject_item_params
    params.require(:subject_item_note).permit(:student_id, :subject_item_id, :value)
  end

end
