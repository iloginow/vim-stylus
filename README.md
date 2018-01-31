# Vim Stylus

<p align="center">
   <img src="https://user-images.githubusercontent.com/23266023/35612665-a2173006-067a-11e8-9141-35b2b1bde9cc.gif"><br><a href="http://vim.org/" target="_blank">Vim</a> + <a href="http://stylus-lang.com/" target="_blank">Stylus</a> = fast, effective and convenient CSS workflow!
</p>

## Features

* All HTML5 tags and CSS3 props are covered
* Correct highlighting for interpolation and other Stylus-specific syntax
* Custom autocomplete function for CSS props and values
* Custom indentation is able to recognize selectors and function/mixin bodies
* This plugin is Vim script only, no heavy stuff

## Installation

If you use <a href="https://github.com/tpope/vim-pathogen" target="_blank">Pathogen</a> (which is highly recommended):

``` bash
cd ~/.vim/bundle
git clone git://github.com/iloginow/vim-stylus.git
```

If you use any other vim plugin manager, then I assume that you already know how to use it:)

Otherwise, you can just download this repo and unzip it right into your ```~/.vim``` directory.

## Autocomplete caveat

If you really want to take advantage of fast, effective and convenient CSS workflow, you probably need the autocomplete function to behave the same way it does on a small presentation above. You can see that it pops out automatically. And you can find several ways of doing this in <a href="http://vimdoc.sourceforge.net" target="_blank">vim's documentation</a>. But the easiest one in my opinion is a plugin called <a href="https://github.com/lifepillar/vim-mucomplete" target="_blank">MUcomplete</a>.
You can certainly choose heavy Python-powered engines like <a href="https://github.com/Valloric/YouCompleteMe" target="_blank">YouCompleteMe</a>. Just make sure that you're aware of the <a href="https://en.wikipedia.org/wiki/KISS_principle" target="_blank">KISS principle</a>:).

## Why it is not a <a href="https://github.com/wavded/vim-stylus" target="_blank">wavded/vim-stylus</a> fork?

If you're looking at this README file right now, I assume that you have most likely completed the following steps:

* Chose <a href="http://vim.org/" target="_blank">Vim</a> as your primary tool for web development
* Discovered <a href="http://stylus-lang.com/" target="_blank">Stylus</a>
* Realized that it's somehow considerably better than <a href="https://sass-lang.com/" target="_blank">SASS</a> (or <a href="http://lesscss.org/" target="_blank">LESS</a>)

So far, so good... The next question you'd probably ask yourself is how do you seamlessly integrate this amazing new tool into you workflow!? What you want is correct syntax highlighting, indentation and autocomplete. Because that's what you expect from any modern editor or IDE. If you ask google for a solution, <a href="https://github.com/wavded/vim-stylus" target="_blank">wavded/vim-stylus</a> repo is what you get.

To make a long story short, when I started to use it, poor syntax highlighting caught my eye immediately. Unfortunately, I got no autocomplete whatsoever and you could even see autoindent function do weird things from time to time. No offense to the authors, keep up the great work.

My first intention was to fork the repo and fix those bugs one by one. And I did forked the repo but when I looked at the code, I realized that it was not really a plugin but a mixture of https://github.com/lepture/vim-css and https://github.com/tpope/vim-haml roughly sewed together. Then I looked at the date of the last commit... and it was 2 years ago. And that's when I got the idea that in order to make this thing work properly I probably need to start it from scratch.

That was my story. And who knows... You might find a lot of things you don't like about my plulgin as well. Anyway, pull requests are more than welcome!!! And I promise to process them as fast as it possibly gets.
