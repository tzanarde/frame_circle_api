module Api
  module V1
    class CirclesController < ApplicationController
      before_action :set_circle, only: [:update, :destroy]

      def index
        if position_params_present?
          @circles = Circle.circles_within_area(params[:center_x], params[:center_y], params[:radius])
          @circles = @circles.by_frame(params[:frame_id]) if frame_param_present?

          render json: @circles, status: :ok
        else
          render json: {}, status: :ok
        end
      end

      def create
        frame = Frame.find(params[:frame_id])
        circle = frame.circles.build(circle_params)

        if circle.save
          render json: circle, status: :created
        else
          render json: { errors: circle.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @circle.update(circle_params)
          render json: @circle, status: :ok
        else
          render json: { errors: @circle.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        return head :no_content if @circle.destroy
        
        render json: { errors: @circle.errors.full_messages }, status: :unprocessable_entity
      end

      private

      def set_circle
        @circle = Circle.find(params[:id])
      end

      def circle_params
        params.require(:circle).permit(:center_x, :center_y, :diameter, :frame_id)
      end

      def position_params_present?
        params[:center_x].present? &&
        params[:center_y].present? &&
        params[:radius].present?
      end

      def frame_param_present?
        params[:frame_id].present?
      end
    end
  end
end