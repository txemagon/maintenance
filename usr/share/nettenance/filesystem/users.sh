#users.sh

# List fields of passwd
show_field() {
	getent passwd | grep /home | cut -d: -f$1 
}

# List all users of human accounts.
show_users () {
   show_field 1
}

# List all names of human accounts.
# Pay attention. Some users may not have defined name.
show_names () {
   show_field 5 | cut -d, -f1 | sed -e /^$/d 
}

# List all home directories of human accounts.
home_dirs () {
   show_field 6
}