# avrdude-friend

<!---
vim: tw=74 ai ts=4 sts=4 expandtab:
-->

    $(echo "2017-04-09 Osamu Aoki <osamu#debian.org>" | sed 's/#/@/')

Since this patch is accepted in the upstream, this is only FYI.

I will use this repo's wiki to record some information related to AVR
systems I play with.  See https://github.com/osamuaoki/avrdude-friend/wiki

## Scripts related to avrdude

* Makefile: burn arduino flash to ATMega328P using TTL-232R-5V etc.
* 0002-avrdude-ft245r-reset.patch: patch to fix ft232r chip as isp
    * Fixed in Debian avrdude (6.1-2) See Bug #760764 (Thu, 11 Sep 2014)
    * Fixed in the upstream
* .avrduderc: additional definition
    * No more needed since fixed in the upstream

Please read http://goofing-with-computer.blogspot.jp/ (Mostly in Japanese)
You can contact me in Japanese or English.

## LICENSE

Unless otherwise stated, all these files in this tarball/git-repo are licensed
as follows:

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

