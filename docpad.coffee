# The DocPad Configuration File
# It is simply a CoffeeScript Object which is parsed by CSON
docpadConfig = {

	# =================================
	# Template Data
	# These are variables that will be accessible via our templates
	# To access one of these within our templates, refer to the FAQ: https://github.com/bevry/docpad/wiki/FAQ

	templateData:

		# Specify some site properties
		site:
			# The default title of our website
			title: "NightScout @ d-data 11/2014"

			# The website description (for SEO)
			description: """
From one to thousands, Nightscout is meeting a significant need for
people with diabetes and their loved ones.

Real-time remote monitoring of CGM data has transformed lives, enabling
freedoms once thought lost to type one: Date-nights, sleep-overs,
out-of-town trips, and countless others… combined, they result in a
marked improvement in quality of life. The countless testimonials and
outpouring of gratitude is truly awe inspiring.

Given freely to the community, it has continued to attract individuals
willing to help and participate in its innovation and growth. People are
continually "paying it forward" and contributing their time, talents to
help improve the lives of many.  """
			# Authors
			authors: """
				Jason Calabrese, John Costik, Ben West
				"""

			# The website keywords (for SEO) separated by commas
			keywords: """
				payitforward, nightscout, intro, history, fda, regulation, current development, cookie monster, IOB/COB, DIYPS
				"""


		# --------------------------------------
		# Revealjs.docpad specific configuration

		# Generate menu
		generateSlidesMenu: false

		# -----------------------------
		# Helper Functions

		# Get the prepared site/document title
		# Often we would like to specify particular formatting to our page's title
		# we can apply that formatting here
		getPreparedTitle: ->
			# if we have a document title, then we should use that and suffix the site's title onto it
			if @document.title
				"#{@document.title} | #{@site.title}"
			# if our document does not have it's own title, then we should just use the site's title
			else
				@site.title

		# Get the prepared site/document description
		getPreparedDescription: ->
			# if we have a document description, then we should use that, otherwise use the site's description
			@document.description or @site.description

		# Get the prepared site/document keywords
		getPreparedKeywords: ->
			# Merge the document keywords with the site keywords
			@site.keywords.concat(@document.keywords or []).join(', ')

    # Get prepared authors
		getPreparedAuthors: ->
			# Merge the document keywords with the site keywords
			[@site.authors].concat(@document.authors or []).join('')



	# =================================
	# Collections
	# These are special collections that our website makes available to us

	collections:
	# Reveal.js slides
		slides: (database) ->
      query =
        tags: $has: 'slide'
        slideOrder: $exists: true
      sorting =
        slideOrder: 1
      database.findAllLive(query, sorting)

}

# Export our DocPad Configuration
module.exports = docpadConfig
