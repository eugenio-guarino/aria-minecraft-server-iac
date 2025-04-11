# AriA

### Minecraft Version: 1.19.2  
### Forge Version: 43.5.0

# Windows Setup Guide

1. **Download and Install SKLauncher**
   - Download SKLauncher from [here](https://skmedix.pl/)
   - Go through the setup process to install the game.

2. **Install Minecraft Forge**
   - Minecraft Forge is required to play on the server. Follow these steps:
     - Download Minecraft Forge from [here](https://adfoc.us/serve/sitelinks/?id=271228&url=https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.2-43.5.0/forge-1.19.2-43.5.0-installer.jar).
     - After the download is complete, open the downloaded `.jar` file.  
       *(Important: make sure Java is installed on your PC)*
     - Select "Install client" and proceed with the installation.

3. **Install Mods**
   - Press `Win + R` and type `%appdata%`.
   - Go to the `.minecraft` folder and create a folder called `mods` if there isn't already one.
   - Download the `mods.zip` file from [here](https://1drv.ms/f/c/065897bd642782c8/EjrP1DBPqGpLsBY0MtgaA4QBK0Mirq6CyuJGV2kWlkpRyw?e=64qIxT). 
   - Extract the contents of the archive into the `mods` folder:
     - Press `Win + R`.
     - Type `%appdata%` and press Enter.
     - Open the `.minecraft` directory and create the `mods` folder if it doesn’t exist.
     - Extract the contents of the archive into the `mods` folder
   - Open your installed launcher, select the Forge profile, and press "Play".

4. **Turn On AriA Server**  
   AriA goes to sleep whenever it is not in use. To turn it on, follow these steps:
   - Download the server activator from [here](https://github.com/eugenio-guarino/aria-minecraft-server-windows-client/releases/download/v2.0/aria-startup-client.exe).
   - Ignore any warning messages, download the application, and run it.
   - Enter the secret code, which you can find pinned in the Telegram group.
   - Press the "Start MC server" button.
   - Wait for the IP address of the server to be provided in the Telegram group.

5. **Connect to AriA Server**
   - Open your Minecraft game.
   - In Minecraft, go to "Multiplayer" and select "Direct connection".
   - Enter the IP address, which you can find in the Telegram group chat.
   - Happy gaming! 🚀

6. **Recommended: Download and Install AriA's Resource Packs**
   - Download the `resourcepacks.zip` file from [here](https://1drv.ms/f/c/065897bd642782c8/EjrP1DBPqGpLsBY0MtgaA4QBK0Mirq6CyuJGV2kWlkpRyw?e=64qIxT). 
   - Extract the contents of the archive into the `resourcepacks` folder:
     - Press `Win + R`.
     - Type `%appdata%` and press Enter.
     - Open the `.minecraft` directory and create the `resourcepacks` folder if it doesn’t exist.
     - Extract the contents of the archive into the `resourcepacks` folder.

   Then go to the Resource Packs section in your game client and arrange them in this order (top to bottom):

   1. Foliage  
   2. Excalibur-BiomesOPlenty  
   3. Excalibur_V1.19.4  
   4. Supplementaries Generated  
   5. Default  
   6. Mod resources  
   7. Exotic birds

7. **Recommended: xaeroworldmap Reset Fix**
   - Press `Win + R` and type `%appdata%`.
   - Go to the `.minecraft` folder, then open the `config` folder.
   - Find the file named `xaeroworldmap.txt` and open it with a text editor.
   - Change the following line:

     ```txt
     differentiateByServerAddress:true
     ```

     to:

     ```txt
     differentiateByServerAddress:false
     ```

   - Save the file. Now the map won’t reset when AriA changes its IP address.
