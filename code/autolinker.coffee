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
site = "http://bescott.org/" # domain name
baseurl = "trail-of-cthulhu/" # subdomain

### Helper Functions ###
String::startsWith ?= (s) -> @slice(0,s.length)==s
String::endsWith   ?= (s) -> s=='' || @slice(-s.length)==s


### Linkable Patterns ###

links = [
    base: "characters/players/"
    styles: ["strong"]
    patterns: [
        link: ""
        regex: /Players?|PCs?/g
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
    ,
        link: "acheron/"
        regex: /Acheron(\s+Erevnit[iíî]s)|Erevnit[iîí]s/g
    ],
,
    base: "characters/"
    styles: ["strong"]#,"toUpper"]
    patterns: [
        link: "birchwell/"
        regex:
            ///\b Professor \s+ Cameron \s+ 'T'\. \s+ Birchwell
            |   Professor \s+ Cameron \s+ Trenton \s+ Birchwell
            |   Professor (\s+Birchwell)?
            |   Cameron
            |   Birchwell\b
            ///g
    ,
        link: "dolya/"
        regex: /Dolya(\s+Petronva)?/g
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
            /// Sergeant \s+ Borst \s+ Chekov
            |   Sgt\.\s+ Borst \s+ Chekov
            |   Ilya(\s+Zolnerowich)?
            |   Zolnerowich
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
    base: "settings/"
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
    ],
,
    base: "items/"
    styles: ["i"]
    patterns: [
        link: "talisman/"
        regex:
            /// \bTalisman \s+ of \s+ the \s+ Yellow \s+ Sign
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
    ]
]
###
,
    base: "skills/"
    styles: ["i"]
    patterns: [
        link: ""
        regex: /// ///g
    ,
        link: ""
        regex: ///\b (Tendril \s+)? Medallion \b///g
    ,
        link: ""
        regex:
            /// (Birchwell's \s+)? Grimoire
            |   (Birchwell's \s+)? Strange \s+ Notes
            ///g
    ,
        link: ""
        regex: /// (Tendril(-Like)? \s+)? Glyph ///g
    ]
]
###



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
            styles = group.styles
            for pattern in group.patterns
                link = pattern.link
                regex = pattern.regex
                text = div.innerHTML
                div.innerHTML = text.replace regex, (match) ->
                    if (styles)
                        for style in styles
                            match = if (style=="toUpper") then match.toUpperCase() else "<#{style}>#{match}</#{style}>"
                    match = """<a href="#{site}#{baseurl}#{base}#{link}">#{match}</a>"""




autoLinker = new AutoLinker()








