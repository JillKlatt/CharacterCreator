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

    def if_errors(model)
        if model.errors.any? 
            render partial: 'errors/errors', locals: {model: model} 
        end
    end

    def display_errors(model)
        model.errors.full_messages.each do |e|
            content_tag(:li, e) #after class/id/whatever
        end.join.html_safe 
    end

    def if_dm(model)
        if model.adventures.each do |adventure|
            if adventure.role == true
                @found_character_id = adventure.character_id
                end
            end
        end
    end

    def find_dm
        if !@found_character_id.nil?
            @dm = Character.find_by(id: @found_character_id)
            return "The DM for this fine game is: #{@dm.name}"
        end
    end

    def display_characters(model)
                model.characters.each do |character|
                    content_tag(:link_to, character_path(character))
                    # byebug
                #link_to character.name, character_path(character)
        end.join
    end

    def if_characters(model)
        if model.characters.count > 0
            display_characters(model)
        end
    end
    
end
