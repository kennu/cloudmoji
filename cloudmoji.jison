/* Cloudmoji parser */
%lex
%options easy_keyword_rules

%%
\n+     return 'EOL';
\s+     /* skip whitespace */
"🌐"    return 'STACK';
"🪪"    return 'NAME';
"🪣"    return 'BUCKET';
"🗄️"    return 'TABLE';
"🔑"    return 'KEY';
"❗"    return 'REQ_ATTR';
"❓"    return "OPT_ATTR";
"📅"    return "DATE";
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
    {$$ = $1 + '\n' + $3;}
  | e EOL
    {$$ = $1;}
  ;

e
  : STACK WORD
    {$$ = '(stack ' + $2 + ')';}
  | NAME WORD
    {$$ = '(name ' + $2 + ')';}
  | COMMENT WORD
    {$$ = '(comment ' + $2 + ')';}
  | BUCKET WORD
    {$$ = '(bucket ' + $2 + ')';}
  | TABLE WORD
    {$$ = '(table ' + $2 + ')';}
  | KEY WORD WORD
    {$$ = '(key ' + $2 + ')';}
  | REQ_ATTR WORD WORD
    {$$ = '(reqattr ' + $2 + ')';}
  | OPT_ATTR WORD WORD
    {$$ = '(optattr ' + $2 + ')';}
  | DATE WORD WORD
    {$$ = '(date ' + $2 + ')';}
  | API WORD
    {$$ = '(api ' + $2 + ')';}
  | ROUTE WORD WORD
    {$$ = '(route ' + $2 + ')';}
  ;
