# Responder

Magic media queries for your Compass project. You define the breakpoints, Responder takes care of the rest.

Forget about long lists of unmanageable and unreusable variables and mixins. Responder is the simplest and fastest way to start using media queries in your project. In a matter of seconds you're ready to go.

## Installation

Install the responder gem:

    $ gem install responder

In your project's config.rb file add:

	require "responder"

Finally import responder into your sass code

	@import "responder";

## Usage

### 1. Define your own breakpoints

Include the `responder-breakpoints()` mixin in your stylesheet and pass your list of custom breakpoints. Define as many as you need and give each one of them a name and a min-width value in pixels.

*An example:*

	@include responder-breakpoints( mobile-portrait 320px,
									 mobile-landscape 480px,
									 tablet-portrait 600px,
									 tablet-landscape 768px,
							 		 desktop 990px);

**Important:** Start with the smallest breakpoint and grow your list from there up to the bigger one.

#### Settings

Responder will do the math for you and convert your breakpoint values into ems. By default Responder uses the Compass `$base-font-size` configurable variable as the context and sets the media type as `screen`.

**Set your own context**

	$responder-ems-context: $my-own-context; // Defaults to $base-font-size

**Prefer pixel breakpoints?** Easy:

	$responder-use-ems: false; // Defaults to true
	
**Change the default media type **

	$responder-media-type: screen; // Defaults to screen
	
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

You might have noticed from the example above that we were able to `respond-to(mobile-only)`, but how? We didn't define any mobile (only) breakpoint in our list. Well, that's some of the magic behind Responder. It automatically creates breakpoint groups based on your breakpoint names.

Groups are sets of breakpoints whose names share the same root followed by a dash (-). For example `mobile` is the group Responder creates for the `mobile-portrait` and `mobile-landscape` breakpoints.

Given the example breakpoint list above, `respond-to(mobile-only)` will output the following css:

	@media screen and (min-width: 320px) and (max-width: 480px) { … }

min-width value is the first breakpoint of the group and max-width is the last one. You can create as many breakpoints as you need for each group. It's that simple.

### 3. There's no #3. Enjoy and build amazing stuff

… And contribute to make Responder even better!


## What's next?

- Support for more media features (height, device-dimensions, orientation, retina displays, …)