module RecordsHelper
  def choose_new_or_edit
    if action_name == 'new'
      confirm_records_path
    elsif action_name == 'edit'
      confirm_record_path(@record.id)
    end
  end
end
