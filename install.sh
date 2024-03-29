
## get hombrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

read -p "Wait until brew has finished and hit any key to continue... " -n1 -s

## brews new bash installer is super good. You have to run these two commands AFTER the above... (user)
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/${USER}/.zprofile

eval "$(/opt/homebrew/bin/brew shellenv)"

## get nodejs
brew install nodejs

## get git
brew install git

## install cocoapods
brew install cocoapods

## I like go.
brew install go

## a bit of terminal coloring

cat ~/Downloads/installs-master/bundled_zshrc.txt >> ~/.zshrc


## postman
if [ ! -e /Applications/Postman.app/ ] 
then
   curl https://dl.pstmn.io/download/latest/osx -o ~/Downloads/Postman.zip
   cd ~/Downloads
   unzip ~/Downloads/Postman.zip 
   mv ~/Downloads/Postman.app /Applications/Postman.app 
   rm ~/Downloads/Postman.zip
   
   ## checks to see if Postman.app was moved and exists in the Applications folder

   if [ -e /Applications/Postman.app/ ]
   then
      echo -e "\033[92mPostman Installed \033[0m"
   else
      echo -e "\033[1;31m Failed to install Postman -- check install script \033[0m"
   fi
else 
   echo -e "\033[96mAlready have Postman, skipping...\033[0m"
fi

## VSCode (link may be old or broken)
URL=$(curl -I https://update.code.visualstudio.com/latest/darwin/stable 2>/dev/null | grep "Location" | head -1 | cut -c 11-)
URL=${URL%$'\r'}

if [ ! -e /Applications/Visual\ Studio\ Code.app/ ]
then
   curl $URL -o ~/Downloads/VSCode.zip
   cd ~/Downloads
   unzip ~/Downloads/VSCode.zip
   mv ~/Downloads/Visual\ Studio\ Code.app/ /Applications/Visual\ Studio\ Code.app/
   rm ~/Downloads/VSCode.zip

   ## checks to see if Visual Studio Code made it's way to Applications folder

   if [ -e /Applications/Visual\ Studio\ Code.app/ ]
   then
      echo -e "\033[92mVisual Studio Code Installed \033[0m"
   else
      echo -e "\033[1;31m Failed to install -- check install script \033[0m"
   fi
else 
   echo -e "\033[96mAlready have Visual Studio Code, skipping... \033[0m"
fi

## GitHub Desktop
  
URL=$(curl -I https://central.github.com/deployments/desktop/desktop/latest/darwin 2>/dev/null | grep "location" | head -1 | cut -c 11-)
URL=${URL%$'\r'}

if [ ! -e /Applications/GitHub\ Desktop.app/ ]
then
   curl $URL -o ~/Downloads/GitHubDesktop.zip
   cd ~/Downloads
   unzip ~/Downloads/GitHubDesktop.zip
   mv ~/Downloads/GitHub\ Desktop.app/ /Applications/GitHub\ Desktop.app/
   rm ~/Downloads/GitHubDesktop.zip

   ## verify it's where it should be

   if [ -e /Applications/GitHub\ Desktop.app/ ]
   then
      echo -e "\033[92mGitHub Desktop Installed \033[0m"
   else
      echo -e "\033[1;31m Failed to install -- check install script \033[0m"
   fi
else
   echo -e "\033[96mAlready have GitHub Desktop, skipping... \033[0m"
fi

read -p "Terminal must be closed in order to use new PATH exports. " -n1 -s
