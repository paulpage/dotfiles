syntax region markdownHashComment matchgroup=markdownHashComment start=/#\ze[A-Za-z0-9:\/-]/ end=/\(\s\|$\)/ contains=TodoDate,@Spell keepend
highlight link markdownHashComment Comment
