# Vim Stylus

<p align="center">
   <img src="https://user-images.githubusercontent.com/23266023/35612665-a2173006-067a-11e8-9141-35b2b1bde9cc.gif"><br><a href="http://vim.org/" target="_blank">Vim</a> + <a href="http://stylus-lang.com/" target="_blank">Stylus</a> = fast, effective and convinient CSS workflow!
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

If you really want to take advantage of fast, effective and convinient CSS workflow, you probably need the autocomplete function to behave the same way it does on a small presentation above. You can see that it pops out automatically. And you can find several ways of doing this in <a href="http://vimdoc.sourceforge.net" target="_blank">vim's documentation</a>. But the easiest one in my opinion is a plugin called <a href="https://github.com/lifepillar/vim-mucomplete" target="_blank">MUcomplete</a>.

You can certainly choose heavy Python-powered engines like <a href="https://github.com/Valloric/YouCompleteMe" target="_blank">YouCompleteMe</a>. But my recommendation is just <a href="https://en.wikipedia.org/wiki/KISS_principle" target="_blank">KISS</a>.
