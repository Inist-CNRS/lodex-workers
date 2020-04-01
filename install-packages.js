const { packages } = require('./config.json');
const npm = require('npm-programmatic');

console.log("Installing packages from config.json");
npm.install(packages || [], { output: true,  cwd: __dirname })
    .then(() => console.log("All packages installed."))
    .catch((e) => console.error('Unable to install package', e));
