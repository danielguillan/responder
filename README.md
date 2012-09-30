# Responder

Magic media queries for your Compass project. You define the breakpoints, Responder takes care of the rest.

Forget about multiple variable declarations, long lists of unmanageable, inextensible and unreusable mixins. Responder is the only media queries mixin you'll ever need. And it's always ready to use.

## Installation

Install the respond-to gem:

    $ gem install responder

In your project's config.rb file add:

	require "responder"

Finally install the Compass extension:

	$ compass install responder

## Usage

### 1. Define your own breakpoints

Include the `respond-to-breakpoints()` mixin in your stylesheet and pass a list of desired breakpoints. Define as many as you need and give each one of them a name and a min-width value.

*An example:*

	@include respond-to-breakpoints( mobile-portrait 320px,
									 mobile-landscape 480px,
									 tablet-portrait 600px,
									 tablet-landscape 768px,
							 		 desktop 990px);

**Important:** Your list of breakpoints must always start with the smallest breakpoint and end with the bigger one.

### 2. Using the respond-to mixin

Yep, that was it. Your mixin is ready to use.

This is how you use respond-to in your SASS stylesheet:

	selector {
		@include respond-to(breakpointName-extend) {
			// rules…
		}
	}
For each breakpoint you've defined you now have 3 available parameters for the respond-to mixin:

- *breakpointName***-only**
- *breakpointName***-and-up**
- *breakpointName***-and-below**

*An example:*

	body {
		background-color: #fff;

		// Targets tablet-landscape only
		@include respond-to(tablet-landscape-only) {
			background-color: #0f0;
		}

		// Targets tablet-portrait and up
		@include respond-to(tablet-portrait-and-up) {
			background-color: #ff0;
		}

		// Targets mobile-landscape and below
		@include respond-to(mobile-landscape-and-below) {
			background-color: #0ff;
		}

		// (Bonus!) Targets mobile only
		@include respond-to(mobile-only) {
			background: #f0f;
		}
	}


#### Breakpoint Groups

You might have noticed from the example above that we where able to `respond-to(mobile-only)`, but how? We didn't define any mobile (only) breakpoint in our list. Well, that's some of the magic behind Responder. It automatically creates breakpoint groups based on your breakpoint names.

Groups are sets of breakpoints whose names share the same root followed by a dash (-). For example `mobile` is the group Responder creates for the `mobile-portrait` and `mobile-landscape` breakpoints.

Given the example breakpoint list above, `respond-to(mobile-only)` will output the following css:

	@media screen and (min-width: 320px) and (max-width: 480px) { … }

min-width value is the first breakpoint of the group and max-width is the last one. It's that simple.

**NOTE:** You can define more than two breakpoints per group, Responder will pick the smallest breakpoint and the bigger breakpoint to create the group.

### 3. There's no #3. Enjoy and build amazing stuff

… And contribute to make Responder even better!


## What's next?

- Respond-to Retina displays
- Support for more than just `min-width` and `max-width`
- Suggestions?
