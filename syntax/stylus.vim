" Vim syntax file
" Language:	Stylus
" Maintainer:	Ilia Loginov <iloginow@outlook.com>
" Created:	Jan 5, 2018

if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'stylus'
endif

syntax case ignore

" First of all define indented and not indented lines
syntax match stylusNewLine "^\S\@="
      \ nextgroup=stylusComment,stylusSelectorClass,stylusSelectorId,stylusSelectorCombinator,stylusSelectorElement,stylusSelectorAttribute,stylusVariable,stylusExplicitVariable

syntax match stylusNewLineIndented "^\s\+"
      \ nextgroup=stylusComment,stylusSelectorClass,stylusSelectorId,stylusSelectorCombinator,stylusSelectorElement,stylusSelectorAttribute,stylusSelectorReference,stylusSelectorPartialReference,stylusProperty,stylusVariable,stylusExplicitVariable

" ===============================================
" ENCLOSURES
" ===============================================

syntax match stylusEnclosure "\(\[\|\]\|{\|}\|(\|)\)"
      \ contained

highlight def link stylusEnclosure SpecialChar

" ===============================================
" VARIABLES
" ===============================================

syntax match stylusVariable "\<\(\w\|-\|\$\)*\>"
      \ contained
      \ nextgroup=stylusColor,stylusUnitInt,stylusUnitFloat,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusOperatorAssignment,stylusPropertyLookup,stylusParenthesised,stylusOperatorAdditive,stylusOperatorMultiplicative,stylusSubscript,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorVarDefinition,stylusOperatorTernary
      \ skipwhite

syntax match stylusExplicitVariable "\$\(\w\|-\|\$\)*\>"
      \ contained
      \ nextgroup=stylusColor,stylusUnitInt,stylusUnitFloat,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusOperatorAssignment,stylusPropertyLookup,stylusParenthesised,stylusOperatorAdditive,stylusOperatorMultiplicative,stylusSubscript,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorVarDefinition,stylusOperatorTernary
      \ skipwhite

syntax match stylusExplicitVariable "\<arguments\>"
      \ contained
      \ nextgroup=stylusColor,stylusUnitInt,stylusUnitFloat,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorAdditive,stylusOperatorMultiplicative,stylusSubscript,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorVarDefinition,stylusOperatorTernary
      \ skipwhite

highlight def link stylusExplicitVariable NonText

" ===============================================
" OPERATORS
" ===============================================

" Unary
syntax match stylusOperatorUnary "\([-+\!\~]\+\|\<not\>\)"
      \ contained
      \ nextgroup=stylusVariable,stylusExplicitVariable,stylusUnitInt,stylusUnitFloat,stylusParenthesised,stylusPropertyLookup,stylusOperatorUnary,stylusBoolean
      \ skipwhite

highlight def link stylusOperatorUnary Operator

" Additive
syntax match stylusOperatorAdditive "[-+]"
      \ contained
      \ nextgroup=stylusVariable,stylusExplicitVariable,stylusUnitInt,stylusUnitFloat,stylusUnitName,stylusParenthesised,stylusPropertyLookup,stylusColor
      \ skipwhite

highlight def link stylusOperatorAdditive Operator

" Multiplicative
syntax match stylusOperatorMultiplicative "\([/\%]\|\*\{1,2}\)"
      \ contained
      \ nextgroup=stylusVariable,stylusExplicitVariable,stylusUnitInt,stylusUnitFloat,stylusParenthesised,stylusPropertyLookup
      \ skipwhite
highlight def link stylusOperatorMultiplicative Operator

" Ternary
syntax match stylusOperatorTernary "[:?]"
      \ contained
      \ nextgroup=stylusUnitInt,stylusUnitFloat,stylusColor,stylusValues,stylusFont,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary,stylusBoolean
      \ skipwhite

highlight def link stylusOperatorTernary Operator

" Assignment
syntax match stylusOperatorAssignment "[:?]\=="
      \ contained
      \ nextgroup=stylusUnitInt,stylusUnitFloat,stylusColor,stylusValues,stylusFont,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary,stylusBoolean
      \ skipwhite

" Relational
syntax match stylusOperatorRelational "\(=\{2}\|\<is\>\(\s\<not\>\)\=\|\!=\|\<isnt\>\|>=\|<=\|>\|<\)"
      \ contained
      \ nextgroup=stylusUnitInt,stylusUnitFloat,stylusVariable,stylusExplicitVariable,stylusParenthesised,stylusPropertyLookup,stylusColor,stylusBoolean
      \ skipwhite

highlight def link stylusOperatorRelational Operator

" Logical
syntax match stylusOperatorLogical "\(&&\|||\|\<and\>\|\<or\>\)"
      \ contained
      \ nextgroup=stylusUnitInt,stylusUnitFloat,stylusColor,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary,stylusBoolean
      \ skipwhite

highlight def link stylusOperatorLogical Operator

" Existence
syntax match stylusOperatorExistence "\<in\>"
      \ contained
      \ nextgroup=stylusUnitInt,stylusUnitFloat,stylusColor,stylusValues,stylusFont,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary,stylusBoolean
      \ skipwhite

highlight def link stylusOperatorExistence Operator

" Instance
syntax match stylusOperatorInstance "\<is a\>"
      \ contained
      \ skipwhite

highlight def link stylusOperatorInstance Operator

" Variable definition
syntax match stylusOperatorVarDefinition "\<is defined\>"
      \ contained
      \ nextgroup=stylusOperatorLogical,stylusOperatorTernary
      \ skipwhite

highlight def link stylusOperatorVarDefinition Operator

" Comma
syntax match stylusComma ","
      \ contained
      \ nextgroup=stylusUnitInt,stylusUnitFloat,stylusColor,stylusValues,stylusFont,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary,stylusBoolean
      \ skipwhite

" Range
syntax match stylusOperatorRange "\.\.\.\="
      \ contained
      \ nextgroup=stylusUnitInt,stylusVariable,stylusExplicitVariable

highlight def link stylusOperatorRange Operator

" ===============================================
" SPRINTF
" ===============================================

syntax match stylusSprintf "%s\(.\{-}\s%\s\)\@="
      \ contained

syntax match stylusSprintf "%"
      \ contained
      \ nextgroup=stylusUnitInt,stylusUnitFloat,stylusColor,stylusValues,stylusFont,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary,stylusBoolean
      \ skipwhite

" ===============================================
" SUBSCRIPT
" ===============================================

syntax region stylusSubscript matchgroup=stylusEnclosure start="\[" end="\]"
      \ contained
      \ contains=stylusExplicitVariable,stylusVariable,stylusUnitInt,stylusParenthesised,stylusPropertyLookup
      \ keepend
      \ nextgroup=stylusUnitInt,stylusUnitFloat,stylusColor,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorAdditive,stylusOperatorMultiplicative,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary
      \ oneline

" ===============================================
" UNITS
" ===============================================

syntax match stylusUnitInt "[-+]\=\d\+%\="
      \ contained
      \ nextgroup=stylusOperatorRange,stylusUnitInt,stylusUnitFloat,stylusUnitName,stylusColor,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorAdditive,stylusOperatorMultiplicative,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary
      \ skipwhite

highlight def link stylusUnitInt Number

syntax match stylusUnitFloat "[-+]\=\d\=\.\d\+%\="
      \ contained
      \ nextgroup=stylusUnitInt,stylusUnitFloat,stylusUnitName,stylusColor,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorAdditive,stylusOperatorMultiplicative,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary
      \ skipwhite

highlight def link stylusUnitFloat Number

execute 'syntax match stylusUnitName "\(\<\|\d\@<=\)\(' . join(g:css_units, '\|') . '\)\>"
      \ contained
      \ nextgroup=stylusUnitInt,stylusUnitFloat,stylusColor,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorAdditive,stylusOperatorMultiplicative,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary
      \ skipwhite'

highlight def link stylusUnitName Number

" Resolve 'in' unit name and operator conflict
syntax match stylusOperatorExistence "\s\@<=\<in\>"
      \ contained
      \ nextgroup=stylusUnitInt,stylusUnitFloat,stylusColor,stylusValues,stylusFont,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary,stylusBoolean
      \ skipwhite

" ===============================================
" BOOLEAN
" ===============================================

syntax match stylusBoolean "\<\(true\|false\)\>"
      \ contained
      \ nextgroup=stylusOperatorRelational,stylusOperatorAssignment,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary
      \ skipwhite

highlight def link stylusBoolean Boolean

" ===============================================
" SELECTORS
" ===============================================

" HTML or SVG elements
execute 'syn match stylusSelectorElement "\<\(' . join(g:html_elements, '\|') . '\)\>"
      \ contained
      \ keepend
      \ nextgroup=stylusSelectorClass,stylusSelectorId,stylusSelectorCombinator,stylusSelectorElement,stylusSelectorAttribute,stylusSelectorPseudo,stylusSelectorReference,stylusSelectorPartialReference
      \ oneline
      \ skipwhite'

highlight def link stylusSelectorElement Statement

" CSS Class
syntax region stylusSelectorClass start="\." skip="\({.\{-}}\@=\|\w-\@=\)" end="\(\w\(\W\|$\)\@=\|}\)"
      \ contained
      \ keepend
      \ nextgroup=stylusSelectorClass,stylusSelectorId,stylusSelectorCombinator,stylusSelectorElement,stylusSelectorAttribute,stylusSelectorPseudo,stylusSelectorReference,stylusSelectorPartialReference
      \ oneline
      \ skipwhite

highlight def link stylusSelectorClass Identifier

" CSS Id
syntax region stylusSelectorId start="#" skip="\({.\{-}}\@=\|\w-\@=\)" end="\(\w\(\W\|$\)\@=\|}\)"
      \ contained
      \ keepend
      \ nextgroup=stylusSelectorClass,stylusSelectorId,stylusSelectorCombinator,stylusSelectorElement,stylusSelectorAttribute,stylusSelectorPseudo,stylusSelectorReference,stylusSelectorPartialReference
      \ oneline
      \ skipwhite

highlight def link stylusSelectorId Identifier

" Attribute selectors
syntax match stylusSelectorAttributeOperator "\(=\|\~=\||=\|\^=\|\$=\|\*=\)"
      \ contained

highlight def link stylusSelectorAttributeOperator Operator

syntax region stylusSelectorAttribute matchgroup=stylusEnclosure start="\[" skip="{.\{-}}" end="\]"
      \ contained
      \ contains=stylusSelectorAttributeOperator
      \ keepend
      \ nextgroup=stylusSelectorClass,stylusSelectorId,stylusSelectorCombinator,stylusSelectorElement,stylusSelectorAttribute,stylusSelectorPseudo,stylusSelectorReference,stylusSelectorPartialReference
      \ oneline
      \ skipwhite

highlight def link stylusSelectorAttribute Type

" Parent reference
syntax match stylusSelectorReference "\(&\|\~/\|\(\.\./\)\+\|/\)"
      \ contained
      \ nextgroup=stylusSelectorClass,stylusSelectorId,stylusSelectorCombinator,stylusSelectorElement,stylusSelectorAttribute,stylusSelectorPseudo,stylusSelectorPartialReference
      \ skipwhite

highlight def link stylusSelectorReference Statement

" Partial reference
syntax region stylusSelectorPartialReference matchgroup=stylusSelectorReference start="\^\[\@=" skip="{.\{-}}" matchgroup=NONE end="\]"
      \ contained
      \ contains=stylusEnclosure,stylusUnitInt
      \ keepend
      \ nextgroup=stylusSelectorClass,stylusSelectorId,stylusSelectorCombinator,stylusSelectorElement,stylusSelectorAttribute,stylusSelectorPseudo,stylusSelectorReference,stylusSelectorPartialReference
      \ oneline
      \ skipwhite

syntax region stylusSelectorClass start="\(&\|\~/\|\(\.\./\)\+\|/\)" skip="\({.\{-}}\@=\|\w-\@=\)" end="\(\w\(\W\|$\)\@=\|}\)"
      \ contained
      \ contains=stylusSelectorReference
      \ keepend
      \ nextgroup=stylusSelectorClass,stylusSelectorId,stylusSelectorCombinator,stylusSelectorElement,stylusSelectorAttribute,stylusSelectorPseudo,stylusSelectorReference,stylusSelectorPartialReference
      \ oneline
      \ skipwhite

" CSS pseudo classes and elements
execute 'syntax match stylusSelectorPseudo ":\(' . join(g:css_pseudo, '\|') . '\)"
      \ contained
      \ nextgroup=stylusSelectorClass,stylusSelectorId,stylusSelectorCombinator,stylusSelectorElement,stylusSelectorAttribute,stylusSelectorReference,stylusSelectorPartialReference
      \ skipwhite'

syntax match stylusSelectorPseudo ":\(\(first\|last\|only\)-\(child\|of-type\)\)"
      \ contained
      \ nextgroup=stylusSelectorClass,stylusSelectorId,stylusSelectorCombinator,stylusSelectorElement,stylusSelectorAttribute,stylusSelectorReference,stylusSelectorPartialReference
      \ skipwhite

syntax match stylusSelectorPseudo ":not(.\{-})"
      \ contained
      \ contains=stylusSelectorElement,stylusEnclosure
      \ nextgroup=stylusSelectorClass,stylusSelectorId,stylusSelectorCombinator,stylusSelectorElement,stylusSelectorAttribute,stylusSelectorReference,stylusSelectorPartialReference
      \ skipwhite

syntax match stylusSelectorPseudo ":lang(.\{-})"
      \ contained
      \ contains=stylusEnclosure
      \ nextgroup=stylusSelectorClass,stylusSelectorId,stylusSelectorCombinator,stylusSelectorElement,stylusSelectorAttribute,stylusSelectorReference,stylusSelectorPartialReference
      \ skipwhite

syntax match stylusSelectorPseudo ":\(nth-last-\|nth-\)\(child\|of-type\)(.\{-})"
      \ contained
      \ contains=stylusUnitInt,stylusEnclosure
      \ nextgroup=stylusSelectorClass,stylusSelectorId,stylusSelectorCombinator,stylusSelectorElement,stylusSelectorAttribute,stylusSelectorReference,stylusSelectorPartialReference
      \ skipwhite

syntax match stylusSelectorPseudo /::\=\(first-\(line\|letter\)\|before\|after\|selection\)/
      \ contained
      \ nextgroup=stylusSelectorClass,stylusSelectorId,stylusSelectorCombinator,stylusSelectorElement,stylusSelectorAttribute,stylusSelectorReference,stylusSelectorPartialReference
      \ skipwhite

highlight def link stylusSelectorPseudo Define

" CSS Selector operators
syntax match stylusSelectorCombinator "[>\~+|,]"
      \ contained
      \ nextgroup=stylusSelectorClass,stylusSelectorId,stylusSelectorElement,stylusSelectorAttribute,stylusSelectorReference,stylusSelectorPartialReference
      \ skipwhite

highlight def link stylusSelectorCombinator Operator

" ===============================================
" PROPERTIES
" ===============================================

execute 'syntax match stylusProperty "\<\(' . join(g:css_props, '\|') . '\)\>:\="
      \ contained
      \ nextgroup=stylusUnitInt,stylusUnitFloat,stylusColor,stylusValues,stylusFont,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary
      \ skipwhite'

execute 'syntax match stylusProperty "\<\(' . join(g:svg_props, '\|') . '\)\>:\="
      \ contained
      \ nextgroup=stylusUnitInt,stylusUnitFloat,stylusColor,stylusValues,stylusFont,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary
      \ skipwhite'

syntax match stylusProperty "\(-webkit-\|-moz-\|-o-\|-ms-\|-khtml-\)\(\w\|-\)*:\="
      \ contained
      \ nextgroup=stylusUnitInt,stylusUnitFloat,stylusColor,stylusValues,stylusFont,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary
      \ skipwhite

highlight def link stylusProperty Type

" ===============================================
" PROPERTY LOOKUP
" ===============================================

execute 'syntax match stylusPropertyLookup "@\(' . join(g:css_props, '\|') . '\)\>"
      \ contained
      \ nextgroup=stylusColor,stylusUnitInt,stylusUnitFloat,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorAdditive,stylusOperatorMultiplicative,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary
      \ skipwhite'

execute 'syntax match stylusPropertyLookup "@\(' . join(g:svg_props, '\|') . '\)\>"
      \ contained
      \ nextgroup=stylusColor,stylusUnitInt,stylusUnitFloat,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorAdditive,stylusOperatorMultiplicative,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary
      \ skipwhite'

syntax match stylusPropertyLookup "@\(-webkit-\|-moz-\|-o-\|-ms-\|-khtml-\)\(\w\|-\)*"
      \ contained
      \ nextgroup=stylusColor,stylusUnitInt,stylusUnitFloat,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorAdditive,stylusOperatorMultiplicative,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary
      \ skipwhite

highlight def link stylusPropertyLookup Type

" ===============================================
" VALUES
" ===============================================

execute 'syntax match stylusValues "\<\(' . join(g:css_values, '\|') . '\)\>"
      \ contained
      \ nextgroup=stylusColor,stylusUnitInt,stylusUnitFloat,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary
      \ skipwhite'

execute 'syntax match stylusValues "\<\(' . join(g:css_animatable_props, '\|') . '\)\>"
      \ contained
      \ nextgroup=stylusColor,stylusUnitInt,stylusUnitFloat,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary
      \ skipwhite'

highlight def link stylusValues PreCondit

" ===============================================
" COLORS
" ===============================================

" Named
execute 'syntax match stylusColor "\<\(' . join(g:css_colors, '\|') . '\)\>"
      \ contained
      \ nextgroup=stylusColor,stylusUnitInt,stylusUnitFloat,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary,stylusOperatorAdditive
      \ skipwhite'

syntax match stylusColor "\<transparent\>"
      \ contained
      \ nextgroup=stylusColor,stylusUnitInt,stylusUnitFloat,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary,stylusOperatorAdditive
      \ skipwhite

" Hexadecimal
syntax match stylusColor "#\x\{3,6\}\>"
      \ contained
      \ nextgroup=stylusColor,stylusUnitInt,stylusUnitFloat,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary,stylusOperatorAdditive
      \ skipwhite

highlight stylusColor term=underline ctermfg=133 guifg=#b169b2

" ===============================================
" FONT
" ===============================================

" Highlight generic font families
syntax match stylusFont "\<\(serif\|sans-serif\|monospace\)\>"
      \ contained
      \ nextgroup=stylusColor,stylusUnitInt,stylusUnitFloat,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary
      \ skipwhite

highlight def link stylusFont Directory

" ===============================================
" Explicitly point out that the word before assignment operator is a variable
syntax match stylusVariable "\<\(\w\|-\|\$\)*\(\s\=[:?]\==[^=]\)\@="
      \ contained
      \ nextgroup=stylusOperatorAssignment
      \ skipwhite
" ===============================================

" ===============================================
" PARENTHESISED EXPRESSIONS
" ===============================================

syntax region stylusParenthesised matchgroup=stylusEnclosure start="[^\w\s]\@<=(" skip=/["'].\{-}["']/ end=")"
      \ contained
      \ contains=stylusColor,stylusUnitInt,stylusUnitFloat,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorAdditive,stylusOperatorMultiplicative,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary
      \ keepend
      \ nextgroup=stylusColor,stylusUnitInt,stylusUnitFloat,stylusUnitName,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorAdditive,stylusOperatorMultiplicative,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary
      \ oneline
      \ skipwhite

" ===============================================
" STRINGS
" ===============================================

syntax region stylusString start=/\('\|"\)/ end=/\('\|"\)/
      \ containedin=ALLBUT,stylusComment
      \ contains=stylusSprintf
      \ keepend
      \ nextgroup=stylusColor,stylusUnitInt,stylusUnitFloat,stylusValues,stylusFont,stylusComma,stylusVariable,stylusExplicitVariable,stylusPropertyLookup,stylusParenthesised,stylusOperatorUnary,stylusOperatorAdditive,stylusOperatorRelational,stylusOperatorLogical,stylusOperatorExistence,stylusOperatorInstance,stylusOperatorTernary,stylusSprintf
      \ oneline
      \ skipwhite

highlight def link stylusString String

" ===============================================
" COMMENTS
" ===============================================

" Single-line
syntax region stylusComment start="//" end="$"
      \ containedin=ALLBUT,stylusString
      \ keepend
      \ oneline

" Multi-line
syntax region stylusComment start="/\*" end="\*/"
      \ containedin=ALLBUT,stylusString
      \ keepend

highlight def link stylusComment Comment

" ===============================================

let b:current_syntax = "stylus"
