# GitHub_Secure_Open_Source_Fund
An implementation approach in 2024 for https://resources.github.com/github-secure-open-source-fund/.



Ruby_SecurePassword
--------------
A randomly generated Algorithmic Approach applied using in Ruby. This algorithmic approach ensures that every time the code is compiled your password can be encrypted using random characters, securing the users' data.

The PasswordManager class provides functionality to securely store and verify passwords using SHA-256 encryption. It generates random salts and random characters to ensure that each encrypted password is unique and secure. The class also includes methods to store passwords with fabricated iterations and to check if a given password is correct.

Dependencies
securerandom: For generating random data such as salts and random characters.
digest: For SHA-256 encryption.
Class: PasswordManager
Methods
initialize
Initializes the PasswordManager class by creating an empty array to store encrypted passwords along with their salts and random characters.

encrypt_password(password, salt, random_chars)
Encrypts the given password using SHA-256 encryption with the provided salt and random characters.

Parameters:
password (String): The password to be encrypted.
salt (String): The salt to be used for encryption.
random_chars (String): Random characters to be appended to the encrypted password.
Returns: (String) The encrypted password with random characters.
store_password(password)
Stores the given password with 9 fabricated iterations and one actual encrypted password.

Parameters:
password (String): The password to be stored.
Behavior:
Generates 9 fabricated encrypted passwords with random salts and random characters.
Encrypts and stores the actual password with a random salt and random characters.
Outputs the encrypted actual password.
check_password(password)
Checks if the given password matches any of the stored encrypted passwords.

Parameters:
password (String): The password to be checked.
Returns: (Boolean) true if the password is correct, false otherwise.
encrypt_user_password(password)
Encrypts the user's input password with a new salt and random characters.

Parameters:
password (String): The password to be encrypted.
Returns: (String) The encrypted password with random characters.
Example Usage
License
This code is licensed under the Apache 2.0 License.



This work is under the Apache Lience 2.0


[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
