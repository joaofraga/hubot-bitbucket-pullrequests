# Hubot Bitbucket Pull Requests

List all opened Pull Requests of selected repositories

## Features

* List all Pull Requests of all selected repositories
* List Pull Requests of an unique selected repository

## Installation

In your hubot directory, run:

`npm install hubot-bitbucket-pullrequests --save`

Then add *hubot-bitbucket-pullrequests* to your external-scripts.json:

```json
["hubot-bitbucket-pullrequests"]
```

## Configuration

Set the following environment settings:

`HUBOT_BITBUCKET_REPOSITORIES=owner/repo,owner/repo` with repositories which you want to list open Pull Requests.
`HUBOT_BITBUCKET_AUTH_USER=your_username` with your BitBucket username login.
`HUBOT_BITBUCKET_AUTH_PASS=your_password` with your BitBucket password login.

## Commands

```
hubot list pull-requests - List pull requests of all repositories
hubot list pull-requests for <repository-slug> - List pull request of a selected repository
```
