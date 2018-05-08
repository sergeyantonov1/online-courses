module Cabinet
  module Client
    class PagesController < BaseController
      expose :courses_count, -> { current_user.courses.count }

      def dashboard
      end

      def profile
      end
    end
  end
end
