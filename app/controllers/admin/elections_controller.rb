# frozen_string_literal: true

module Admin
  class ElectionsController < AdminController
    before_action :set_election, only: %i[edit update destroy]

    def index
      @elections = Election.includes(:organization, :user)
    end

    def new
      @election = Election.new
    end

    def create
      @election = Election.new(election_params)
      @election.user = current_admin_user
      if @election.save
        redirect_to elections_path, notice: 'Election created successfully.'
      else
        flash.now[:alert] = @election.errors.full_messages.join(',')
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      @election.update(election_params)
      if @election.save
        redirect_to elections_path, notice: 'Election updated successfully.'
      else
        flash.now[:alert] = @election.errors.full_messages.join(',')
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @election.destroy
      redirect_to elections_path, notice: 'Election deleted successfully.'
    end

    private

    def election_params
      params.require(:election).permit(:name, :organization_id)
    end

    def set_election
      @election = Election.find(params[:id])
    end
  end
end
