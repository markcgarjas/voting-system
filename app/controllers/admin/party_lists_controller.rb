# frozen_string_literal: true

module Admin
  class PartyListsController < AdminController
    before_action :set_party_list, only: %i[edit update destroy]

    def index
      @party_lists = PartyList.includes(:organization)
    end

    def new
      @party_list = PartyList.new
    end

    def create
      @party_list = PartyList.new(party_list_params)
      if @party_list.save
        redirect_to party_lists_path, notice: 'Party list was successfully created.'
      else
        flash.now[:alert] = @party_list.errors.full_messages.join(', ')
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @party_list.update(party_list_params)
        redirect_to party_lists_path, notice: 'Party list was successfully updated.'
      else
        flash.now[:alert] = @party_list.errors.full_messages.join(', ')
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @party_list.destroy
      redirect_to party_lists_path, notice: 'Party list was successfully deleted.'
    end

    private

    def party_list_params
      params.require(:party_list).permit(:name, :description, :organization_id)
    end

    def set_party_list
      @party_list = PartyList.find(params[:id])
    end
  end
end
