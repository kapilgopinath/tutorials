require 'crypt/blowfish'

unless ARGV[0]
	puts "Usage: ruby encrypt.rb <filename.ext>"
	puts "Example: ruby encrypt.rb secret.stuff"
	exit
end

#take in the file name to encrypt as an argument 
filename = ARGV[0].chomp
puts filename
c = "Endcrypted_#{filename}"

if File.exists?(c)
	puts "File already exists."
	exit
end

print 'Enter your encryption key (1-56 bytes): '
kee = gets.chomp

begin
	blowfish = Crypt::Blowfish.new(kee)
	blowfish.encrypt_file(filename.to_str, c)
	puts 'Encryption SUCCESS!'
rescue Exception => e
	puts "An error occurred during the encryption: \n #{e}"
end 