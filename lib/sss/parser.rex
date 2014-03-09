module SSS
class Parser
macro
  BLANK                 \s+
  DIGIT                 [0-9]
  NUMBER                {DIGIT}+(\.{DIGIT}+)? # matches: 10 and 3.14
  NAME                  [a-zA-Z][\w\-]* # matches: body, background-color and myClassName
  SELECTOR              (\.|\#|\:\:|\:){NAME} # matches: #id, .class, :hover and ::before
rule
  {BLANK}               # ignores spaces, line breaks

  # Numbers
  {NUMBER}(px|em|\%)    { [:DIMENSION, text] } # 10px, 1em, 50%
  {NUMBER}              { [:NUMBER, text] } # 0
  \#[0-9A-Fa-f]{3,6}    { [:COLOR, text] } # #fff, #f0f0f0

  # Selectors
  {SELECTOR}            { [:SELECTOR, text] } # .class, #id
  {NAME}{SELECTOR}      { [:SELECTOR, text] } # div.class, body#id

  {NAME}                { [:IDENTIFIER, text] } # body, font-size

  .                     { [text, text] } # {, }, +, :, ;
end
end
