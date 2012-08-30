# Deploy from Github to Heroku with Hubot

NOTE WARNING DANGER ETC: You have to give heroku (via environment variables) your public and private github deploy key for the repository you're deploying. Make sure you understand that this means that heroku (themselves, or if their data is stolen) could access your github repo. OK? Proceed!

## Usage

### 1. Copy

Copy the `git-across.sh` file to the root of your hubot. Copy `github-to-heroku.coffee` to your `scripts` folder in your hubot.


### 2. Auth

Generate a key with `ssh-keygen`. **Dont** set a passphrase.

Upload it to github under your project's Deploy Key field.

We'll call this `my-github-deploy-ssh-key` from now on.

Send the public key to heroku:

    heroku keys:add my-github-deploy-ssh-key.pub

### 3. Config

Export the following config vars to heroku:

    GITHUB_KEY="`cat my-github-deploy-ssh-key`"
    GITHUB_PUBLIC_KEY="`cat my-github-deploy-ssh-key.pub`"
    GITHUB_URL="git@github.com:myproject/myrepo.git"
    HEROKU_URL="git@heroku.com:myherokurepo.git"

### 4. Deploy and Use

Commit the script changes to your hubot and push him to heroku. Then, in campfire:

    hubot deploy

Tada!
