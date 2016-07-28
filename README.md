# PoGoBotFarm

To check the service: [http://ispokemongodownornot.com/](http://ispokemongodownornot.com/)

Login generation:
[http://www.gunof.net/](http://www.gunof.net/)

Pwd generation:
[https://identitysafe.norton.com/fr/password-generator](https://identitysafe.norton.com/fr/password-generator#)

Commande de lancement du bot: `forever --spinSleepTime 300000 -c python pokecli.py -u <username> -p <password> -l <location> -lc -w <speed> -k  <google_map_key>`

# script
```
sh ./start-bot.sh -u=<username> -p=<password> -l=<location>
```


# environnement
```
apt-get update
apt-get upgrade
apt-get install -y curl git-all nodejs build-essential
curl -sL https://bootstrap.pypa.io/get-pip.py | python
curl -sL https://deb.nodesource.com/setup | bash -
pip install virtualenv
npm install -g forever
```

# appli
```
git clone -b master https://github.com/PokemonGoF/PokemonGo-Bot
cd PokemonGo-Bot
virtualenv .
source bin/activate
pip install -r requirements.txt
git submodule init
git submodule update
forever --spinSleepTime 300000 -c python pokecli.py -u <username> -p <password> -l <location> -lc -w <speed> -k  <google_map_key>
```

# deployement
https://www.chef.io/chef/? docker ?
