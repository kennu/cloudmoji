/* Cloudmoji parser */
%lex
%options easy_keyword_rules

%%
\n+     return 'EOL';
\s+     /* skip whitespace */
"🌐"    return 'STACK';
"🪪"    return 'NAME';
"🗄️"    return 'TABLE';
"🎄"    return 'API';
"🍭"    return 'ROUTE';
"🙈"    return 'COMMENT';
[\w_/{}-]+  return 'WORD';
<<EOF>> return 'EOF';

/lex

%start expressions

%%

expressions
  : el EOF
    {console.log($1); return $1;}
  ;

el
  : e EOL el
    {$$ = '(lines ' + $1 + ' \n ' + $3 + ')';}
  | e EOL
    {$$ = '(line ' + $1 + ')';}
  ;

e
  : STACK WORD
    {$$ = '(stack ' + $2 + ')';}
  | NAME WORD
    {$$ = '(name ' + $2 + ')';}
  | COMMENT WORD
    {$$ = '(comment ' + $2 + ')';}
  | API WORD
    {$$ = '(api ' + $2 + ')';}
  | ROUTE WORD WORD
    {$$ = '(route ' + $2 + ')';}
  ;
