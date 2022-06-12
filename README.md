# Enigma
The Enigma Cipher is an encryption algorithm that was used during World War II, and cracked by Alan Turing. You can learn more about Enigma Cipher at [the link here](https://en.wikipedia.org/wiki/Enigma_machine#:~:text=The%20Enigma%20machine%20is%20a,branches%20of%20the%20German%20military).

The version here was created in Ruby for Turing School's back-end engineering Module 1 final project. 

### Some notes...
- the program is run via the command line and accepts text for encryption and decryption that is provided within a text file *(see instructions below)* 
- decryption is done automatically using the previous encryption key if a key and date argument are not provided
- special characters are accepted but are not encrypted using the cipher
- the cipher accepts upper and lowercase letters, however all text is output in lowercase

# To Encrypt a message:  
> Download or clone this repo  
(ex. `git clone paste_name_of_repo_here`)  
  
> Navigate to the repo folder on your computer  
  
> Add any text you would like to encrypt to the file `message.txt`  
  
> From your terminal, run the following command: 

    `ruby ./lib/encrypt.rb message.txt encrypted.txt`  

> If you'd like to choose your own encryption key, simply choose a 5-digit number and provide it at the end of the command, like so: 

    `ruby ./lib/encrypt.rb message.txt encrypted.txt 12345` 

> You can also add an optional 6-digit date argument for the encryption method like so:

    `ruby ./lib/encrypt.rb message.txt encrypted.txt 12345 123122`  
        
> Your encrypted message can be found inside of the text folder at the file path below:

    `enigma/text/encrypted.txt`  
        
> To decrypt the message, type the command below into  your terminal:

    `ruby ./lib/decrypt.rb encrypt.txt decrypted.txt`  
      
> If you want to use a specific decryption key and date, type them at the end of the command above *(the format should be similar to the encryption command with key and date arguments)*  
    
> The encrypted or decrypted message can be found in the corresponding text file inside of the text folder  
  
> In additon to your encrypted or decrypted message, your **key** and **date** values are returned both in your terminal, as well as in corresponding text files inside of the `text` file folder
   
     
     
# Self-Assessment
## Functionality: 3
> Encrypt and Decrypt methods are complete, and the encrypt/decrypt Command Line Interfaces are successfully implemented.
## Object Oriented Programming: 4
> A `cryptable` module was implemented to house the `encrypt` and `decrypt` behavior. Inheritence was not used as it didn't make sense based on the interacion pattern for this program. Specific `encrypt` and `decrypt` methods were left in the `Enigma` class to follow the interaction pattern provided, as well as to help the logic flow. Code is DRY and follows SRP.
## Ruby Conventions and Mechanics: 4
> Code is neat, properly indented, and variable names make sense and are easy to understand. 100% of methods are under 7 lines of code. Enumerables used are best choice for each application.
## Test Driven Development: 3.5
> Tests follow interaction pattern and most tests were written before methods, and all methods were written and refined using pry. Stubs were used to help test methods that use randomness. Test coverage metrics are at 100%.
## Version Control: 4
 > over 50 commits with standardized naming conventions  
   
 > 13 pull requests with descriptions regarding updates or checkpoints reached with each merge