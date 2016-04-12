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

soviet = "#{site}#{baseurl}assets/soviet.svg"
usa = "#{site}#{baseurl}assets/usa.svg"
cthulhu = "#{site}#{baseurl}assets/cthulhu.svg"
hastur = "#{site}#{baseurl}assets/hastur.svg"
image_style =
    """
    display: inline-block;
    height: 1em;
    width: 1em;
    margin: auto;
    """

### Helper Functions ###
String::startsWith ?= (s) -> @slice(0,s.length)==s
String::endsWith   ?= (s) -> s=='' || @slice(-s.length)==s
toItalic = (s) => applyStyle(s,"i")
toStrong = (s) => applyStyle(s,"strong")
applyStyle = (s,style) => "<#{style}>#{s}</#{style}>"
applyColor = (s,color) => "<font color='#{color}'>#{s}</font>"


nationStyle = ""
toHastur = (s) => toNation(s,hastur,image_style,"#87480E")
toCthulhu = (s) => toNation(s,cthulhu,image_style,"#44058E")
toSoviet = (s) => toNation(s,soviet,image_style,"#9A070D")
toUSA = (s) => applyColor(s,"#072C66")

toNation = (s,src,style,color) =>
    style += "fill: #{color} !important; color: #{color};"
    applyColor("#{s}<img src='#{src}' style='#{style}'></img>",color)


### Linkable Patterns ###
links = [
    base: "items/"
    styles: [toItalic]
    patterns: [
        link: "talisman/"
        styles: [toHastur]
        regex:
            /// \bTalismans? \s+ of \s+ the \s+ Yellow \s+ Sign
            |   (Yellow \s+)? Talisman\b
            ///g
    ,
        link: "medallion/"
        styles: [toCthulhu]
        regex: ///\b (Tendril \s+)? Medallion \b///g
    ,
        link: "grimoire/"
        regex:
            /// (Birchwell's \s+)? Grimoire
            |   (Birchwell's \s+)? Strange \s+ Notes
            ///g
    ,
        link: "glyph/"
        styles: [toCthulhu]
        regex: /// (Tendril(-Like)? \s+)? Glyph ///g
    ],
,
    base: "characters/players/"
    styles: [toStrong,toUSA]
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
        styles: [toUSA]
        regex:
            /// Professor \s+ Cameron \s+ 'T'\. \s+ Birchwell
            |   Professor \s+ Cameron \s+ Trenton \s+ Birchwell
            |   Professor (\s+Birchwell)?
            |   Cameron (\s+Birchwell)?
            |   Birchwell\b
            ///g
    ,
        link: "dolya/"
        styles: [toSoviet]
        regex:
            /// Dolya (\s+ Petrovna)?
            |   Petrovna
            ///g
    ,
        link: "ilya/"
        styles: [toSoviet]
        regex:
            /// Commander\s+Ilya\s+Zolnerowich
            |   Ilya(\s+Zolnerowich)?
            |   Zolnerowich
            ///g
    ,
        link: "borst/"
        styles: [toSoviet]
        regex:
            /// Sergeant \s+ Borst \s+ Chekhov
            |   Sgt\.\s+ Borst \s+ Chekhov
            |   Borst (\s+ Chekhov)?
            |   Chekhov
            ///g
    ,
        link: "omari/"
        styles: [toHastur]
        regex:
            /// Colonel \s+ Ukrit \s+ Omari
            |   Col\.\s+ Ukrit \s+ Omari
            |   Ukrit(\s+Omari)?
            |   Omari
            ///g
    ,
        link: "chieftain/"
        styles: [toCthulhu]
        regex:
            /// Chieftain \s+ Ambalo
            |   Chieftain (\s+Ambalo)?
            |   Ambalo
            ///g
    ,
        link: "acolyte/"
        styles: [toHastur]
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
        styles: [toCthulhu]
        regex: /\bGrotto(es)?/g
    ,
        link: "lab/"
        styles: [toUSA]
        regex: /\bLab(oratory)?\b/g
    ,
        link: "observatory/"
        styles: [toSoviet]
        regex: /\bObservatory\b/g
    ,
        link: "ruins/"
        styles: [toCthulhu]
        regex: /\bRuins\b/g
    ,
        link: "village/"
        #styles: [toCthulhu]
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
                    if (pattern.styles)
                        match = style(match) for style in pattern.styles
                    match = """<a href="#{site}#{baseurl}#{base}#{link}">#{match}</a>"""


autoLinker = new AutoLinker()








