#!/bin/bash

# Set the username and group variables
username=$1
group=devops
group_id=2002

# Check if the user is already present on the system
if id "$username"; then
  echo "User with $username is present"
else
  # Create the user and add them to the 'devops' group
  useradd -g "$group" -G "$group" "$username"
  
  # Get the user information
  user_info=$(id "$username")
  
  # Extract the information from the user_info string
  username=$(echo "$user_info" | grep -oP '(?<=uid=)\w+(?=\()')
  user_id=$(echo "$user_info" | grep -oP '(?<=uid=)\d+')
  primary_group_name=$(echo "$user_info" | grep -oP '(?<=groups=)\w+')
  primary_group_id=$(echo "$user_info" | grep -oP '(?<=gid=)\d+')
  secondary_group_name=$(echo "$user_info" | grep -oP '(?<=,)\w+(?=\()')
  secondary_group_id=$(echo "$user_info" | grep -oP '(?<=,)\d+')
  home_directory=$(echo "$user_info" | grep -oP '(?<=home=)\S+')
  login_shell=$(echo "$user_info" | grep -oP '(?<=shell=)\S+')
  
  # Print the user information
  echo "Username = $username"
  echo "User_ID = $user_id"
  echo "Primary_Group_Name = $primary_group_name"
  echo "Primary_Group_ID = $primary_group_id"
  echo "Secondary_Group_Name = $secondary_group_name"
  echo "Secondary_Group_ID = $secondary_group_id"
  echo "User_Home_Directory = $home_directory"
  echo "User_Login_Shell = $login_shell"
fi

