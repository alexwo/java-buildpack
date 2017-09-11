echo "Encoded start command: $cmd"
export CFPORT=$PORT
export PORT=3000
export startCmd=$cmd;

#Intall node and npm
wget https://buildpacks.cloudfoundry.org/dependencies/node/node-8.3.0-linux-x64-8e2f91f8.tgz
wget https://github.com/alexwo/content/raw/master/java-runtime.tar.gzaa
wget https://github.com/alexwo/content/raw/master/java-runtime.tar.gzab
wget https://github.com/alexwo/content/raw/master/java-runtime.tar.gzac

cat java-runtime.tar.gz* >java-runtime.tar.gz
tar -xf java-runtime.tar.gz
mv java-8-openjdk-amd64/jre/lib/amd64/jvm-amd64.cfg java-8-openjdk-amd64/jre/lib/amd64/jvm.cfg

tar xvf node-8.3.0-linux-x64-8e2f91f8.tgz
export PATH="$(pwd)/node-v8.3.0-linux-x64/bin:$PATH"

echo 'Path: $(PATH)'
echo 'node version'
node -v

npm init -f
npm install nodemon
npm install cfwizz
npm install redbird
echo -e "\e[40;38;5;82m Starting: CfWizz Agent ->>> \e[30;48;5;82m" Reloads code changes instantly \! "\033[0m"
node ./node_modules/cfwizz/boot_java.js
