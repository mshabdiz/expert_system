class ExpertSystemsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user, only: [ :destroy, :show, :edit, :update ]

  def index
    @expert_systems = current_user.expert_systems
  end

  def create
    @expert_system = current_user.expert_systems.build(params[:expert_system])
    if @expert_system.save
      flash[:success] = "Expert system created successfully!"
      redirect_to @expert_system
    else
      render 'new'
    end
  end

  def new
    @expert_system = ExpertSystem.new
    if @expert_system.standards.empty?
      3.times { @expert_system.standards.build }
      @expert_system.standards.each do |standard|
        3.times { standard.diagnostic_variables.build }
        standard.diagnostic_variables.build(beef: true)
        standard.build_directive
      end
    end
  end

  def update
    if @expert_system.update_attributes(params[:expert_system])
      flash[:success] = "Expert system updated successfully!"
      redirect_to @expert_system
    else
      render 'edit'
    end
  end

  def destroy
    @expert_system.destroy
    redirect_to root_path, flash: { success: "Expert system deleted successfully!" }
  end

  private

  def correct_user
    @expert_system = current_user.expert_systems.find_by_id(params[:id])
    redirect_to root_path if @expert_system.nil?
  end
end