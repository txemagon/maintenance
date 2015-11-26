#users.sh

# List all home directories of human accounts.
home_dirs () {
   getent passwd | cut -d: -f6 | grep /home
}