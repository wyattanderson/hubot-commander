fuzzy = require 'fuzzy'
{ puts, inspect } = require 'util'
_ = require 'underscore'

module.exports = (robot) ->
    class Commander
        constructor: (@robot) ->
            @commands = {}

            @robot.respond /(.*)/, @handleCommand

        handleCommand: (msg) =>
            [ fullText, cmdLine ] = msg.match
            args = cmdLine.split /\s+/

            @dispatch msg, args, 0

        dispatch: (msg, args, index, base = @commands) ->
            if not args[index]?
                msg.reply @commandsAtLevel base
                return

            keys = _.keys base
            results = fuzzy.filter args[index], keys
            if results.length is 0 or results[0].score is 0
                msg.reply @commandsAtLevel base
                return

            if results.length is 1 and base[results[0].original]?
                { original, score } = results[0]
                if typeof base[original] is 'object'
                    @dispatch msg, args, index + 1, base[original]
                else
                    newArgs = args[index + 1...args.length]
                    newMatch = []
                    newMatch[index + 1 + i] = arg for arg, i in newArgs
                    msg.match = newMatch

                    base[original]? msg
        
        push: (args) ->
            [module, command, callback] = args
            if not callback? and command?
                @commands[module] = command
            else
                moduleCommands = @commands[module] || @commands[module] = {}
                moduleCommands[command] = callback

        commandsAtLevel: (base) ->
            "available commands: #{_.keys(base).join ", "}"

    newCommander = new Commander robot
    if robot.commander?
        for reg in robot.commander
            Commander::push.call newCommander, reg

    robot.commander = newCommander
