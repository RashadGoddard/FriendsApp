class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_model!, except:[:index,:show]
  before_action :correct_model, only: [:edit, :updtae, :destory]
  # GET /friends
  # GET /friends.json
  def index
    @friends = Friend.all
  end

  # GET /friends/1
  # GET /friends/1.json
  def show
  end

  # GET /friends/new
  def new
    #@friend = Friend.new
    @friend = current_model.friends.build
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends
  # POST /friends.json
  def create
    #@friend = Friend.new(friend_params)
     @friend = current_model.friends.build (friend_params)
    respond_to do |format|
      if @friend.save
        format.html { redirect_to @friend, notice: 'Friend was successfully created.' }
        format.json { render :show, status: :created, location: @friend }
      else
        format.html { render :new }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1
  # PATCH/PUT /friends/1.json
  def update
    respond_to do |format|
      if @friend.update(friend_params)
        format.html { redirect_to @friend, notice: 'Friend was successfully updated.' }
        format.json { render :show, status: :ok, location: @friend }
      else
        format.html { render :edit }
        format.json { render json: @friend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1
  # DELETE /friends/1.json
  def destroy
    @friend.destroy
    respond_to do |format|
      format.html { redirect_to friends_url, notice: 'Friend was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def correct_user
    @friend = current_model.friends.find_by(id: params [:id])
    redirect_to friends_path, notice: "NOT AURTHORIZED TO EDIT THIS FRINDE" if @friend.nil?


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friend = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:full_name, :email, :twitter, :phone_number, :current_model_id)
    end
end
