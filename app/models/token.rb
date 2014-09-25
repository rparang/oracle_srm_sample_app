class Token

  def token
    file = File.read("#{Rails.root}/config/token.json")
    if file != ""
      token_object = JSON.parse(file)
      # return token_object["access_token"]
    else
      return nil
    end
  end

  def save_token(object)
    File.open("#{Rails.root}/config/token.json", "w") { |file| file.write object }
  end

  def delete_token 
    File.open("#{Rails.root}/config/token.json", "w") { |file| file.write "" }
  end

end