module User
  # before_create { self.remember_token = digest(new_token) }

  # def remember
  #   update_attribute(:remember_token, digest(new_token))
  # end
  #
  # def forget
  #   update_attribute(:remember_token, nil)
  # end
  #
  # private
  #
  # def new_token
  #   SecureRandom.urlsafe_base64
  # end
  #
  # def digest(string)
  #   Digest::SHA1.hexdigest(string)
  # end
end
