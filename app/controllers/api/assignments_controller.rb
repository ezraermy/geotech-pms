class Api::AssignmentsController < ApplicationController
  before_action :set_assignment, only: %i[show destroy]

  # HTTP GET request to retrieve a list of reservations.
  def index
    user = User.find_by(id: params[:user_id])

    if user
      assignments = user.assignments.includes(:project)
      assignments_json = assignments.map do |assignment|
        {
          id: assignment.id,
          project: assignment.project,
          user_id: assignment.user_id,
          date: assignment.date
        }
      end

      render json: assignments_json, status: :ok
    else
      render json: { message: 'User not found' }, status: :not_found
    end
  end
  
  def show
    if @assignment
      render json:
      {
        id: @assignment.id,
        project: @assignment.project,
        user_id: @assignment.user_id,
        date: @assignment.date
      }
    else
      render json: { message: 'Assignment not found' }, status: :not_found
    end
  end

  def destroy
    if @assignment.destroy
      render json: { message: 'Assignment deleted' }, status: :ok
    else
      render json: { message: 'Assignment not found' }, status: :not_found
    end
  end

  private

  def set_assignment
    @assignment = Assignment.find_by(id: params[:id])
  end

  def assignment_params
    params.require(:assignment).permit(:project_id, :date)
  end
end
