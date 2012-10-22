class AttachmentsController < ApplicationController
  # GET /attachments
  # GET /attachments.json
  def index
    @attachments = current_user.isAdmin? ? (Attachment.all) : (Attachment.where :user_id => current_user.id)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attachments }
    end
  end

  # GET /attachments/1
  # GET /attachments/1.json
  def show
    @attachment = Attachment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attachment }
    end
  end

  # GET /attachments/new
  # GET /attachments/new.json
  def new
    @attachment = Attachment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attachment }
    end
  end

  # Disable edit action
  # GET /attachments/1/edit
  # def edit
  #   @attachment = Attachment.find(params[:id])
  # end

  # POST /attachments
  # POST /attachments.json
  def create
    save_file params[:attachment][:filename]
    params[:attachment][:filename] = params[:attachment][:filename].original_filename
    params[:attachment][:user_id] = current_user.id
    @attachment = Attachment.new(params[:attachment])
    respond_to do |format|
      if @attachment.save
        format.html { redirect_to @attachment, notice: 'Attachment was successfully created.' }
        format.json { render json: @attachment, status: :created, location: @attachment }
      else
        format.html { render action: "new" }
        format.json { render json: @attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # Disable update method
  # PUT /attachments/1
  # PUT /attachments/1.json
  # def update
  #   @attachment = Attachment.find(params[:id])

  #   respond_to do |format|
  #     if @attachment.update_attributes(params[:attachment])
  #       format.html { redirect_to @attachment, notice: 'Attachment was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @attachment.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /attachments/1
  # DELETE /attachments/1.json
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to attachments_url }
      format.json { head :no_content }
    end
  end
  
  def download
    filename = (Attachment.find params[:id]).filename
    send_file File.open pick_up_file filename
    return 
  end
  
  private
  def save_file upload_file
    upload_path = Rails.root.to_s+"/upload_files/#{current_user.id}/"
    Dir.mkdir upload_path if !Dir.exist? upload_path
    File.open upload_path+upload_file.original_filename, 'wb' do |file|
      file << upload_file.tempfile.read
    end
  end
  
  def pick_up_file file_name
    Rails.root.to_s+"/upload_files/#{current_user.id}/#{file_name}"
  end
end
