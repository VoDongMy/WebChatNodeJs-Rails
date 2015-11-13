/*

Copyright (c) 2009 Dragon Interactive

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

*/
rainbows={init:function(t){$(function(){"string"==typeof t&&(t={selector:t});var i={selector:".rainbows"};$.extend(i,t),(i.from||i.to)&&rainbows.gradient(i),(i.shadow||i.highlight)&&rainbows.makeSnafucated(i)})},gradient:function(t){var i={selector:".rainbows",from:"#ffffff",to:"#000000"};$.extend(i,t),$(i.selector).each(function(){$(this).css({position:"relative",overflow:"hidden"});var t,s=$(this).height(),n=$(this).css("height"),r=[],a=[parseInt(i.from.substring(1,3),16),parseInt(i.from.substring(3,5),16),parseInt(i.from.substring(5,7),16)],o=[parseInt(i.to.substring(1,3),16),parseInt(i.to.substring(3,5),16),parseInt(i.to.substring(5,7),16)];t=this.initHTML?this.initHTML:this.innerHTML,this.initHTML=t;for(var h=0;1*s>h;h++){var e=1-(s-Math.min(h,s))/s,f=[Math.round(a[0]*(1-e)+o[0]*e),Math.round(a[1]*(1-e)+o[1]*e),Math.round(a[2]*(1-e)+o[2]*e)];r.push('<span class="rainbow rainbow-'+h+'" style="color: rgb('+f[0]+","+f[1]+","+f[2]+');"><span style="top: '+-h+'px;">'+t+"</span></span>")}this.innerHTML=r.join(""),$(this).css("height",n)})},makeSnafucated:function(t){$(t.selector).each(function(){$(this).css("position","relative"),this.initHTML?html=this.initHTML:html=this.innerHTML;var i="",s="";t.shadow&&(s='<span class="rainbows-shadow">'+html+"</span>"),t.highlight&&(i='<span class="rainbows-highlight">'+html+"</span>"),this.innerHTML=this.innerHTML+s+i})}},rainbows.init({highlight:!0,shadow:!0,from:"#ffffff",to:"#000000"});