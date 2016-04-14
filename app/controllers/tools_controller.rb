class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end

  def show
    @tool = Tool.find(params[:id])
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    if @tool.save
      flash[:notice] = "Successfully created tool."
      SessionUpdater.new.update_session(session, @tool)
      redirect_to tool_path(@tool.id)
    else
      flash[:errors] = @tool.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    tool = Tool.find( params[:id] )
    tool.destroy
    redirect_to tools_path
  end

  private
  def tool_params
    params.require(:tool).permit(:name, :price, :quantity)
  end
end
