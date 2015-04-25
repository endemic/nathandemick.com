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

So, here's how to easily create your own prototype-based classes in JavaScript. 
Seems confusing to lots of folks, and there are multiple ways to do it. If you 
use [CoffeeScript](http://coffeescript.org), you can write your classes in a 
more traditional OO style. However, it's really not too complicated in plain 
JavaScript. 

### Step One: Write Your Constructor

A common convention is to capitalize variables that refer to classes that need 
to be instantiated with the "new" keyword. 

<pre><code class="language-javascript">
var MyClass,
    instance;

MyClass = function () {
    // This is the constructor - do any initialization here!
    // "this" refers to the current instance of the class
    this.instanceVariable = 42;
};

instance = new MyClass();
console.log(instance.instanceVariable);  // 42
</code></pre>

### Step Two: Write Instance Methods

Available to all instances of the class, even ones created before the method was 
written!

<pre><code class="language-javascript">
MyClass.prototype.instanceMethod = function (argument) {
    // "this" refers to the class instance
    this.instanceVariable = argument;
};

instance.instanceMethod("Wut?");

console.log(instance.instanceVariable);  // "Wut?"
</code></pre>

### Step Two &frac12;: Wrong Way to Write Instance Methods

It can be tempting to write instance methods _inside_ your constructor function, 
perhaps for style/organizational purposes. However, it's inefficient to do so, 
because each method is created every time you create an instance of your class.

<pre><code class="language-javascript">
// Wrong!
var MyClass = function () {
    this.instanceMethod = function (argument) {
        // "this" refers to the class instance
        this.instanceVariable = argument;
    };
};
</code></pre>

### Step Three: Write Static Class Methods

These methods can be used without creating an instance of the class. For 
example, if you've ever used the <code>Math</code> object, you've used a static 
method (for example, <code>Math.cos(Math.PI)</code>).

<pre><code class="language-javascript">
MyClass.staticMethod = function (argument) {
    var results = "Hello " + argument;
    console.log(results);
};

MyClass.staticMethod("World");  // "Hello World"
</code></pre>

### Step Four: Inheritance

Say I want to create a subclass of the <code>MyClass</code> class. This part is 
a bit awkward, but doable. 

<pre><code class="language-javascript">
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
</code></pre>

Hope that helps get you started. JavaScript is really not a bad little language 
once you get the hang of it. The fact that it can be run in any browser and 
accessed with interactive developer consoles makes it an easy language to learn 
and play around with. It's also by far the language _du jour_ on the internets, 
so learning it could have a beneficial effect for your job opportunities!
