module ApplicationHelper

    def current_user
        @user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def readible_datetime(obj)
        date = obj.created_at.to_date

        date.strftime("%b %d, %Y")
    end

    def display_campaign_schedule
        current_user.campaigns.each do |campaign|
            return campaign.name #campaign.schedule
            binding.pry
        end
    end 
end
