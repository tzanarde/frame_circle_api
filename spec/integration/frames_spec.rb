require 'swagger_helper'

RSpec.describe "api/v1/frames", type: :request do
  path '/api/v1/frames/{id}' do
    get 'Returns a frame' do
      tags 'Frames'
      produces 'application/json'
      parameter name: :id,
                in: :path,
                type: :integer,
                description: 'Frame ID'

      response '200', 'Frame returned successfully' do
        include_context 'with a frame', :existing_frame, :common_frame
        include_context 'with frame id url parameters', :existing_frame

        run_test!
        it_behaves_like 'a response with a frame with no circles within', :existing_frame
      end

      response '200', 'Frame with a circle within returned successfully' do
        include_context 'with frame with circles within', :common_frame, [:circle_within_frame]
        include_context 'with frame id url parameters', :existing_frame

        run_test!
        it_behaves_like 'a response with a frame with circles within', :existing_frame
      end

      response '200', 'Frame with multiple circles within returned successfully' do
        include_context 'with frame with circles within',
                        :common_frame,
                        [:circle_within_frame, :second_circle_within_frame]
        include_context 'with frame id url parameters', :existing_frame

        run_test!
        it_behaves_like 'a response with a frame with circles within', :existing_frame
      end

      response '404', 'Frame not found' do
        include_context 'with a not existing frame', :id

        run_test!
      end
    end
  end

  path '/api/v1/frames' do
    post 'Creates a frame and circles within' do
      tags 'Frames'
      consumes 'application/json'
      parameter name: :frame_params,
                in: :body,
                schema: FRAME_SCHEMA,
                required: ['center_x', 'center_y', 'width', 'height']

      response '201', 'Frame created successfully' do
        include_context 'with frame attributes to add', :common_frame

        run_test!
        it_behaves_like 'a frame with no circles within', :frame_params
      end

      response '201', 'Frame with one circle created successfully' do
        include_context 'with frame attributes to add with circles within', :common_frame, [:circle_within_frame]

        run_test!
        it_behaves_like 'a frame with circles within', :frame_params
      end

      response '201', 'Frame with multiple circles created successfully' do
        include_context 'with frame attributes to add with circles within',
                        :common_frame,
                        [:topmost_circle_within_the_frame, :rightmost_circle_within_the_frame]

        run_test!
        it_behaves_like 'a frame with circles within', :frame_params
      end

      response '422', 'Invalid frame attributes' do
        include_context 'with invalid frame attributes to add'
        
        run_test!
        it_behaves_like 'no frames created'
      end

      response '422', 'Invalid circle attributes' do
        include_context 'with a frame with invalid circles within'
        
        run_test!
        it_behaves_like 'no frames created'
      end
    end
  end

  path '/api/v1/frames/{id}' do
    delete 'Deletes a frame with no circles within' do
      tags 'Frames'
      produces 'application/json'
      parameter name: :id,
                in: :path,
                type: :integer,
                description: 'Frame ID'

      response '204', 'Frame deleted successfully' do
        include_context 'with a frame', :existing_frame, :common_frame
        include_context 'with frame id url parameters', :existing_frame

        run_test!
        it_behaves_like 'a frame deleted'
      end

      response '404', 'Frame Not Found' do
        include_context 'with a not existing frame', :id

        run_test!
        it_behaves_like 'a not existing frame'
      end

      response '422', 'Frame with a circle within' do
        include_context 'with frame with circles within', :common_frame, [:circle_within_frame]
        include_context 'with frame id url parameters', :existing_frame

        run_test!
        it_behaves_like 'a frame not deleted'
      end

      response '422', 'Frame with a multiple circles within' do
        include_context 'with frame with circles within', :common_frame, [:circle_within_frame, :second_circle_within_frame]
        include_context 'with frame id url parameters', :existing_frame

        run_test!
        it_behaves_like 'a frame not deleted'
      end
    end
  end
end
