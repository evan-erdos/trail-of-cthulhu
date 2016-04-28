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
    constructor: ->
        @url = document.URL
        [@act,@seq,@scene] = @url.match /act-(\d)|seq-(\d)|scene-(\d)/g
        @act = @act?.match(/\d/)[0]
        @seq = @seq?.match(/\d/)[0]
        @scene = @scene?.match(/\d/)[0]
        @type = switch
            when (@act && @seq && @scene) then types.scene
            when (@act && @seq) then types.seq
            when (@act) then types.act
        @scene = 'end' if (@type == types.scene && document.getElementById("end"))
        console.log @scene if (document.getElementById('end'))
        [@prev,@next] = @getLink(@type,+@act,+@seq,+@scene)
        @createNavLinks(@type,@prev,@next)

    endSceneLink: (seq,scene) ->
        @createLink("Next Scene","../../seq-#{+seq+1}/scene-0/")

    createNavLinks: (type,prev,next) ->
        prevLink = @createLink("Previous #{type.name}", prev) if prev?
        nextLink = @createLink("Next #{type.name}", next) if next?
        autonavs = document.getElementsByClassName 'autonav'
        for autonav in autonavs
            div = document.createElement 'div'
            text = @createLink(type.up,'../')
            text = "#{prevLink} • #{text}" if prev?
            if @scene == 'end'
                text += " • #{@endSceneLink(@seq,@scene)}"
            else text += " • #{nextLink}" if next?
            div.innerHTML = text
            autonav.appendChild div


    getLink: (type,act,seq,scene) ->
        switch type
            when types.scene then return @getSceneLink(act,seq,scene)
            when types.seq then return @getSeqLink(act,seq)
            when types.act then return @getActLink(act)


    getSceneLink: (act,seq,scene) ->
        pn = scene - 1
        nn = scene + 1
        pn = 'end' if (pn<0)
        nn = 0 if (@scene == 'end')
        prev = "../scene-#{pn}/"
        next = "../scene-#{nn}/"
        link = @getSeqLink(act,seq)
        prev = "../#{link.prev}scene-#{pn}/" if link.prev?
        next = "../#{link.next}scene-#{nn}/" if link.next?
        prev = null if (scene==0 && seq==0 && act==0)
        next = null if (scene=='end' && seq==6 && act==3)
        return [prev,next]


    getSeqLink: (act,seq) ->
        pn = seq - 1
        nn = seq + 1
        nn += 1 if (@scene=='end')
        pn = 'end' if (pn<0)
        nn = 0 if (seq==6 || @seq==6)
        prev = "../seq-#{pn}/"
        next = "../seq-#{nn}/"
        link = @getActLink(act)
        prev = "../#{link.prev}seq-#{pn}/" if link.prev?
        next = "../#{link.next}seq-#{nn}/" if link.next?
        prev = null if (seq==0 && act==0)
        next = null if (seq==6 && act==3)
        return [prev,next]


    getActLink: (act) ->
        prev = "../act-#{act-1}/"
        next = "../act-#{act+1}/"
        prev = null if (act==0)
        next = null if (act==3)
        return [prev,next]


    createLink: (text,link) -> "<a href='#{link}'>#{text}</a>"


autonav = new AutoNav()









