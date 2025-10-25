module Api
  module V1
    class FramesController < ApplicationController
      before_action :set_frame, only: [:show, :destroy]

      def show
        render json: @frame, status: :ok
      end

      def create
        frame = Frame.new(frame_params)

        if frame.save
          render json: frame, status: :created
        else
          render json: { errors: frame.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        return head :no_content if @frame.destroy
        
        render json: { errors: @frame.errors.full_messages }, status: :unprocessable_entity
      end

      private

      def set_frame
        @frame = Frame.find(params[:id])
      end

      def frame_params
        params.require(:frame)
              .permit(:center_x, :center_y, :width, :height, circles_attributes: [:center_x, :center_y, :diameter])
      end
    end
  end
end
