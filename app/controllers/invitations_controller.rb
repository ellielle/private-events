class InvitationsController < ApplicationController
  def new
  end

  def create
    @invitation = User.find_by(username: params[:invitation][:username])
    if @invitation.nil?
      flash[:danger] = "User does not exist."
      redirect_to request.referrer
    else
      invite = @invitation.invitations.build(invited_user_id: @invitation.id,
                                             invited_by_id: params[:invitation][:creator_id],
                                             invited_event_id: params[:invitation][:event_id])
      if Invitation.where(invited_event_id: params[:invitation][:event_id],
                          invited_user_id: @invitation.id).empty?
        if invite.save
          flash[:success] = "#{@invitation.username} invited to event!"
          redirect_to request.referrer
        end
      else
        flash[:warning] = "#{@invitation.username} is already invited to this event!"
        redirect_to request.referrer
      end
    end
  end

  def index
    @invitations = current_user.invitations
    @event = []
    @invitations.each do |event|
      @event << Event.where("events.id = ?", event.invited_event_id).first
    end
    # TODO EVENT MAY NOT BE TREATED AS SAME OBJECT IT NEEDS TO BE AND THUS CANNOT ACCESS TITLE ATTRIBUTE
  end
end
