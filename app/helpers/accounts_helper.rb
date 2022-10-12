module AccountsHelper

    def profile_picture account, width, height 
        image_path = account.profile_image.attached? ? account.profile_image : "default-profile.jpg" 
        image_tag(image_path, width: width, height: height, :class => "profile-pic")
    end

    def can_edit_profile? profile_id
        account_signed_in? && current_account.id == profile_id 
    end
end
