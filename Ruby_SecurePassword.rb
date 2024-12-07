# By Alexandros Panagiotakopoulos 
# Apache 2.0 License
# alexandrospanag.github.io
# Date 2024-2025.

require 'securerandom' # For generating random data
require 'digest' # For SHA256 encryption
 
class PasswordManager # Class to manage passwords
  def initialize # Initialize the stored passwords array
    @stored_passwords = [] # Initialize an empty array to store passwords
  end

  def encrypt_password(password, salt, random_chars) # Encrypt the password using SHA256
    encrypted_password = Digest::SHA256.hexdigest(salt + password) # Encrypt the password using SHA256
    "#{random_chars}#{encrypted_password}#{random_chars}" # Return the encrypted password with random characters
  end

  def store_password(password) # Store the password with fabricated iterations
     9.times do # Repeat 9 times
      salt = SecureRandom.hex(16) # Generate a random salt
      random_size = SecureRandom.random_number(10..20) # Generate a random size for the random characters
      random_chars = SecureRandom.alphanumeric(random_size) # Generate random characters
      fabricated_password = encrypt_password(SecureRandom.hex(16), salt, random_chars) # Encrypt a fabricated password
      @stored_passwords << { encrypted: fabricated_password, salt: salt, random_chars: random_chars } # Store the fabricated password
    end

    salt = SecureRandom.hex(16) # Generate a random salt
    random_size = SecureRandom.random_number(10..20) # Generate a random size for the random characters
    random_chars = SecureRandom.alphanumeric(random_size) # Generate random characters 
    actual_password = encrypt_password(password, salt, random_chars) # Encrypt the actual password 
    @stored_passwords << { encrypted: actual_password, salt: salt, random_chars: random_chars } # Store the actual password

    # Output the encrypted actual password
    puts "Encrypted password: #{actual_password}" # Output the encrypted actual password
  end

  def check_password(password) # Check if the password is correct
    @stored_passwords.any? do |stored| # Iterate through the stored passwords
      encrypted_password = encrypt_password(password, stored[:salt], stored[:random_chars]) # Encrypt the password
      stored[:encrypted] == encrypted_password # Check if the encrypted password is correct
    end
  end
 
  def encrypt_user_password(password) # Encrypt the user's input password
    salt = SecureRandom.hex(16) # Generate a random salt
    random_size = SecureRandom.random_number(10..20) # Generate a random size for the random characters
    random_chars = SecureRandom.alphanumeric(random_size) # Generate random characters
    encrypt_password(password, salt, random_chars) # Encrypt the user's input password
  end
end

# Example usage
password_manager = PasswordManager.new

# Prompt the user to enter a password
puts "Enter a password to store:"
password = gets.chomp

# Store the password with 9 fabricated iterations
password_manager.store_password(password)

# Simulate a login portal
puts "Enter your password to login:"
input_password = gets.chomp

# Encrypt the user's input password and output it
encrypted_input_password = password_manager.encrypt_user_password(input_password)
puts "Encrypted input password: #{encrypted_input_password}"

# Check if the given password is correct
if password_manager.check_password(input_password)
  puts "Password is correct. Access granted."
else
  puts "Password is incorrect. Access denied."
end
