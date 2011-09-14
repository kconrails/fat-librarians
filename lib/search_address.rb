module SearchAddress
  def search_address
    return @search_address if defined?(@search_address)
    @search_address = "#{address} #{region}"
  end

  private
  
  def region
    if [city, state, zip].all?(&:blank?)
      ''
    elsif zip.blank?
      "#{city}, #{state}"
    else
      zip
    end
  end
end