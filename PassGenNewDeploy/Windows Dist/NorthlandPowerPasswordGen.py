import os

def passgen():
	end = True
	while end == True:
		name = input("What is the end user's name?: ")
		username = input("What is the username?: ")
		filename = input("What is the file name of where you want the password to be stored?: ")
		first_num = username[0]
		last_num = username[len(username) - 1]
		user_pass = [name, ' ', '-', ' ', username + str(ord(first_num)) + str(ord(last_num)), '\n']
		if os.path.exists(filename):
			userfile = open(filename, "a")
			userfile.writelines(user_pass)
			userfile.close()
		else:
			userfile = open(filename, "w")
			userfile.writelines(user_pass)
			userfile.close()
		print('Done! Password has been added to your text file!')
		end = input("Done? (y/n): ")
		if end == 'y':
			end = False
		else:
			end = True

passgen()