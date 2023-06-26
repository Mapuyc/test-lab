class EnrollmentsController < ApplicationController
  def index
  	@sections = Section.all
    @enrollments = current_user.enrollments.includes(section: [:teacher, :subject, :classroom])
  end

  def create
    @enrollment = current_user.enrollments.new(enrollment_params)

    respond_to do |format|
      if @enrollment.save
        format.html { redirect_to enrollments_path, notice: 'Enrollment was successfully created.' }
        format.json { render json: @enrollment, status: :created }
      else
        format.html { redirect_to enrollments_path, notice: @enrollment.errors.full_messages }
        format.json { render json: @enrollment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    current_user.enrollments.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to enrollments_url, notice: 'Enrollment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:section_id)
  end
end