require 'swagger_helper'

RSpec.describe "api/v1/circles", type: :request do
  path '/api/v1/circles' do
    get 'Returns circles' do
      tags 'Circles'
      produces 'application/json'
      parameter name: :center_x,
                in: :query,
                type: :number,
                description: 'X axis center point of the filter area'
      parameter name: :center_y,
                in: :query,
                type: :number,
                description: 'Y axis center point of the filter area'
      parameter name: :radius,
                in: :query,
                type: :number,
                description: 'Radius of the filter area'
      parameter name: :frame_id,
                in: :query,
                type: :integer,
                required: false,
                description: 'Frame ID of the filter area'

      response '200', 'Circles from an specific frame and an area returned successfully' do
        include_context 'with two frames with circles within'
        include_context 'with position for an area on url parameters', 14.0, 12.0, 12.0
        include_context 'with frame id on url parameters', :frame_id, :first_existing_frame

        run_test!
        it_behaves_like 'a response with circles within an area for an specific frame'
      end

      response '200', 'Circles from an area returned successfully' do
        include_context 'with two frames with circles within'
        include_context 'with position for an area on url parameters', 14.0, 12.0, 12.0

        run_test!
        it_behaves_like 'a response with circles within an area for all frames'
      end

      response '200', 'Blank parameter' do
        include_context 'with two frames with circles within'
        include_context 'with blank url parameters'

        run_test!
        it_behaves_like 'a response with no circles'
      end

    end
  end

  path '/api/v1/frames/{frame_id}/circles' do
    post 'Creates a circle within a frame' do
      tags 'Circles'
      consumes 'application/json'

      parameter name: :frame_id,
                in: :path,
                type: :integer,
                description: 'Frame ID'
      parameter name: :circle_params,
                in: :body,
                schema: CIRCLE_POST_SCHEMA,
                required: ['center_x', 'center_y', 'diameter']

      response '201', 'Circle created successfully within the frame' do
        include_context 'with a frame', :existing_frame, :common_frame
        include_context 'with circle attributes to add', :circle_within_frame
        include_context 'with frame id on url parameters', :frame_id, :existing_frame

        run_test!
        it_behaves_like 'a circle created within the frame'
      end

      response '404', 'Invalid frame' do
        include_context 'with a frame', :existing_frame, :common_frame
        include_context 'with circle attributes to add', :circle_within_frame
        include_context 'with a not existing frame', :frame_id

        run_test!
        it_behaves_like 'a circle not created'
      end

      response '422', 'Invalid circle position because of a circle overlapping' do
        include_context 'with two frames with circles within'
        include_context 'with invalid circle position overlapping an existing circle', :circle_new_position_overlapping_existing_circle
        include_context 'with frame id on url parameters', :frame_id, :first_existing_frame

        run_test!
        it_behaves_like 'a circle not created because of a circle overlapping'
      end

      response '422', 'Invalid circle position because of a frame overlapping' do
        include_context 'with a frame', :existing_frame, :common_frame
        include_context 'with invalid circle position overlapping the frame', :circle_new_position_overlapping_frame
        include_context 'with frame id on url parameters', :frame_id, :existing_frame

        run_test!
        it_behaves_like 'a circle not created because of a frame overlapping'
      end
    end
  end

  path '/api/v1/circles/{id}' do
    put "Updates a circle's position and frame" do
      tags 'Circles'
      produces 'application/json'
      consumes 'application/json'

      parameter name: :id,
                in: :path,
                type: :integer,
                description: 'Circle ID'
      parameter name: :circle_params,
                in: :body,
                schema: CIRCLE_PUT_SCHEMA,
                required: ['center_x', 'center_y', 'diameter']

      response '200', 'Circle position updated successfully' do
        include_context 'with two frames with circles within'
        include_context 'with circle id on url parameters', :id, :first_existing_frame, 3
        include_context 'with circle new position', :first_circle_new_position

        run_test!
        it_behaves_like 'a circle position updated', :first_existing_frame
      end

      response '200', 'Circle frame updated successfully' do
        include_context 'with two frames with circles within'
        include_context 'with circle id on url parameters', :id, :first_existing_frame, 3
        include_context 'with circle new frame', :first_circle_new_frame

        run_test!
        it_behaves_like 'a circle frame updated', :second_existing_frame
      end

      response '404', 'Circle not found' do
        include_context 'with two frames with circles within'
        include_context 'with a not existing circle id on url parameters'
        include_context 'with circle new position', :first_circle_new_position

        run_test!
        it_behaves_like 'a not existing circle'
      end

      response '422', 'Invalid circle new position because of a circle overlapping' do
        include_context 'with two frames with circles within'
        include_context 'with circle id on url parameters', :id, :first_existing_frame, 3
        include_context 'with invalid circle position overlapping an existing circle', :circle_new_position_overlapping_existing_circle

        run_test!
        it_behaves_like 'a circle position not updated because of a circle overlapping'
      end

      response '422', 'Invalid circle new position because of a frame overlapping' do
        include_context 'with two frames with circles within'
        include_context 'with circle id on url parameters', :id, :first_existing_frame, 3
        include_context 'with invalid circle new position overlapping the frame'

        run_test!
        it_behaves_like 'a circle position not updated because of a frame overlapping'
      end

      response '422', 'Invalid new frame for a circle' do
        include_context 'with two frames with circles within'
        include_context 'with circle id on url parameters', :id, :first_existing_frame, 3
        include_context 'with an invalid frame to update the circle'

        run_test!
        it_behaves_like 'a circle position not updated because of an invalid frame'
      end
    end
  end

  path '/api/v1/circles/{id}' do
    delete 'Deletes a circle' do
      tags 'Circles'
      produces 'application/json'
      parameter name: :id,
                in: :path,
                type: :integer,
                description: 'Circle ID'

      response '204', 'Circle deleted successfully' do
        include_context 'with a frame', :existing_frame, :common_frame
        include_context 'with an existing circle', :existing_circle, :existing_frame, :circle_within_frame
        include_context 'with circle id on url parameters', :id, :existing_frame, 0

        let!(:id) { existing_circle.id }
        run_test!
        it_behaves_like 'a circle deleted'
      end

      response '404', 'Circle not found' do
        include_context 'with a not existing circle id on url parameters'

        run_test!
        it_behaves_like 'a not existing circle'
      end
    end
  end
end