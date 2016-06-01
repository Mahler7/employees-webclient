class EmployeesController < ApplicationController
  def index
    @employees = Unirest.get("http://localhost:3000/employees").body
  end

  def new

  end

  def create
    @employee = Unirest.post("http://localhost:3000/employees", headers: {"Accept" => "application/json"}, parameters: {first_name: params[:first_name], last_name: params[:last_name], email: params[:email], birthdate: params[:birthdate], ssn: params[:ssn]}).body

    render :show
  end

  def show
    @employee = Unirest.get("http://localhost:3000/employees/#{params[:id]}").body
  end
end
