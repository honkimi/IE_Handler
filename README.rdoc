= ie_handler

* https://github.com/honkimi/IE_Handler

== DESCRIPTION:

IE Handler enable you to handle IE using Ruby.
It has simple syntax and strong methods.
Currently we support only IE, but we plan to extend other MS products in the
future.

== FEATURES/PROBLEMS:

require this file and create ie object.
<pre>
require './lib/IEPage'
ie = IEPage.new("http://google.com")
</pre>

You can access document like DOM.
Make sure that you need to call "find" method at the first.
The method initialize the current dom object.
<pre>
ie.find.name('Text',0) #=> getElementsByName("Text").item(0)
ie.find.id("container") #=> getElementById("container")
ie.find.tag("table",2) #=> getElementsByTagName("table").itemn(2)
</pre>

We support "Saved Access" which hold the current dom object.
<pre>
tr = ie.find.tag('table',12).tag('tr',1)
tr.sa.tag('td',1)
tr.sa.tag('td',2)
...
</pre>

Other convinient methods.
<pre>
ie.wait
ie.close
ie.back
ie.go(url)
ie.tag('tr').each....
ie.id('hoge').html
ie.id('sbmt_btn').click
</pre>

You can also add some elements.
<pre>
div = IEPage.make_elemn(ie, "div")
div.value = "test"
div.attr("id", "item")
ie.id('list').add(div)
</pre>

For debugging.
methods method output the all of the Win32OLE methods.
<pre>
ie.methods
ie.methods(/^on/)
ie.method("Click")
</pre>

You can use origin Win32OLE method.
<pre>
ie.getElementById(...) 
</pre>
You can search the methods by using "methods, method" method.


== REQUIREMENTS:

* Windows Machine
* Over Ruby 1.8

== INSTALL:

* sudo gem install

== LICENSE:

(The MIT License)

Copyright (c) 2012 FIXME full name

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
