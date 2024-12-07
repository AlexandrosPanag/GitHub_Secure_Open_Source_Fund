# GitHub_Secure_Open_Source_Fund
An implementation approach in 2024 for https://resources.github.com/github-secure-open-source-fund/.



Ruby_SecurePassword
--------------
A randomly generated Algorithmic Approach applied using in Ruby. This algorithmic approach ensures that every time the code is compiled your password can be encrypted using random characters, securing the users' data.


require 'securerandom'
require 'digest'

class PasswordManager
  def initialize
    @stored_passwords = []
  end

  def encrypt_password(password, salt, random_chars)
    encrypted_password = Digest::SHA256.hexdigest(salt + password)
    "#{random_chars}#{encrypted_password}#{random_chars}"
  end

  def store_password(password)
    9.times do
      salt = SecureRandom.hex(16)
      random_size = SecureRandom.random_number(10..20)
      random_chars = SecureRandom.alphanumeric(random_size)
      fabricated_password = encrypt_password(SecureRandom.hex(16), salt, random_chars)
      @stored_passwords << { encrypted: fabricated_password, salt: salt, random_chars: random_chars }
    end

    salt = SecureRandom.hex(16)
    random_size = SecureRandom.random_number(10..20)
    random_chars = SecureRandom.alphanumeric(random_size)
    actual_password = encrypt_password(password, salt, random_chars)
    @stored_passwords << { encrypted: actual_password, salt: salt, random_chars: random_chars }

    # Output the encrypted actual password
    puts "Encrypted password stored: #{actual_password}"
  end

  def check_password(password)
    @stored_passwords.any? do |stored|
      encrypted_password = encrypt_password(password, stored[:salt], stored[:random_chars])
      stored[:encrypted] == encrypted_password
    end
  end

  def encrypt_user_password(password)
    salt = SecureRandom.hex(16)
    random_size = SecureRandom.random_number(10..20)
    random_chars = SecureRandom.alphanumeric(random_size)
    encrypt_password(password, salt, random_chars)
  end
end

# Example usage
password_manager = PasswordManager.new

# Prompt the user to enter a password to store
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
```

### Explanation:
1. **Initialization**: The `PasswordManager` class initializes an empty array to store encrypted passwords along with their salts and random characters.
2. **Encryption**: The `encrypt_password` method takes the password, salt, and random characters as parameters and returns the encrypted password.
3. **Storing Passwords**: The `store_password` method generates 9 fabricated encrypted passwords with their respective salts and random characters, and then stores the actual encrypted password with its salt and random characters. It also prints the encrypted actual password.
4. **Checking Passwords**: The `check_password` method encrypts the given password using the stored salts and random characters and checks if it matches any of the stored encrypted passwords.
5. **Encrypt User Password**: The `encrypt_user_password` method encrypts the user's input password with a new salt and random characters and outputs the encrypted version.
6. **Prompt for Password**: The user is prompted to enter a password to store. The input password is then encrypted and stored.
7. **Login Portal**: The user is prompted to enter their password. The input password is then encrypted and output. It is also checked against the stored encrypted passwords to verify if it is correct.

This approach ensures that the stored passwords are randomized and secure, and the actual password can be correctly verified against the stored encrypted versions. The login portal allows the user to input their password, see the encrypted version, and gain access if the password is correct.require 'securerandom'
require 'digest'

class PasswordManager
  def initialize
    @stored_passwords = []
  end

  def encrypt_password(password, salt, random_chars)
    encrypted_password = Digest::SHA256.hexdigest(salt + password)
    "#{random_chars}#{encrypted_password}#{random_chars}"
  end

  def store_password(password)
    9.times do
      salt = SecureRandom.hex(16)
      random_size = SecureRandom.random_number(10..20)
      random_chars = SecureRandom.alphanumeric(random_size)
      fabricated_password = encrypt_password(SecureRandom.hex(16), salt, random_chars)
      @stored_passwords << { encrypted: fabricated_password, salt: salt, random_chars: random_chars }
    end

    salt = SecureRandom.hex(16)
    random_size = SecureRandom.random_number(10..20)
    random_chars = SecureRandom.alphanumeric(random_size)
    actual_password = encrypt_password(password, salt, random_chars)
    @stored_passwords << { encrypted: actual_password, salt: salt, random_chars: random_chars }

    # Output the encrypted actual password
    puts " password stored: #{actual_password}"
  end

  def check_password(password)
    @stored_passwords.any? do |stored|
      encrypted_password = encrypt_password(password, stored[:salt], stored[:random_chars])
      stored[:encrypted] == encrypted_password
    end
  end

  def encrypt_user_password(password)
    salt = SecureRandom.hex(16)
    random_size = SecureRandom.random_number(10..20)
    random_chars = SecureRandom.alphanumeric(random_size)
    encrypt_password(password, salt, random_chars)
  end
end

# Example usage
password_manager = PasswordManager.new

# Prompt the user to enter a password to store
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
`

### Explanation:
1. **Initialization**: The `PasswordManager` class initializes an empty array to store encrypted passwords along with their salts and random characters.
2. **Encryption**: The `encrypt_password` method takes the password, salt, and random characters as parameters and returns the encrypted password.
3. **Storing Passwords**: The `store_password` method generates 9 fabricated encrypted passwords with their respective salts and random characters, and then stores the actual encrypted password with its salt and random characters. It also prints the encrypted actual password.
4. **Checking Passwords**: The `check_password` method encrypts the given password using the stored salts and random characters and checks if it matches any of the stored encrypted passwords.
5. **Encrypt User Password**: The `encrypt_user_password` method encrypts the user's input password with a new salt and random characters and outputs the encrypted version.
6. **Prompt for Password**: The user is prompted to enter a password to store. The input password is then encrypted and stored.
7. **Login Portal**: The user is prompted to enter their password. The input password is then encrypted and output. It is also checked against the stored encrypted passwords to verify if it is correct.

This approach ensures that the stored passwords are randomized and secure, and the actual password can be correctly verified against the stored encrypted versions. The login portal allows the user to input their password, see the encrypted version, and gain access if the password is correct.



This work is under the Apache Lience 2.0


[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
