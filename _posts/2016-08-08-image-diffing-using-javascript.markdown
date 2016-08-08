---
layout: post
status: publish
published: true
title: Image diffing using JavaScript
author:
  display_name: Nathan
  email: ndemick@gmail.com
date: 2016-08-08 12:44:13 -0400
categories:
- programming
tags:
- javascript
- diff
- canvas
comments: []
---
Recently I had need of a way to find how "similar" a collection of images were. A classic
way to diff images is to take one, invert it's colors, then draw it over the
second at 50% opacity. [It's pretty easy to do this in CSS.](http://franklinta.com/2014/11/30/image-diffing-using-css/)
If both images are the same, the resulting combination will be perfectly grey (`rgb(128, 128, 128)`).

Since we're [JavaScripting all the things](https://blog.codinghorror.com/javascript-the-lingua-franca-of-the-web/)
these days, I figured that this technique could be implemented in JS. Fortunately, HTML's
`<canvas>` element has APIs that allow for easy access to raw pixel data of an
image. You can call `getImageData` on a canvas context, which will return an
object that contains an array of RGBA values for each pixel in the image. Using
that data, it's easy to invert the image a canvas displays (subtract each color
value from 255), and also compare the resulting combined image.

The only real annoying bit is synchronizing loading each image, and also determining
how long the entire diff process took. To that end, I created a giant array of
promises, each of which was itself a promise for loading/comparing two images.
The resolution of the giant promise array concludes with a timestamp comparision.

[Check out the full source code.](https://gist.github.com/endemic/5e56485d3fc3ae2fe2424042b9b9a4c6)
Usage is simple:

<pre><code class="language-javascript">
diff(sources).then(results => {
    console.info(results);
});
</code></pre>

Where `sources` is an array of image URLs, and `results` is an array of integers,
indicating similarity between two images in the source array. A value close to
zero indicates the two images are very similar, while a value closer to 128 shows
that they are very different.

The only downside to implementing this type of algorithm in JavaScript is that
it can take a very long time to compare two large images, as you are iterating
over each pixel in the image, twice. For two 8 megapixel images (e.g. taken by
your iPhone 5), that is 32 million pixels. As a proof of concept/toy/small
image diffing tool, it works pretty nicely though.
