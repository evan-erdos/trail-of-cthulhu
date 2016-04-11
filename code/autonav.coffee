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


### DOM ###
site = "http://bescott.org/" # domain name, localhost:4000
baseurl = "trail-of-cthulhu/" # subdomain


### Helper Functions ###
String::startsWith ?= (s) -> @slice(0,s.length)==s
String::endsWith   ?= (s) -> s=='' || @slice(-s.length)==s

types =
    scene:
        name: 'Scene'
        up: 'Back to Current Sequence'
        url: "../"
    seq:
        name: 'Sequence'
        up: 'Back to Current Act'
        url: "../"
    act:
        name: 'Act'
        up: 'Table of Contents'
        url: "#{site}#{baseurl}/"


### `AutoNav`
#
# main class
###
class AutoNav
    constructor: ->
        @url = document.URL
        [@act,@seq,@scene] = @url.match /act-(\d|end)|seq-(\d|end)|scene-(\d|end)/g
        @act = @act?.match /\d|end/
        @seq = @seq?.match /\d|end/
        @scene = @scene?.match /\d|end/
        @type = switch
            when (@act && @seq && @scene) then types.scene
            when (@act && @seq) then types.seq
            when (@act) then types.act
        [@prev,@next] = @getLink(@type,+@act,+@seq,+@scene)
        @createNavLinks(@type,@prev,@next)


    createNavLinks: (type,prev,next) ->
        prevLink = @createLink("Previous #{type.name}", prev) if prev?
        nextLink = @createLink("Next #{type.name}", next) if next?
        autonavs = document.getElementsByClassName 'autonav'
        for autonav in autonavs
            div = document.createElement 'div'
            text = @createLink(type.up,type.url)
            text = "#{prevLink} • #{text}" if prev?
            text += " • #{nextLink}" if next?
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
        nn = 0 if (nn=='end')
        prev = "../scene-#{pn}/"
        next = "../scene-#{nn}/"
        link = @getSeqLink(act,seq)
        prev = "../#{link.prev}scene-#{pn}/" if link.prev?
        next = "../#{link.next}scene-#{nn}/" if link.next?
        prev = null if (scene==0 && seq==0 && act==0)
        next = null if (scene=='end' && seq=='end' && act==3)
        return [prev,next]


    getSeqLink: (act,seq) ->
        pn = seq - 1
        nn = seq + 1
        pn = 'end' if (pn<0)
        nn = 0 if (seq=='end')
        prev = "../seq-#{pn}/"
        next = "../seq-#{nn}/"
        link = @getActLink(act)
        prev = "../#{link.prev}seq-#{pn}/" if link.prev?
        next = "../#{link.next}seq-#{nn}/" if link.next?
        prev = null if (seq==0 && act==0)
        next = null if (seq=='end' && act==3)
        return [prev,next]


    getActLink: (act) ->
        prev = "../act-#{act-1}/"
        next = "../act-#{act+1}/"
        prev = null if (act==0)
        next = null if (act==3)
        return [prev,next]


    createLink: (text,link) -> "<a href='#{link}'>#{text}</a>"


autonav = new AutoNav()









