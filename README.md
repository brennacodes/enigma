# enigma
The Enigma Cipher is an encryption algorithm that was used during World War II, and cracked by Alan Turing. You can learn more about Enigma Cipher at [the link here](https://en.wikipedia.org/wiki/Enigma_machine#:~:text=The%20Enigma%20machine%20is%20a,branches%20of%20the%20German%20military).

The version here was created in Ruby for Turing School's back-end engineering Module 1 final project. 

## Some notes...
- the program accepts text files to be encrypted  via the command line 
- decryption is done automatically using the previous encryption key 
- special characters are accepted but are not encrypted

## To Encrypt a message
- download or clone this repo (ex. `git clone paste_name_of_repo_here`)
- navigate to the repo folder on your computer
- add any text you would like to encrypt to the file `message.txt`
- from your terminal, run the following command: 
    `ruby ./lib/encrypt.rb message.txt encrypted.txt`
- if you'd like to choose your own encryption key, simply choose a 5-digit number and provide it at the end of the command, like so:
    `ruby ./lib/encrypt.rb message.txt encrypted.txt 12345`
- you can also add an optional 6-digit date argument for the encryption method like so:
    `ruby ./lib/encrypt.rb message.txt encrypted.txt 12345 123122`    
- to decrypt the message, type the command below into  your terminal:
    `ruby ./lib/decrypt.rb encrypt.txt decrypted.txt`
- if you want to use specific decryption key and date, type the at the end of the command above (the format should be similar to the encryption command with key and date arguments)    
- the encrypted or decrypted message can be found in the corresponding text file
- Don't for get to save the **key** and **date** values that are returned in your terminal, as this is required to decrypt/encrypt the message

# Self-Assessment
## Functionality: 3
- Encrypt and Decrypt methods are complete, and the encrypt/decrypt Command Line Interfaces are successfully implemented.
## Object Oriented Programming: 4
- A `cryptable` module to house the #encrypt and #decrypt behavior has been implemented. Specific `encrypt` and `decrypt` methods were left in the `Enigma` class to follow the interaction pattern provided, as well as to help the logic flow.
## Ruby Conventions and Mechanics: 4
- Code is neat, properly indented, and variable names are easy to understand. 100% of methods are under 10 lines of code, with 99% being under 7 lines. Enumerables used are best choice for each application.
## Test Driven Development: __
- Tests follow interaction pattern and most tests were written before methods. Methods were written utilizing tests, pry, and test coverage metrics are above __%.
## Version Control 4
- > 40 commits with standardized naming conventions
- > 4 pull requests with details regarding checkpoints reached with each merge