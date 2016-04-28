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

blacklist = [
  'H1','H2','H3','H4','CODE',
  'PRE','BLOCKQUOTE','HEADER','FOOTER']


### Linkable Patterns ###
links = [
    base: "characters/skills/"
    styles: [toStrong,(s) => applyColor(s,"#111111")]
    patterns: [
        link: ""
        regex:
            ///\b
              Athletics
            | Accounting
            | Conceal
            | Anthropology
            | Disguise
            | Archaeology
            | Driving
            | Architecture
            | Electrical \s+ Repair
            | Art \s+ History
            | Explosives
            | Biology
            | Filch
            | Cthulhu \s+ Mythos
            | Firearms
            | Cryptography
            | First \s+ Aid
            | Geology
            | Fleeing
            | History
            | Hypnosis
            | Languages
            | Mechanical \s+ Repair
            | Law
            | Piloting
            | Library \s+ Use
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
            | Sense \s+ Trouble
            | Shadowing
            | Stealth
            | Weapons
            | Art
            | Astronomy
            | Chemistry
            | Craft
            | Evidence \s+ Collection
            | Forensics
            | Locksmith
            | Outdoorsman
            | Pharmacy
            | Assess \s+ Honesty
            | Bargain
            | Bureaucracy
            | Cop \s+ Talk
            | Credit \s+ Rating
            | Flattery
            | Interrogation
            | Intimidation
            | Oral \s+ History
            | Reassurance
            | Streetwise
            | Photography
            \b///g
    ],
,

    base: "items/"
    styles: [toItalic]
    patterns: [
        link: "talisman/"
        styles: [toHastur]
        regex:
            ///\b
              Talismans? \s+ of \s+ the \s+ Yellow \s+ Sign
            | (Yellow \s+)? Talisman
            \b///g
    ,
        link: "medallion/"
        styles: [toCthulhu]
        regex: ///\b (Tendril \s+)? Medallion \b///g
    ,
        link: "grimoire/"
        regex:
            ///\b
              (Birchwell's \s+)? Grimoire
            | (Birchwell's \s+)? Strange \s+ Notes
            \b///g
    ,
        link: "glyph/"
        styles: [toCthulhu]
        regex: ///\b (Tendril(-Like)? \s+)? Glyph \b///g
    ],
,
    base: "characters/players/"
    styles: [toStrong,toUSA]
    patterns: [
        link: ""
        regex: ///\b Players? | PCs?\b///g
    ,
        link: "adaline/"
        regex: ///\b Ada(line)?(\s+Braun)? | Braun \b///g
    ,
        link: "alexandra/"
        regex: ///\b Alex(andra)? (\s+Hayes)? | Hayes \b///g
    ,
        link: "lee/"
        regex:
          ///\b
            Lee(\s+Runge)?(\s+Hammarburg)?
          | Hammarburg
          \b///g
    ,
        link: "acheron/"
        regex:
          ///\b
              Acheron(\s+Erevnit[iíî]s)
            | Erevnit[iîí]s
          \b///g
    ],
,
    base: "characters/"
    styles: [toStrong]
    patterns: [
        link: "birchwell/"
        styles: [toUSA]
        regex:
            ///\b
              Professor \s+ Cameron \s+ 'T'\. \s+ Birchwell
            | Professor \s+ Cameron \s+ Trenton \s+ Birchwell
            | Professor (\s+Birchwell)?
            | Cameron (\s+Birchwell)?
            | Birchwell
            \b///g
    ,
        link: "dolya/"
        regex:
            ///\b
              Dolya (\s+ Petrovna)?
            | Petrovna
            \b///g
    ,
        link: "ilya/"
        styles: [toSoviet]
        regex:
            ///\b
              Commander\s+Ilya\s+Zolnerowich
            | Ilya(\s+Zolnerowich)?
            | Zolnerowich
            \b///g
    ,
        url: "https://en.wikipedia.org/wiki/Joseph_Stalin"
        #link: "stalin/"
        styles: [toSoviet]
        regex:
            ///\b
              Joseph \s+ Stalin
            | (Joe|Joseph \s+)? Stalin
            \b///g
    ,
        url: "https://en.wikipedia.org/wiki/Grigori_Rasputin"
        #link: "rasputin/"
        styles: [toSoviet]
        regex:
            ///\b
              Grigori (\s+ Rasputin)?
            | (Grigori \s+) Rasputin
            \b///g
    ,
        link: "borst/"
        styles: [toSoviet]
        regex:
            ///\b
              Sergeant \s+ Borst \s+ Chekhov
            | Sgt\.\s+ Borst \s+ Chekhov
            | Borst (\s+ Chekhov)?
            | Chekhov
            \b///g
    ,
        link: "omari/"
        styles: [toHastur]
        regex:
            ///\b
              Colonel \s+ Ukrit \s+ Omari
            | Col\.\s+ Ukrit \s+ Omari
            | Ukrit(\s+Omari)?
            | Omari
            \b///g
    ,
        link: "chieftain/"
        styles: [toCthulhu]
        regex:
            ///\b
              Chieftain \s+ Ambalo
            | Chieftain (\s+Ambalo)?
            | Ambalo
            \b///g
    ,
        link: "acolyte/"
        styles: [toHastur]
        regex:
            ///\b
              High \s+ Acolyte \s+ Ambalo \s+ Jr\.
            | (High \s+)? Acolyte
            | Acolyte
            \b///g
    ],
,
    base: "locations/"
    patterns: [
        link: "grotto/"
        styles: [toCthulhu]
        regex: ///\b Grotto(es)? ///g
    ,
        link: "lab/"
        styles: [toUSA]
        regex: ///\b Lab(oratory)? \b///g
    ,
        link: "observatory/"
        styles: [toSoviet]
        regex: ///\b Observatory \b///g
    ,
        link: "ruins/"
        styles: [toCthulhu]
        regex: ///\b Ruins \b///g
    ,
        link: "village/"
        regex: ///\b Village \b///g
    ]
]


### `AutoLinker`
#
# main class
###
class AutoLinker
    constructor: ->
        divs = document.getElementsByClassName("content")

        for div in divs
            walker = document.createTreeWalker(
                div, NodeFilter.SHOW_ELEMENT)
            i = 0
            elements = []

            while (i<1024)
                node = walker.nextNode()
                break if (!node)
                i += 1
                continue if node.parentNode?.tagName in blacklist
                elements.push(node) unless node.tagName in blacklist

            @createLink(element) for element in elements


    createLink: (node) ->
        for group in links
            base = group.base
            for pattern in group.patterns
                node.innerHTML = node.innerHTML.replace pattern.regex, (match) ->
                    if (group.styles)
                        match = style(match) for style in group.styles
                    if (pattern.styles)
                        match = style(match) for style in pattern.styles
                    if (pattern.url)
                        match = """<a href="#{pattern.url}">#{match}</a>"""
                    else match = """<a href="#{site}#{baseurl}#{base}#{pattern.link}">#{match}</a>"""


autoLinker = new AutoLinker()












