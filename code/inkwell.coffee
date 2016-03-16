---
---

# Ben Scott
# <bescott@andrew.cmu.edu>
# 2016-03-15

### Inkwell
#
# A web parser for the Fountain markup language
###

'use strict' # just like JavaScript


### DOM ###
site = "localhost:4000"
baseurl = "/trail-of-cthulhu"


### `Inkwell`
#
# Main class for Inkwell snippets
###
class Inkwell
    constructor: ->
        inputs = document.getElementsByClassName "screenplay"
        values = (input.id for input in inputs)
        @load(value) for value in values


    ### `isFountainHead`
    #
    # Determine if a given line is a fountain block
    ###
    isFountainHead: (line) ->
        return unless (line? && line.length>0)
        return (line.toUpperCase()==line)


    ### `createHeader`
    #
    # create a scene header / slugline, return it
    ###
    createHeader: (lines) ->
        h2 = document.createElement('h2')
        h2.className = "full-slugline"
        h2.appendChild(document.createTextNode(lines))
        return h2


    ### `createCharacter`
    #
    # creates a dl for character / dialogue blocks
    ###
    createCharacter: (lines) ->
        dl = document.createElement('dl')
        dt = document.createElement('dt')
        dt.className = "character"
        dt.appendChild(
            document.createTextNode(lines.shift()))
        dd = document.createElement('dd')
        dd.className = "dialogue"
        for line in lines
            dd.appendChild(
                document.createTextNode(line+"\n"))
        dl.appendChild(dt)
        dl.appendChild(dd)
        return dl


    ### `createAction`
    #
    # creates a paragraph for action blocks
    ###
    createAction: (lines) ->
        p = document.createElement('p')
        p.className = "action"
        for line in lines
            text = document.createTextNode(line+"\n")
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
    process: (data, div) ->
        paragraphs = data.split "\n\n"
        for paragraph in paragraphs
            lines = paragraph.split "\n"
            elem = @createFountain(lines)
            div.appendChild(elem) if elem?


    ### `read`
    #
    # call `process` after the `blob` is loaded.
    ###
    read: (blob, div) ->
        reader = new FileReader()
        reader.addEventListener "loadend", (event) =>
            data = event.target.result
            error = event.target.error
            @process(data,div) if error==null
        reader.readAsText(blob)


    ### `load`
    #
    # get `blob` from an XMLHttp request
    ###
    load: (id) ->
        url = "#{baseurl}/scenes/#{id}.fountain"
        div = document.getElementById(id)
        xhr = new XMLHttpRequest()
        xhr.open('GET',url,true)
        xhr.responseType = 'blob'
        xhr.onload = () =>
            if (xhr.status==200)
                blob = new Blob(
                    [xhr.response]
                    {type: 'text'})
                @read(blob,div)
        xhr.send()


inkwell = new Inkwell()








