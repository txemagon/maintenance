# hash.sh

# functions for handling hashes.

function show_hash {
    # eval string into a new assocociative array
    eval "declare -A func_assoc_array="${1#*=}
    # proof that array was successfully created
    declare -p func_assoc_array
}