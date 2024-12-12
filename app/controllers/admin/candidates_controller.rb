module Admin
  class CandidatesController < AdminController
    before_action :set_candidate, only: %i[show edit update destroy]

    def index
      @candidates = Candidate.includes(:election, :officer_position, :party_list)
                             .order(votes: :desc)
                             .page(params[:page])
      @total_candidates = Candidate.count
    end

    def new
      @candidate = Candidate.new
    end

    def create
      @candidate = Candidate.new(candidate_params)

      if @candidate.save
        redirect_to candidates_path, notice: 'Candidate was successfully created'
      else
        flash.now[:alert] = @candidate.errors.full_messages.join(', ')
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @candidate.update(candidate_params)
        redirect_to candidates_path, notice: 'Candidate was successfully updated'
      else
        flash.now[:alert] = @candidate.errors.full_messages.join(', ')
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      if @candidate.destroy
        redirect_to candidates_path, notice: 'Canduidate was successfully destroyed'
      else
        redirect_to candidates_path, alert: @candidates.errors.full_messages.join(', ')
      end
    end

    private

    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    def candidate_params
      params.require(:candidate).permit(
        :officer_position_id,
        :party_list_id,
        :election_id,
        :name,
        :section,
        :course,
        :label
      )
    end
  end
end

