cp = require('child_process');

module.exports = (robot) ->
  robot.respond /deploy/i, (msg) ->
    deploy = cp.spawn('./git-across.sh', ['run'])
    emit = (data) ->
      msg.send(m) for m in data.toString().split("\n") when m.length > 0
    deploy.stdout.on('data', emit)
    deploy.stderr.on('data', emit)
