---
---


### `AutoNav`
#
# Automatically links to adjacent / sequential story pages.
#
# Ben Scott
# <bescott@andrew.cmu.edu>
# 2016-04-09
###

'use strict' # just like JavaScript

### variables ###
types =
    scene:
        name: 'Scene'
        up: 'Back to Current Sequence'
    seq:
        name: 'Sequence'
        up: 'Back to Current Act'
    act:
        name: 'Act'
        up: 'Story Outline'


### `AutoNav`
#
# main class
###
class AutoNav
    constructor: (acts,sequences) ->
        @url = document.URL
        [@act,@seq,@scene] = @url.match /act-(\d)|seq-(\d)|scene-(\d)/g
        @act = @act?.match(/\d/)[0]
        @seq = @seq?.match(/\d/)[0]
        @scene = @scene?.match(/\d/)[0]
        console.log "#{@act}.#{@seq}.#{@scene}"
        @type = switch
            when @act? && @seq? && @scene? then types.scene
            when @act? && @seq? then types.seq
            when @act? then types.act
        @isEnd = @type == types.scene && document.getElementById("end")
        @isSeqEnd = +@seq==sequences-1
        @isActEnd = +@act==acts-1
        [prev,next] = @getLinks(@type,+@act,+@seq,+@scene)
        prevLink = @createLink("Previous #{@type.name}", prev) if prev?
        nextLink = @createLink("Next #{@type.name}", next) if next?
        autonavs = document.getElementsByClassName 'autonav'
        for nav in autonavs
            div = document.createElement 'div'
            text = @createLink(@type.up,'../')
            text = "#{prevLink} • #{text}" if prev?
            text += " • #{nextLink}" if next?
            div.innerHTML = text
            nav.appendChild div


    getLinks: (type,act,seq,scene) ->
        [prev,next] = [null,null]
        switch type
            when types.scene
                unless (act==0 && seq==0 && scene==0)
                    if (seq==0 && scene==0)
                        prev = "../../../act-#{act-1}/seq-end/scene-end/"
                    else if (scene==0)
                        prev = "../../seq-#{seq-1}/scene-end/"
                    else prev = "../scene-#{scene-1}"
                unless (@isActEnd && @isSeqEnd && @isEnd)
                    if (@isSeqEnd && @isEnd)
                        next = "../../../act-#{act+1}/seq-0/scene-0/"
                    else if (@isEnd)
                        next = "../../seq-#{seq+1}/scene-0/"
                    else next = "../scene-#{scene+1}"
            when types.seq
                unless act==0 && seq==0
                    if seq==0
                        prev = "../../act-#{act-1}/seq-end/"
                    else prev = "../seq-#{seq-1}"
                unless @isActEnd && @isSeqEnd
                    if @isSeqEnd
                        next = "../../act-#{act+1}/seq-0/"
                    else next = "../seq-#{seq+1}"
            when types.act
                unless act==0
                    prev = "../act-#{act-1}/"
                unless @isActEnd
                    console.log @isActEnd
                    next = "../act-#{act+1}/"
        [prev,next]

    createLink: (text,link) -> "<a href='#{link}'>#{text}</a>"


autonav = new AutoNav(4,7)









