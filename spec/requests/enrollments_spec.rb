require 'rails_helper'

RSpec.describe "Enrollments", type: :request do
  let!(:student) { FactoryBot.create(:student) }
  let!(:section) { FactoryBot.create(:section) }

  describe "GET /enrollments" do
    it "displays the index page with sections and enrollments" do
      enrollment = FactoryBot.create(:enrollment, student: student, section: section)
      get enrollments_path
      expect(response).to have_http_status(200)
      expect(response.body).to include(section.subject.name)
      expect(response.body).to include(enrollment.section_id.to_s)
    end
  end

  describe "POST /enrollments" do
    context "with valid params" do
      it "creates a new enrollment" do
        expect {
          post enrollments_path, params: { enrollment: { section_id: section.id } }
        }.to change(Enrollment, :count).by(1)
      end

      it "redirects to the enrollments index" do
        post enrollments_path, params: { enrollment: { section_id: section.id } }
        expect(response).to redirect_to(enrollments_path)
      end
    end

    context "with invalid params" do
      it "does not create a new enrollment" do
        expect {
          post enrollments_path, params: { enrollment: { section_id: nil } }
        }.not_to change(Enrollment, :count)
      end

      it "redirects to the enrollments index with error notice" do
        post enrollments_path, params: { enrollment: { section_id: nil } }
        expect(response).to redirect_to(enrollments_path)
        expect(flash[:notice].first).to eq("Section must exist")
      end
    end
  end

  describe "DELETE /enrollments/:id" do
    let!(:enrollment) { FactoryBot.create(:enrollment, student: student, section: section) }

    it "destroys the requested enrollment" do
      expect {
        delete enrollment_path(enrollment)
      }.to change(Enrollment, :count).by(-1)
    end

    it "redirects to the enrollments index" do
      delete enrollment_path(enrollment)
      expect(response).to redirect_to(enrollments_path)
    end
  end
end

