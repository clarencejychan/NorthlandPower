import os
import random
import string

def randomcaps(string):
	x = random.randint(0,2)
	if x == 0:
		return (string[0].upper() + string[1:])
	if x == 1:
		return (string[0] + string[1].upper() + string[2:])
	else:
		return (string[0:2] + string[2].upper())

def passgen():
	end = True
	while end == True:
		username = (input("What is the username?: ")).lower()
		if len(username) == 3:
			first_num = username[0]
			number = str(int((((ord(first_num)) + (ord(username[1]))) / 2))) 
			if len(str(number)) < 3:
				user_pass = [username, ' ', '-', ' ', username + number + '0' + random.choice(string.ascii_letters) + '\n'] 
			else:
				user_pass = [username, ' ', '-', ' ', username + number + random.choice(string.ascii_letters) + '\n']
			if os.path.exists('HardwareEncryptionPasswords.txt'):
				userfile = open('HardwareEncryptionPasswords.txt', "a")
				userfile.writelines(user_pass)
				userfile.close()
			else:
				userfile = open('HardwareEncryptionPasswords.txt', "w")
				userfile.writelines(user_pass)
				userfile.close()
			print('Done! Password has been added to your text file!')
			end = input("Done? (y/n): ")
			if end == 'y' or end == 'Y':
				end = False
			else:
				end = True
		else:
			first_num = username[0]
			last_three_of_user = randomcaps(username[1:4])
			number = str(int((((ord(first_num)) + (ord(username[1]))) / 2)))
			if len(str(number)) < 3:
				user_pass = [username, ' ', '-', ' ', first_num + last_three_of_user + number + '0' + random.choice(string.ascii_letters) + '\n'] 
			else:
				user_pass = [username, ' ', '-', ' ', first_num + last_three_of_user + number + random.choice(string.ascii_letters) + '\n']
			if os.path.exists('HardwareEncryptionPasswords.txt'):
				userfile = open('HardwareEncryptionPasswords.txt', "a")
				userfile.writelines(user_pass)
				userfile.close()
			else:
				userfile = open('HardwareEncryptionPasswords.txt', "w")
				userfile.writelines(user_pass)
				userfile.close()
			print('Done! Password has been added to your text file!')
			end = input("Done? (y/n): ")
			if end == 'y' or end == 'Y':
				end = False
			else:
				end = True

passgen()