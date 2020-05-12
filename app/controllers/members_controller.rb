class MembersController < ApplicationController
  before_action :find_member, only: [:show, :edit, :update, :destroy]

  def index
    @members = Member.paginate(page: params[:page])
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      flash[:success] = "Member successfully created"
      redirect_to @member
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @member.update(member_params)
      flash[:success] = "Member was successfully updated"
      redirect_to @member
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    if @member.destroy
      flash[:success] = 'Member was successfully deleted.'
      redirect_to members_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to members_url
    end
  end

  private

  def find_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:name, :email, :password, :password_confirmation)
  end
end
