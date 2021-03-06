
# [Reveal.js](http://lab.hakim.se/reveal-js/) skeleton for [DocPad](https://github.com/bevry/docpad)
Create reveal.js presentations using DocPad.

## Description

Gives you everything to directly start writing your
reveal.js slides.

## Getting Started

1. Clone the project and run the server

	``` bash
	git clone git://github.com/nightscout/d-data-2014-11.git
	cd d-data-2014-11
	npm install
	./node_modules/.bin/docpad run
	```

1. [Open http://localhost:9778/](http://localhost:9778/)

1. Start hacking away by modifying the `src` directory

## Documentation

### File structure

- Each slide is a file under `src/documents` with the tag `'slide'`.
- `src/documents/index.html.coffee` concatenates all the slides and displays the menu and the controls.
- `src/layout/default.html.coffee` holds the global html page.
- `docpad.coffee` holds site metadata like its name, keywords for SEO, and configuration options

### Usage

Each slide must have these metadata :

- `title: '<Title of your slide>'` Explicit enough...
- `slideOrder: X` X = Number used to order the slides
- `tags: ['slide']` Tag used to tell Docpad which document is a slide

This skeleton can generate a menu for you to easily navigate through your slide. It's activated by default,
in the docpad.coffee configuration file, at `generateSlidesMenu`. Disable it by using `false` instead.
If you use this feature, add the following metadata :

`htmlId: '<someId>'` <someId> must be a unique and valid HTML id for each slide.

Add as many slide files as you need. The content is written in Markdown.

If you want to use vertical slides, wrap each vertical slide content in a `<section>` tag :

	``` 
	<section>
		Vertical Slide 1
	</section>
	<section>
		Vertical Slide 2
	</section>
	```

Customize the site metadata in `docpad.coffee`.

Change the Reveal.js options in `src/layouts/default.html.coffee`.

## Known issues

- In my machine, the Docpad's livereload plugin (shipped with the project) doesn't work.
- The generated menu has no style. I'm lazy and leave it up to you.

## Thanks

- [DocPad](https://github.com/bevry/docpad)
- [Takeharu.Oshida](https://github.com/georgeOsdDev) for SlidePad and some of its code

