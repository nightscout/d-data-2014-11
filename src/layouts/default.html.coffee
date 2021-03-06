# Prepare

# Get our formatted site title as defined by out docpad.cson file
siteTitle = @getPreparedTitle()

# Merge our site keywords with our documents keywords and stringify
siteKeywords = @getPreparedKeywords()


siteDescription = @getPreparedKeywords()


# -----------------------------
# Document

doctype 5
html lang: 'en', ->

	# -----------------------------
	# Document Header

	head ->
		# -----------------------------
		# Meta Information

		# Set our charset to UFT8 (oldshool method)
		meta charset:'utf-16'

		# Set our charset to UFT8 (newschool method)
		meta 'http-equiv':'content-type', content:'text/html; charset=utf-8'

		# Always use the latest rendering engine
		meta 'http-equiv':'X-UA-Compatible', content:'IE=edge,chrome=1'

		# Set our defualt viewport (window size and scaling) for mobile devices
		meta name:'viewport', content:'width=device-width, initial-scale=1'

		# SEO: Set our page title that will show up in search engine results
		meta name:'title', content:h(siteTitle)

		# SEO: Set the description of this page
		meta name:'description', content:h(siteDescription)

		# SEO: Set the keywords of this page
		meta name:'keywords', content:h(siteKeywords)

		# Output meta data set by DocPad and it's plugins
		text @getBlock('meta').toHTML()

		# Page title as shown in the browser tab and window
		title siteTitle

		link href:"http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic", rel:"stylesheet", type:"text/css"

		# link rel:'stylesheet', href:'vendor/reveal/css/main.css', type:'text/css'
		link rel:'stylesheet', href:'vendor/reveal/css/reveal.min.css', type:'text/css'
		# link rel:'stylesheet', href:'vendor/reveal/lib/css/zenburn.css', type:'text/css'
		# link rel:'stylesheet', href:'vendor/reveal/css/theme/default.css', type:'text/css'
		link rel:'stylesheet', href:'vendor/reveal/css/theme/solarized.css', type:'text/css', id: 'theme'

		# link rel:'stylesheet', href:'vendor/reveal/css/print/paper.css', type:'text/css', media:'print'

		link rel:'stylesheet', href:'css/site.css', type:'text/css'

		# <!-- If the query includes 'print-pdf', include the PDF print sheet -->
		script type:'text/javascript', ->
			"""
			if( window.location.search.match( /print-pdf/gi ) ) {
				var link = document.createElement( 'link' );
				link.rel = 'stylesheet';
				link.type = 'text/css';
				link.href = 'vendor/reveal/css/print/pdf.css';
				document.getElementsByTagName( 'head' )[0].appendChild( link );
			}
			"""

		# -----------------------------
		# IE conditional comment
		ie 'lte IE9', ->
			script async:'async', src:'http://html5shim.googlecode.com/svn/trunk/html5.js'


	# -----------------------------
	# Document Body

	body ->
		text @content

		# script src:'vendor/reveal/lib/js/classList.js'
		# script src:'vendor/reveal/lib/js/showdown.js'
		# script src:'vendor/reveal/lib/js/data-markdown.js'
		# script src:'vendor/reveal/lib/js/highlight.js'
		# script src:'vendor/reveal/lib/js/html5shiv.js'
		script src:'vendor/reveal/lib/js/head.min.js'
		script src:'vendor/reveal/js/reveal.js'

		script type:'text/javascript', ->
			"""
        Reveal.initialize({
          controls: true,
          progress: true,
          history: true,
          center: true,

          theme: Reveal.getQueryHash().theme || 'solarized', // available themes are in /css/theme
          transition: Reveal.getQueryHash().transition || 'linear', // default/cube/page/concave/zoom/linear/fade/none

          // Parallax scrolling
          // parallaxBackgroundImage: 'https://s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg',
          // parallaxBackgroundSize: '2100px 900px',

          // Optional libraries used to extend on reveal.js
          dependencies: [
            { src: 'vendor/reveal/lib/js/classList.js', condition: function() { return !document.body.classList; } },
            { src: 'vendor/reveal/plugin/markdown/marked.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
            { src: 'vendor/reveal/plugin/markdown/markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
            { src: 'vendor/reveal/plugin/highlight/highlight.js', async: true, callback: function() { hljs.initHighlightingOnLoad(); } },
            { src: 'vendor/reveal/plugin/zoom-js/zoom.js', async: true, condition: function() { return !!document.body.classList; } },
            { src: 'vendor/reveal/plugin/notes/notes.js', async: true, condition: function() { return !!document.body.classList; } }
          ]
        });
			"""

		# Analytics
		script """
		"""
