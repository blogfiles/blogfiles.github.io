sudo apt-get update
sudo apt-get upgrade
# Enable the package install over https
sudo apt-get install apt-transport-https
# Adding the Plex GPG key
sudo curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -
# Add the Plex package sources to the apt. 
# It basically creats a file with the deb ...
sudo echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list
# We’re going to update our package list and install from the newly added repository.
sudo apt-get update
sudo apt-get install plexmediaserver