class SessionUpdater
  def update_session(session, tool)
    session[:tool_ids] ? session[:tool_ids] << tool.id : session[:tool_ids] = [tool.id]
    session[:most_recent_tool_id] = tool.id
    session[:current_tool_count] = session[:tool_ids].count
    session[:current_potential_revenue] = Tool.find(session[:tool_ids]).map {|tool| tool.price * tool.quantity }.reduce(:+)
  end
end
