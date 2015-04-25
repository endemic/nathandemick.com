---
layout: post
status: publish
published: true
title: Object-oriented programming with JavaScript
author:
  display_name: nathan
  login: nathan
  email: ndemick@gmail.com
  url: ''
author_login: nathan
author_email: ndemick@gmail.com
wordpress_id: 561
wordpress_url: http://ganbarugames.com/?p=561
date: '2012-09-10 15:30:35 -0400'
date_gmt: '2012-09-10 19:30:35 -0400'
categories:
- Programming
tags:
- programming
- tutorial
- javascript
comments: []
---
<p>So, here's how to easily create your own prototype-based classes in JavaScript. Seems confusing to lots of folks, and there are multiple ways to do it. If you use <a href="http://coffeescript.org/" title="CoffeeScript">CoffeeScript</a>, you can write your classes in a more traditional OO style. However, it's really not too complicated in plain JavaScript. </p>
<h3>Step One: Write Your Constructor</h3>
<p>A common convention is to capitalize variables that refer to classes that need to be instantiated with the "new" keyword. </p>
<pre class="brush:js">
var MyClass,
    instance;

MyClass = function () {
    // This is the constructor - do any initialization here!
    // "this" refers to the current instance of the class
    this.instanceVariable = 42;
};

instance = new MyClass();
console.log(instance.instanceVariable);  // 42
</pre>
<h3>Step Two: Write Instance Methods</h3>
<p>Available to all instances of the class, even ones created before the method was written!</p>
<pre class="brush:js">
MyClass.prototype.instanceMethod = function (argument) {
    // "this" refers to the class instance
    this.instanceVariable = argument;
};

instance.instanceMethod("Wut?");

console.log(instance.instanceVariable);  // "Wut?"
</pre>
<h3>Step Two &frac12;: Wrong Way to Write Instance Methods</h3>
<p>It can be tempting to write instance methods <em>inside</em> your constructor function, perhaps for style/organizational purposes. However, it's inefficient to do so, because each method is created every time you create an instance of your class.</p>
<pre class="brush:js">
// Wrong!
var MyClass = function () {
    this.instanceMethod = function (argument) {
        // "this" refers to the class instance
        this.instanceVariable = argument;
    };
};
</pre>
<h3>Step Three: Write Static Class Methods</h3>
<p>These methods can be used without creating an instance of the class. For example, if you've ever used the <code>Math</code> object, you've used a static method (for example, <code>Math.cos(Math.PI)</code>).</p>
<pre class="brush:js">
MyClass.staticMethod = function (argument) {
    var results = "Hello " + argument;
    console.log(results);
};

MyClass.staticMethod("World");  // "Hello World"
</pre>
<h3>Step Four: Inheritance</h3>
<p>Say I want to create a subclass of the <code>MyClass</code> class. This part is a bit awkward, but doable. </p>
<pre class="brush:js">
var otherInstance,
    MyOtherClass;

MyOtherClass = function (argument) {
    MyClass.call(this);  // Invokes MyClass's constructor
    this.otherInstanceVariable = argument;
};

// Set up prototype (inheritance) chain
MyOtherClass.prototype = new MyClass();

// Instantiate new object
otherInstance = new MyOtherClass("What?");

console.log(otherInstance.instanceVariable);  // 42 (inherited from MyClass)
console.log(otherInstance.otherInstanceVariable);  // "What?"

otherInstance.instanceMethod("Wut?");  // (inherited from MyClass)
console.log(otherInstance.instanceVariable);  // "Wut?"

// Extend the "instanceMethod" method
MyOtherClass.prototype.instanceMethod = function (argument) {
    MyClass.prototype.instanceMethod.call(this, argument);  // Equivalent of calling "super"
};
</pre>
<p>Hope that helps get you started. JavaScript is really not a bad little language once you get the hang of it. The fact that it can be run in any browser and accessed with interactive developer consoles makes it an easy language to learn and play around with. It's also by far the language <em>du jour</em> on the internets, so learning it could have a beneficial effect for your job opportunities!</p>
