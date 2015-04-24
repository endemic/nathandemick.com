---
layout: post
status: publish
published: true
title: Populate a form with a serialized data string using jQuery
author:
  display_name: Nathan
  login: admin
  email: ndemick@gmail.com
  url: ''
author_login: admin
author_email: ndemick@gmail.com
wordpress_id: 421
wordpress_url: http://nathandemick.com/?p=421
date: '2011-04-21 14:50:19 -0400'
date_gmt: '2011-04-21 19:50:19 -0400'
categories:
- programming
tags: []
comments:
- id: 282
  author: andy
  author_email: andy@teamsoell.com
  author_url: http://andy.teamsoell.com
  date: '2011-04-22 12:22:33 -0400'
  date_gmt: '2011-04-22 17:22:33 -0400'
  content: "Looks good, but you could make it even better by setting it up as a chainable
    jQuery method that you could call against a form object:\r\n\r\njQuery.fn.loadSerializedData(data)
    {\r\n...\r\n}\r\n\r\nReplace references to formId with $(this) and then just call
    the method on a form object with:\r\n\r\n$('#myForm').loadSerializedData($myDataString);"
---
OK, so you know about the great jQuery utility method <code>serialize()</code>,
which, when applied to a jQuery object that represents a form, will turn all the
form data into a key/value serialized string. Randomly, I was asked if it was
possible to do the reverse. jQuery doesn't have a method like that baked in, so
here's my implementation.

<pre class="brush:js">
function loadSerializedData(formId, data)
{
	var tmp = data.split('&amp;'), dataObj = {};

	// Bust apart the serialized data string into an obj
	for (var i = 0; i &lt; tmp.length; i++)
	{
		var keyValPair = tmp[i].split(&#039;=&#039;);
		dataObj[keyValPair[0]] = keyValPair[1];
	}

	// Loop thru form and assign each HTML tag the appropriate value
	$(&#039;#&#039; + formId + &#039; :input&#039;).each(function(index, element) {
		if (dataObj[$(this).attr(&#039;name&#039;)])
			$(this).val(dataObj[$(this).attr(&#039;name&#039;)]);
	});
}
</pre>

Is there a better way to do this? Let me know in the comments.
