---
---


### `AutoLinker`
#
# Automatically links and styles:
# - Characters
# - Settings
# - whatever else
#
# Ben Scott
# <bescott@andrew.cmu.edu>
# 2016-04-08
###

'use strict' # just like JavaScript


### DOM ###
site = "http://bescott.org/" # domain name, localhost:4000
baseurl = "trail-of-cthulhu/" # subdomain


### Helper Functions ###
String::startsWith ?= (s) -> @slice(0,s.length)==s
String::endsWith   ?= (s) -> s=='' || @slice(-s.length)==s
toItalic = (s) => applyStyle(s,"i")
toStrong = (s) => applyStyle(s,"strong")
applyStyle = (s,style) => "<#{style}>#{s}</#{style}>"


### Linkable Patterns ###
links = [
    base: "items/"
    styles: [toItalic]
    patterns: [
        link: "talisman/"
        regex:
            /// \bTalismans? \s+ of \s+ the \s+ Yellow \s+ Sign
            |   (Yellow \s+)? Talisman\b
            ///g
    ,
        link: "medallion/"
        regex: ///\b (Tendril \s+)? Medallion \b///g
    ,
        link: "grimoire/"
        regex:
            /// (Birchwell's \s+)? Grimoire
            |   (Birchwell's \s+)? Strange \s+ Notes
            ///g
    ,
        link: "glyph/"
        regex: /// (Tendril(-Like)? \s+)? Glyph ///g
    ],
,
    base: "characters/players/"
    styles: [toStrong]
    patterns: [
        link: ""
        regex: /\bPlayers?|PCs?\b/g
    ,
        link: "adaline/"
        regex: /Ada(line)?(\s+Braun)?|Braun/g
    ,
        link: "alexandra/"
        regex: /Alex(andra)?(\s+Hayes)?|Hayes/g
    ,
        link: "lee/"
        regex: /Lee(\s+Runge)?(\s+Hammarburg)?|Hammarburg/g
    ,
        link: "acheron/"
        regex: /Acheron(\s+Erevnit[iíî]s)|Erevnit[iîí]s/g
    ],
,
    base: "characters/"
    styles: [toStrong]
    patterns: [
        link: "birchwell/"
        regex:
            /// Professor \s+ Cameron \s+ 'T'\. \s+ Birchwell
            |   Professor \s+ Cameron \s+ Trenton \s+ Birchwell
            |   Professor (\s+Birchwell)?
            |   Cameron (\s+Birchwell)?
            |   Birchwell\b
            ///g
    ,
        link: "dolya/"
        regex:
            /// Dolya (\s+ Petrovna)?
            |   Petrovna
            ///g
    ,
        link: "ilya/"
        regex:
            /// Commander\s+Ilya\s+Zolnerowich
            |   Ilya(\s+Zolnerowich)?
            |   Zolnerowich
            ///g
    ,
        link: "borst/"
        regex:
            /// Sergeant \s+ Borst \s+ Chekhov
            |   Sgt\.\s+ Borst \s+ Chekhov
            |   Borst (\s+ Chekhov)?
            |   Chekhov
            ///g
    ,
        link: "omari/"
        regex:
            /// Colonel \s+ Ukrit \s+ Omari
            |   Col\.\s+ Ukrit \s+ Omari
            |   Ukrit(\s+Omari)?
            |   Omari
            ///g
    ,
        link: "chieftain/"
        regex:
            /// Chieftain \s+ Ambalo
            |   Chieftain (\s+Ambalo)?
            |   Ambalo
            ///g
    ,
        link: "acolyte/"
        regex:
            /// High \s+ Acolyte \s+ Ambalo \s+ Jr\.
            |   (High \s+)? Acolyte
            |   Acolyte
            ///g
    ],
,
    base: "setting/"
    styles: [(s) => s] #.toUpperCase()
    patterns: [
        link: "grotto/"
        regex: /\bGrotto(es)?/g
    ,
        link: "lab/"
        regex: /\bLab(oratory)?\b/g
    ,
        link: "observatory/"
        regex: /\bObservatory\b/g
    ,
        link: "ruins/"
        regex: /\bRuins\b/g
    ,
        link: "village/"
        regex: /\bVillage\b/g
    ]
]


### `AutoLinker`
#
# main class
###
class AutoLinker
    constructor: ->
        divs = document.getElementsByClassName("content")
        @createLink(div) for div in divs

    createLink: (div) ->
        for group in links
            base = group.base
            for pattern in group.patterns
                link = pattern.link
                div.innerHTML = div.innerHTML.replace pattern.regex, (match) ->
                    match = style(match) for style in group.styles
                    match = """<a href="#{site}#{baseurl}#{base}#{link}">#{match}</a>"""


autoLinker = new AutoLinker()








