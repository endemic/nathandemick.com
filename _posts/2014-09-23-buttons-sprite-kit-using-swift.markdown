---
layout: post
status: publish
published: true
title: Buttons in Sprite Kit using Swift
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 619
wordpress_url: http://ganbarugames.com/?p=619
date: '2014-09-23 06:48:34 -0400'
date_gmt: '2014-09-23 10:48:34 -0400'
categories:
- Programming
- Tutorial
tags:
- iOS
- tutorial
- apple
- swift
- sprite kit
comments:
- id: 132
  author: falconlover
  author_email: falconaire@lycos.com
  author_url: ''
  date: '2014-09-27 14:15:00 -0400'
  date_gmt: '2014-09-27 18:15:00 -0400'
  content: Hello, I am having an issue with goToGameScene and what it needs to be.  I
    have tried a literal like UIButton uses (i.e. "btnClick:") but get an error.  I
    guess I am just not understanding the syntax of what:"() -&gt; Void"  is.  Can
    you clarify?  Thank you.
- id: 133
  author: EW Parris
  author_email: me@ewparris.net
  author_url: ''
  date: '2014-11-28 19:01:00 -0500'
  date_gmt: '2014-11-29 00:01:00 -0500'
  content: |-
    This is a great basic button class. This helped me to create my own family of button classes in swift.


    Thanks for the starting point!
- id: 134
  author: TPot
  author_email: tim_potter@hotmail.com
  author_url: ''
  date: '2014-11-30 21:41:00 -0500'
  date_gmt: '2014-12-01 02:41:00 -0500'
  content: |-
    Thanks.
    Just tried it and it works nicely - now expanding on it.
    @falconlover: ()-&gt;void is saying the argument is a function with no arguments and returns nothing.  ie. you'd define "goToGameScene" as a function somewhere in your class.
- id: 135
  author: André
  author_email: decaobr@gmail.com
  author_url: ''
  date: '2014-12-04 16:10:00 -0500'
  date_gmt: '2014-12-04 21:10:00 -0500'
  content: Thanks a lot, very good tutorial!
- id: 136
  author: Jon
  author_email: fisherj93@gmail.com
  author_url: ''
  date: '2014-12-08 16:01:00 -0500'
  date_gmt: '2014-12-08 21:01:00 -0500'
  content: '@TPot Please explain why this works. I too do not understand. I just want
    my button to briefly change images following the tap. I don''t know how to implement
    the goToGameScene. I don''t know where it must go or what code must go underneath
    it'
- id: 137
  author: Moon
  author_email: csdcdd@hotmail.com
  author_url: ''
  date: '2014-12-11 15:18:00 -0500'
  date_gmt: '2014-12-11 20:18:00 -0500'
  content: When i create a function in the class as TPot suggested, i cannot pass
    this through as a parameter
---
<p>For all the helpful things that Apple added to Sprite Kit, one of the most glaring omissions is that most basic of user interface elements, the button. Not really sure why that is, but fortunately it's pretty easy to create something that "just works." The gist of the solution is to create a subclass of the <code>SKNode</code> class. Since each node in Sprite Kit can contain any number of other nodes, we just have to create a button container which holds two sprites: one for the default button state and one for the "active" button state.</p>
<pre class="brush:js">
import SpriteKit

class GGButton: SKNode {
    var defaultButton: SKSpriteNode
    var activeButton: SKSpriteNode
    var action: () -> Void
    
    init(defaultButtonImage: String, activeButtonImage: String, buttonAction: () -> Void) {
        defaultButton = SKSpriteNode(imageNamed: defaultButtonImage)
        activeButton = SKSpriteNode(imageNamed: activeButtonImage)
        activeButton.hidden = true
        action = buttonAction
        
        super.init()

        userInteractionEnabled = true
        addChild(defaultButton)
        addChild(activeButton)
    }

    /**
        Required so XCode doesn't throw warnings
    */
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
</pre>
<p>Here we create that subclass of <code>SKNode</code> and give it three properties: the default button image, the active button image, and the action that the button should take if pressed. Passing in two strings to the constructor handles initializing the button images, and we also store a reference to the button action function. Note of course that we hide the "active" button by default, waiting for user interaction to reveal it.</p>
<p>After the call to <code>super.init()</code>, the button container has access to methods inherited from <code>SKNode</code>. We then set the <code>userInteractionEnabled</code> property to true, which lets this node respond to input, and also add both buttons as children so they'll be drawn to the screen.</p>
<p>Now let's deal with user input. We want to handle three cases: user touches the button, user moves their finger around, user lifts their finger off the button. Fortunately the user interaction methods provided by <code>SKNode</code> give us exactly that, if you add the following three methods to the button class definition.</p>
<pre class="brush:js">
override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    activeButton.hidden = false
    defaultButton.hidden = true
}
</pre>
<p>This first method is pretty obvious: if a user starts touching the button, show the "active" state.</p>
<pre class="brush:js">
override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
    var touch: UITouch = touches.allObjects[0] as UITouch
    var location: CGPoint = touch.locationInNode(self)

    if defaultButton.containsPoint(location) {
        activeButton.hidden = false
        defaultButton.hidden = true
    } else {
        activeButton.hidden = true
        defaultButton.hidden = false
    }
}
</pre>
<p>This next method is a bit more complex. We have to determine if a user moved their finger on or off the button, so as to show the appropriate highlight state. Fortunately, <code>SKNode</code>-derived objects have a method <code>containsPoint()</code>, which lets us do some easy collision detection.</p>
<pre class="brush:js">
override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
    var touch: UITouch = touches.allObjects[0] as UITouch
    var location: CGPoint = touch.locationInNode(self)

    if defaultButton.containsPoint(location) {
        action()
    }
    
    activeButton.hidden = true
    defaultButton.hidden = false
}
</pre>
<p>Finally, we re-use the <code>containsPoint()</code> method described earlier in order to determine if the button was actually tapped. If it was, we call the "action" function that was provided to the constructor. Then we set the highlighted button state back to hidden, ready to be shown again on the next tap. Put it all together, and here's how you'd use the button in a game:</p>
<pre class="brush:js">
var button: GGButton = GGButton(defaultButtonImage: "button", activeButtonImage: "button_active", buttonAction: goToGameScene)
button.position = CGPointMake(self.frame.width / 2, self.frame.height / 2)
addChild(button)
</pre>
<p>I hope this was helpful. Feel free to ask questions in the comments section, and I'll do my best to answer.</p>
