timeago = require 'timeago'

credentials =
  username: process.env.HUBOT_BITBUCKET_AUTH_USER
  password: process.env.HUBOT_BITBUCKET_AUTH_PASS

all_repos = process.env.HUBOT_BITBUCKET_REPOSITORIES.split(",")

class BitBucket
  constructor: (credentials, repos = "") ->
    bitBucket = require 'sand-bucket'
    @client = bitBucket.createClient(credentials)
    @repositories = repos

  summary: (msg, repo) ->
    _repositories = if repo? then [repo] else @repositories
    for repository in _repositories
      @getRepository repository, (err, repo) ->
        # Repository logic comes here
        # TODO: think some way to easily load PRs and show on screen
        repo.pullRequests().getAll (err, pullRequests) ->
          pullRequestsSize = pullRequests.values.length
          message = ":coffee: *#{repo.owner}/#{repo.slug}* | [#{pullRequestsSize}] _pull requests_\n\n\n"
          if pullRequestsSize > 0
            for pullRequest in pullRequests.values
              message += "\n"
              message += "> ##{pullRequest.id}\n"
              message += "> #{pullRequest.title}\n"
              message += "> by #{pullRequest.author.username} _#{timeago(new Date(pullRequest.created_on))}_\n"
              message += "> #{pullRequest.links.self.href}\n\n"
          else
            message += "> :clap: :clap: :clap: :clap: :clap: :clap: :clap: \n\n"

          msg.send message

  getRepository: (repository, cb) ->
    owner = repository.split('/')[0]
    slug = repository.split('/')[1]
    @client.getRepository {slug: slug, owner: owner}, (err, repo) ->
      cb(err, repo)

module.exports = new BitBucket(credentials, all_repos)
