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
toHastur = (s) => toNation(s,hastur,image_style,"#87480E")
toCthulhu = (s) => toNation(s,cthulhu,image_style,"#44058E")
toSoviet = (s) => toNation(s,soviet,image_style,"#9A070D")
toUSA = (s) => applyColor(s,"#072C66")
toNation = (s,src,style,color) =>
    style += "fill: #{color} !important; color: #{color};"
    applyColor("#{s}<img src='#{src}' style='#{style}'></img>",color)
toItalic = (s) => applyStyle(s,"i")
toStrong = (s) => applyStyle(s,"strong")
applyStyle = (s,style) => "<#{style}>#{s}</#{style}>"
applyColor = (s,color) => "<font color='#{color}'>#{s}</font>"


### Linkable Patterns ###
links = [
    base: "characters/skills/"
    styles: [toStrong,(s) => applyColor(s,"#111111")]
    patterns: [
        link: ""
        regex: ///
                 Athletics
               | Accounting
               | Conceal
               | Anthropology
               | Disguise
               | Archaeology
               | Driving
               | Architecture
               | Electrical Repair
               | Art History
               | Explosives
               | Biology
               | Filch
               | Cthulhu Mythos
               | Firearms
               | Cryptography
               | First Aid
               | Geology
               | Fleeing
               | History
               | Hypnosis
               | Languages
               | Mechanical Repair
               | Law
               | Piloting
               | Library Use
               | Preparedness
               | Medicine
               | Psychoanalysis
               | Occult
               | Riding
               | Physics
               | Sanity
               | Theology
               | Stability
               | Scuffling
               | Sense Trouble
               | Shadowing
               | Stealth
               | Weapons
               | Art
               | Astronomy
               | Chemistry
               | Craft
               | Evidence Collection
               | Forensics
               | Locksmith
               | Outdoorsman
               | Pharmacy
               | Assess Honesty
               | Bargain
               | Bureaucracy
               | Cop Talk
               | Credit Rating
               | Flattery
               | Interrogation
               | Intimidation
               | Oral History
               | Photography
               ///g
    ],
,

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
        #styles: [toSoviet]
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
        link: "stalin/"
        styles: [toSoviet]
        regex:
            /// Joseph \s+ Stalin
            |   (Joe|Joseph \s+)? Stalin
            ///g
    ,
        link: "rasputin/"
        styles: [toSoviet]
        regex:
            /// Grigori (\s+ Rasputin)?
            |   (Grigori \s+) Rasputin
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
                    if (group.styles)
                        match = style(match) for style in group.styles
                    if (pattern.styles)
                        match = style(match) for style in pattern.styles
                    match = """<a href="#{site}#{baseurl}#{base}#{link}">#{match}</a>"""


autoLinker = new AutoLinker()








