module ApplicationHelper

    def current_user
        @user ||= User.find_by_id(session[:user_id]) if session[:user_id].present?
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
        end
    end 

    # def find_dm
    #     @campaign.adventures.each do |adventure|
    #         if adventure.role == true
    #         @found_character_id = adventure.character_id
    #             #byebug
    #         end
    #             if !@found_character_id.nil?
    #                 @dm = Character.find_by(id: @found_character_id)
    #                 return "The DM for this fine game is: #{@dm.name}"
    #             end
    #         end

    # end
    
end
