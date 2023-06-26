class EnrollmentsController < ApplicationController
	before_action :set_enrollments, only: %i[index download_pdf]

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

  def download_pdf
	  pdf = PrawnRails::Document.new
	  pdf.text "Enrollments"
  	pdf.move_down 20
  	pdf.table @enrollments.collect {|en| en.pdf_data }
	  send_data pdf.render, filename: "document.pdf", type: "application/pdf", disposition: "attachment"
	end

  private

  def enrollment_params
    params.require(:enrollment).permit(:section_id)
  end

  def set_enrollments
  	@enrollments = current_user.enrollments.includes(section: [:teacher, :subject, :classroom])
  end
end