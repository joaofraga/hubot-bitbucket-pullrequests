
describe 'hubot-bitbucket-pullrequests', ->

  describe 'respond to command', ->
    it 'respond to `hubot list pull-requests`'
    it 'respond to `hubot list pull-requests for <repository>`'

  describe 'connect to bitbucket api', ->
    it 'responds with all pull requests'
    it 'responds with selected pull request'
