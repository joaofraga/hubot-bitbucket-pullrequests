credentials =
  username: process.env.HUBOT_BITBUCKET_AUTH_USER
  password: process.env.HUBOT_BITBUCKET_AUTH_PASS

all_repos = process.env.HUBOT_BITBUCKET_REPOSITORIES.split(",")

class BitBucket
  constructor: (credentials, repos = "") ->
    bitBucket = require 'bitbucket-api'
    @client = bitBucket.createClient(credentials)
    @repositories = repos

  summary: (msg, repo) ->
    for repository in @repositories
      @getRepository repository, (err, repo) ->
        # Repository logic comes here
        # TODO: think some way to easily load PRs and show on screen

  getRepository: (repository, cb) ->
    owner = repository.split('/')[0]
    slug = repository.split('/')[1]
    @client.getRepository {slug: slug, owner: 'owner'}, (err, repo) ->
      cb(err, repo)

module.exports = new BitBucket(credentials, all_repos)
