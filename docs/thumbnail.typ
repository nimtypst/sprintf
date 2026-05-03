#import "/src/lib.typ" as my-package: *

#set page(height: auto, margin: 5mm, fill: none)

// style thumbnail for light and dark theme
#let theme = sys.inputs.at("theme", default: "light")
#set text(white) if theme == "dark"

#align(center)[
	#block(inset: 8pt, stroke: (paint: rgb("9aa0a6"), thickness: 0.5pt), radius: 5pt)[
		#let txt = text(10pt, fill: color.gray)[
        ```typst sprintf("%s | %06d | %.2f%%", "item", 42, 7.5)```]
    #context[#txt #line(length: measure(txt).width)]
    #v(5pt)
		#text(15pt)[#sprintf("%s | %06d | %.2f%%", "item", 42, 7.5)]
	]
]
