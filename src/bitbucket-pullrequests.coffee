# Description:
#   BitBucket Pull Requests
#
# Dependencies:
#   None
#
# Commands:
#   hubot list pull-requests - Display opened pull requests
#   hubot list <repository-slug> pull-requests - Display opened pull requests for repository
#
# Author:
#   jgfraga

pullRequests = require './libs/bitbucket'

############################
# Api Methods
############################

ensureConfig = (out) ->
  out "Error: BitBucket Auth username is not specified" if not process.env.HUBOT_BITBUCKET_AUTH_USER
  out "Error: BitBucket Auth password is not specified" if not process.env.HUBOT_BITBUCKET_AUTH_PASS
  out "Error: BitBucket repositories list  is not specified" if not process.env.HUBOT_BITBUCKET_REPOSITORIES
  return false unless (process.env.HUBOT_BITBUCKET_AUTH_USER and process.env.HUBOT_BITBUCKET_AUTH_PASS and process.env.HUBOT_BITBUCKET_REPOSITORIES)
  true

module.exports = (robot) ->
  ensureConfig console.log

  robot.respond /list (\w.+) pull-requests/i, (msg) ->
    pullRequests.summary msg, msg.match[1]

  robot.respond /list pull-requests/, (msg) ->
    pullRequests.summary msg
