class InvitationsController < ApplicationController
  def new
  end

  def create
    #TODO don't create if user is already attending the event
    @invitation = User.find_by(username: params[:invitation][:username])
    if @invitation.nil?
      flash[:danger] = "User does not exist."
      redirect_to request.referrer
    else
      if !@invitation.invitations.where(invited_user_id: @invitation.id).exists?
        invite = @invitation.invitations.build(invited_user_id: @invitation.id,
                                               invited_by_id: params[:invitation][:creator_id],
                                               invited_event_id: params[:invitation][:event_id])
        if invite.save
          flash[:success] = "#{@invitation.username} invited to event!"
          redirect_to request.referrer
        end
      else
        flash[:warning] = "#{@invitation.username} is already invited to this event!"
        redirect_to request.referer
      end
    end
  end

  def index
    @invitations = current_user.invitations
    @event = []
    @invitations.each do |event|
      @event << Event.where("events.id = ?", event.invited_event_id).first
    end
  end

  def destroy
    if params[:commit] == "Accept"
      accept_invite(params[:event_id], params[:invited_user_id])
    elsif params[:commit] == "Decline"
      destroy_invitation(params[:event_id], params[:invited_user_id])
    end
    redirect_to invites_path
  end

  private

  def accept_invite(event, user_id)
    user = User.find_by(id: user_id)
    unless user.attendances.where(attended_event_id: event).exists?
      accept = user.attendances.build(attended_event_id: event)
      if accept.save
        flash[:success] = "Invitation accepted."
        destroy_invitation(event, user_id)
      else
        flash[:success] = "Invitation declined."
      end
    end
  end

  def destroy_invitation(event, user)
    Invitation.where(invited_event_id: event, invited_user_id: user).destroy_all
  end
end
