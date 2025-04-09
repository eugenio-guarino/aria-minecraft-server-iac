### Versione Minecraft: 1.19.2  
### Versione Forge: 43.5.0

# Guida all'Installazione per Windows

1. **Scarica e installa SKLauncher**
   - Scarica SKLauncher da [qui](https://skmedix.pl/)
   - Segui il processo di installazione per completare l’installazione del gioco.

2. **Installa Minecraft Forge**
   - Minecraft Forge è necessario per giocare sul server. Segui questi passaggi:
     - Scarica Minecraft Forge da [qui](https://adfoc.us/serve/sitelinks/?id=271228&url=https://maven.minecraftforge.net/net/minecraftforge/forge/1.19.2-43.5.0/forge-1.19.2-43.5.0-installer.jar).
     - Una volta completato il download, apri il file `.jar` scaricato.  
       *(Importante: assicurati di avere Java installato sul tuo PC)*
     - Seleziona "Install client" e procedi con l’installazione.

3. **Installa le Mod**
   - Premi `Win + R` e digita `%appdata%`.
   - Vai nella cartella `.minecraft` e crea una cartella chiamata `mods` se non esiste già.
   - Scarica il file `mods.zip` da [qui](https://1drv.ms/f/c/065897bd642782c8/EjrP1DBPqGpLsBY0MtgaA4QBK0Mirq6CyuJGV2kWlkpRyw?e=64qIxT). 
   - Estrai il contenuto dell’archivio nella cartella `mods`:
     - Premi `Win + R`.
     - Digita `%appdata%` e premi Invio.
     - Apri la cartella `.minecraft` e crea la cartella `mods` se non esiste.
     - Estrai il contenuto dell’archivio nella cartella `mods`.
   - Apri il launcher installato, seleziona il profilo Forge e premi "Play".

4. **Accendi il Server AriA**  
   AriA va in sospensione quando non viene utilizzato. Per riattivarlo, segui questi passaggi:
   - Scarica l’attivatore del server da [qui](https://github.com/eugenio-guarino/aria-minecraft-server-windows-client/releases/download/v2.0/aria-startup-client.exe).
   - Ignora eventuali messaggi di avviso, scarica l’applicazione ed eseguila.
   - Inserisci il codice segreto, che puoi trovare fissato nel gruppo Telegram.
   - Premi il pulsante "Start MC server".
   - Attendi che venga fornito l’indirizzo IP del server nel gruppo Telegram.

5. **Connettiti al Server AriA**
   - Avvia Minecraft.
   - In Minecraft, vai su "Multigiocatore" e seleziona "Connessione diretta".
   - Inserisci l’indirizzo IP, che puoi trovare nella chat del gruppo Telegram.
   - Buon divertimento! 🚀

6. **Consigliato: Scarica e installa i Resource Pack di AriA**
   - Scarica il file `resourcepacks.zip` da [qui](https://1drv.ms/f/c/065897bd642782c8/EjrP1DBPqGpLsBY0MtgaA4QBK0Mirq6CyuJGV2kWlkpRyw?e=64qIxT). 
   - Estrai il contenuto dell’archivio nella cartella `resourcepacks`:
     - Premi `Win + R`.
     - Digita `%appdata%` e premi Invio.
     - Apri la cartella `.minecraft` e crea la cartella `resourcepacks` se non esiste.
     - Estrai il contenuto dell’archivio nella cartella `resourcepacks`.

   Poi vai nella sezione Resource Pack nel client di gioco e disponili in quest’ordine (dall’alto verso il basso):

   1. Terrrs-Animals-Redone  
   2. FreshAnimations  
   3. more_villagers_RP  
   4. GloriousGlowstone  
   5. Foliage  
   6. Excalibur-BiomesOPlenty  
   7. Excalibur_V1.19.4  
   8. Supplementaries Generated  
   9. Default  
   10. Mod resources  
   11. Exotic birds

7. **Consigliato: Fix per il reset di xaeroworldmap**
   - Premi `Win + R` e digita `%appdata%`.
   - Vai nella cartella `.minecraft`, poi apri la cartella `config`.
   - Trova il file chiamato `xaeroworldmap.txt` e aprilo con un editor di testo.
   - Modifica la seguente riga:

     ```txt
     differentiateByServerAddress:true
     ```

     in:

     ```txt
     differentiateByServerAddress:false
     ```

   - Salva il file. Ora la mappa non si resetterà più quando AriA cambia indirizzo IP.
