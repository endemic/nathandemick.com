---
layout: post
status: publish
published: true
title: How to create Flash programs with Actionscript 3 and the Flex SDK
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 165
wordpress_url: http://www.bitter-gamer.com/?p=165
date: '2009-02-19 09:34:50 -0500'
date_gmt: '2009-02-19 14:34:50 -0500'
categories:
- programming
tags:
- tutorial
- Flash
- actionscript
comments:
- id: 96
  author: Compiling Papervision3D projects using mxmlc at bitter-gamer.com
  author_email: ''
  author_url: http://www.bitter-gamer.com/2009/03/compiling-papervision3d-projects-using-mxmlc/
  date: '2009-03-04 14:39:54 -0500'
  date_gmt: '2009-03-04 19:39:54 -0500'
  content: '[...] Obtain the (free) Flex SDK, and put it somewhere in your system
    path. I wrote a post about setting up your Actionscript development environment;
    check it out if you haven&#8217;t done this already. 2. Download the Papervision3D
    compiled [...]'
---
<p>So, something I've been devoting a bit of my time to recently is learning Actionscript programming. It's something that I've been interested in for a while, but never pursued -- mainly because the Flash authoring program (currently CS4) runs around $700 for the full version. Now, if I was a professional, and worked with Flash for a living, I'd have no qualms about dropping that cash. However, it's a steep point of entry for a hobbyist.</p>
<p>In a bid to make the Flash platform more of an application environment, Adobe has been promoting a new way to author Flash content, called Flex. Flex uses a mix of XML (for layout) and Actionscript (for logic) to more easily create "application-like" programs. Flex is really targeted at the programmer -- development is done through a text editor-based environment (although Adobe has made a Flex Builder program to facilitate UI layout). Now, the benefit here is that while Adobe charges for the premium development environment, the actual XML/Actionscript compiler is available for free. This means that you can create pure-Actionscript programs (read: games) for free!</p>
<p>I'm going to quickly show you how to set up a development environment for Flash authoring with the Flex 3 SDK. The first step is to <a title="download the SDK" href="http://www.adobe.com/products/flex/flexdownloads/">download the SDK</a>. Click the "I Agree" checkbox, and save the .zip somewhere on your computer. It's a bit large, weighing in at around 120 megs. Extract the files somewhere when it's finished downloading (c:\flex3 on Windows or /Users/yourusername/flex3 on OS X).</p>
<p>You've got the tools, now you need to know how to use them. I primarily use some sort of terminal to do my compiling. For Windows, I recommend <a title="Cygwin" href="http://www.cygwin.com/">Cygwin</a>. OS X users can simply use their Terminal.app program. You'll have to let your terminal know where your Flex compiler is, so you don't have to type the absolute path each time you want to run it (i.e. so we can type 'mxmlc Myprogram.as' instead of '/Home/yourusername/flex3/bin/mxmlc Myprogram.as'). So we'll add the 'flex3/bin' directory to our system path. Here are instructions for <a href="http://publib.boulder.ibm.com/iseries/v5r2/ic2924/books/5445775168.htm">Windows</a> and <a title="OS X" href="http://www.tech-recipes.com/rx/2621/os_x_change_path_environment_variable/">OS X</a>. You'll want to add the 'c:\flex3\bin' directory (Windows) or '/Users/yourusername/flex3/bin' (OS X) (or wherever you put the Flex SDK files) to your path. Once you've done that, fire up your terminal and type 'mxmlc -help'. If you see a bunch of info about the compiler, then you're good to go.</p>
<p>Next, we're ready to create a simple program to demonstrate how to author Flash content using only Actionscript. Open up your favorite text editor (my preference is <a title="TextMate" href="http://www.macromates.com">TextMate</a>) and create a file called 'HelloWorld.as', and slap this code into it:</p>
<pre class="brush:js">
package 
{
	import flash.display.Sprite;
	import flash.text.TextField;

	public class HelloWorld extends Sprite
	{
		public function HelloWorld():void
		{
		// Create a new variable to hold a "TextField" and assign an instance of the TextField class to it
		var myMessage:TextField = new TextField();

		// Add some text to the TextField object
		myMessage.text = "Hello World!";

		// Add the text to the main display container
		addChild(myMessage);
		}
	}
}
</pre>
<p>Save your file, then compile it by typing 'mxmlc HelloWorld.as'. If you see any errors, make sure you copy/pasted the above code exactly. The compiler should output a SWF binary file called 'HelloWorld.swf'. Double-click it or drag it to your browser to start your new program, and you should see a window with the text "Hello World" displayed in the upper left corner. Congratulations! You've successfully set up a development environment, and are now ready to start learning Actionscript and making your own programs.</p>
