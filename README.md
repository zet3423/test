



IMPORTANT! YOUR BUILD WILL FAIL IF YOU DO NOT LINK YOUR PROJECT TO AWS BACKEND!


Follow these steps to link it:


1. Install Node.JS -> https://nodejs.org/en/download/
2. Once you have Node.JS installed, download Amplify CLI
	To do that simply type this in your terminal "npm install -g @aws-amplify/cli"

3. Download this project and save it in a your hard drive if you have not already ( ex: Desktop )

4. Change directory to the Fitness360 Project Folder in terminal. (Wherever you saved it to)
	Example:  "cd desktop/fitness360" 

5. Once you are in the working Directory , run the command "Amplify init"
6. It will ask if you want to use an existing environment, type Yes.
	Choose the Devenv
7. It will ask if you to choose your default editor, choose your preferred editor.
8. It will prompt you if you want to setup new user, Type No.
9. the AWS dashboard will open, it'll ask for AccessKeyID & SecretAccessKey
	Find this in our google drive document, and paste it here.
10. It'll prompt you for region, Pick US-East-1
11. Project is now Initialized and connected to the AWS backend.




Note: Work on Fitness360.xcworkspace, not Fitness360.xcodeproj
