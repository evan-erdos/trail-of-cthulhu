---
---


### `Inkwell`
#
# A little script which embeds screenplays in websites.
#
# Ben Scott
# <bescott@andrew.cmu.edu>
# 2016-03-19
###

'use strict' # just like JavaScript


### const ###
url_regex =
    ///
    \b((?:[a-z][\w-]+:
        (?:/{1,3}|[a-z0-9%])
        | www\d{0,3}[.]
        |[a-z0-9.\-]+[.][a-z]{2,4}/)
    (?: [^\s()<>]+
    |\(([^\s()<>]+|(\([^\s()<>]+\)))*\))+
        (?:\(([^\s()<>]+|(\([^\s()<>]+\)))*\)
    | [^\s`!()\[\]{};:'".,<>?«»“”‘’]))
    ///i

### DOM ###
site = "http://bescott.org" # domain name, http://localhost:4000
baseurl = "/inkwell" # subdomain


### Helper Functions ###
String::startsWith ?= (s) -> @slice(0,s.length)==s
String::endsWith   ?= (s) -> s=='' || @slice(-s.length)==s
zip = () ->
  lengthArray = (arr.length for arr in arguments)
  length = Math.min(lengthArray...)
  for i in [0...length]
    arr[i] for arr in arguments

### Options ###
localFountain = false


### `Inkwell`
#
# Finds to-be-formatted elements on the page, and renders them.
###
class Inkwell
    constructor: ->
        @parent = null
        if (localFountain)
            script = document.scripts[document.scripts.length-1]
            @parent = script.parentElement
            id = @parent.id
            if id==""
                div = script.previousSibling
                text = div.innerHTML
                @parent.removeChild(div)
                @process(text)
            else @load(id, @getURL(id))
        else @processAll(document.getElementsByTagName("pre"))


    ### `processAll`
    #
    # finds all pre tags in the document, and renders them
    ###
    processAll: (elements) ->
        pres = []
        for pre in elements
            text = pre.innerHTML
            @parent = document.createElement 'div'
            @parent.className = "screenplay"
            pres.push pre
            pre.parentElement.appendChild(@parent)
            @process(text)
        pre.parentElement.removeChild(pre) for pre in pres


    ### `isFountainHead`
    #
    # determine if a given line is a fountain block
    ###
    isFountainHead: (line) ->
        return unless (line? && line.length>0)
        return (line.toUpperCase()==line)


    ### `createHeader`
    #
    # create a scene header / slugline, return it
    ###
    createHeader: (lines) ->
        h2 = document.createElement 'h2'
        h2.className = "full-slugline"
        h2.appendChild(document.createTextNode(lines))
        return h2


    ### `createCharacter`
    #
    # creates a dl for character / dialogue blocks
    ###
    createCharacter: (lines) ->
        dl = document.createElement 'dl'
        dt = document.createElement 'dt'
        dt.className = "character"
        dt.appendChild(
            document.createTextNode(lines.shift()))
        dd = document.createElement('dd')
        dd.className = "dialogue"
        for line in lines
            text = document.createTextNode(line+" ")
            if (line.startsWith('(') && line.endsWith(')'))
                italic = document.createElement('i')
                italic.className = "parenthetical"
                italic.appendChild(
                    document.createElement("br"))
                italic.appendChild(text)
                dt.appendChild(italic)
            else dd.appendChild(text)
        dl.appendChild(dt)
        dl.appendChild(dd)
        return dl


    ### `createAction`
    #
    # creates a paragraph for action blocks
    ###
    createAction: (lines) ->
        p = document.createElement 'p'
        p.className = "action"
        for line in lines
            text = document.createTextNode("#{line} ")
            p.appendChild(text)
        return p


    ### `createFountain`
    #
    # creates the appropriate fountain block from the input
    ###
    createFountain: (lines) ->
        return unless (lines? && lines.length>0)
        slugline = /(INT|EXT)(ERIOR)?[\.,]?/
        character = /[ABCDEFGHIJKLMNOPQRSTUVWXYZ\s]+/
        if (@isFountainHead(lines[0]))
            if (slugline.test(lines[0]))
                return @createHeader(lines)
            if (character.test(lines[0]))
                return @createCharacter(lines)
        else return @createAction(lines)


    ### `process`
    #
    # creates the appropriate fountain block from the input
    ###
    process: (data) ->
        return unless data?
        data = data.replace /<\/?code>/g, ""
        data = data.replace /<\/?p>/g, "\n"
        data = data.replace /\n\n+/g, "\n\n"
        data = data.replace /&nbsp;/g, " "
        data = data.replace /<\/?br>/g, "\n"
        paragraphs = data.split "\n\n"
        for paragraph in paragraphs
            lines = paragraph.split "\n"
            elem = @createFountain(lines)
            @parent.appendChild(elem) if elem?


    ### `load`
    #
    # get `blob` from an XMLHttp request,
    # and `read` it after it loads
    ###
    load: (id, url) ->
        xhr = new XMLHttpRequest()
        xhr.open('GET',url,true)
        xhr.responseType = 'blob'
        xhr.onload = () =>
            if (xhr.status==200)
                blob = new Blob(
                    [xhr.response]
                    {type: 'text'})
                reader = new FileReader()
                reader.addEventListener "loadend", (event) =>
                    data = event.target.result
                    error = event.target.error
                    @process(data) if error==null
                reader.readAsText(blob)
        xhr.send()


    ### `getURL`
    #
    # determines if `url` is local in a crude and simple way
    ###
    getURL: (url) ->
        return url if (url.match(url_regex))
        return "#{site}#{baseurl}/scenes/#{url}.fountain"




inkwell = new Inkwell()








