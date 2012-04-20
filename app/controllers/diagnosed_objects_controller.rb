class DiagnosedObjectsController < ApplicationController
  #before_filter :authenticate_user!
  before_filter :correct_user#, except: [ :index ]
  before_filter :correct_expert_system, only: [ :destroy, :show, :edit, :update ]

  def index
    @diagnosed_objects = @expert_system.diagnosed_objects
  end

  def create
    @diagnosed_object = @expert_system.diagnosed_objects.build(params[:diagnosed_object])
    if @diagnosed_object.save
      flash[:success] = "Diagnosed object created successfully!"
      @diagnosed_object.set_state_and_directive
      redirect_to [@expert_system,@diagnosed_object]
    else
      render 'new'
    end
  end

  def new
    @diagnosed_object = @expert_system.diagnosed_objects.build
    if @diagnosed_object.diagnostic_variables.empty?
      @expert_system.standards.first.diagnostic_variables.each do |diagnostic_variable|
        beef_params = ( diagnostic_variable.beef ? { beef: true } : {} )
        @diagnosed_object.diagnostic_variables.build(beef_params)
      end
    end
  end

  def update
    if @diagnosed_object.update_attributes(params[:diagnosed_object])
      flash[:success] = "Diagnosed object updated successfully!"
      @diagnosed_object.set_state_and_directive
      redirect_to [@expert_system,@diagnosed_object]
    else
      render 'edit'
    end
  end

  def destroy
    @diagnosed_object.destroy
    redirect_to root_path, flash: { success: "Diagnosed object deleted successfully!" }
  end

  private

  def correct_user
    @expert_system = ExpertSystem.find_by_id(params[:expert_system_id])#current_user.expert_systems.find_by_id(params[:expert_system_id])
    redirect_to root_path if @expert_system.nil?
  end

  def correct_expert_system
    @diagnosed_object = @expert_system.diagnosed_objects.find_by_id(params[:id])
    redirect_to root_path if @diagnosed_object.nil?
  end
end
