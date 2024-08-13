import { Parser } from 'jison'

const CLOUDMOJI_GRAMMAR = {
  lex: {
    rules: [
      ['\\s+', '/* skip whitespace */'],
      ['[a-f0-9]+', "return 'HEX';"],
    ],
  },
  bnf: {
    hex_strings: ['hex_strings HEX', 'HEX'],
  },
}

async function main() {
  const parser = new Parser(CLOUDMOJI_GRAMMAR)

  const parserSource = parser.generate()
  console.log(parserSource)
}

main()
  .then(() => {})
  .catch(console.error)
