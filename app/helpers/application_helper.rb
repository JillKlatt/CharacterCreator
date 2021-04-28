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
        if current_user.campaigns.count >= 1
            "You have the following games scheduled "
            current_user.campaigns.each do |campaign|
                "#{campaign.name} on #{campaign.schedule}."
            end
        end
    end 
end
