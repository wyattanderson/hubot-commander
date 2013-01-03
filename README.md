hubot-commander
===============

Hubot is a really interesting platform for creating bots for various chat
services. However, I feel like it would benefit from a solid command
dispatching system. Having lots of different scripts that all listen for
different regular expression matches seems clumsy.

## Fuzzy Command Matching

`hubot-commander` allows you to register commands with your robot instead of
simply listeners. Even better, you can execute these commands by fuzzy
matching instead, so a command that you would normally call as:

    hubot foo quux bar 1234.5678

could simply be called by entering:

    hubot f q b 1234.5678

## License

    Copyright (c) 2013 Wyatt Anderson

    Permission is hereby granted, free of charge, to any person obtaining
    a copy of this software and associated documentation files (the
    "Software"), to deal in the Software without restriction, including
    without limitation the rights to use, copy, modify, merge, publish,
    distribute, sublicense, and/or sell copies of the Software, and to permit
    persons to whom the Software is furnished to do so, subject to the
    following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
    THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
    FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
    DEALINGS IN THE SOFTWARE.
