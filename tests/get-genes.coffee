should = require 'should'
{Service} = require 'imjs'

describe "Getting genes from flymine", ->

  @slow 250

  flymine = Service.connect root: 'www.flymine.org/query'
  gettingGenes = flymine.rows
    from: 'Gene',
    select: ['symbol', 'primaryIdentifier'],
    where:
      Gene:
        lookup: "eve, zen, bib, r, h"
        extraValue: "D. melanogaster"

  it 'should find 7 primary ids', (done) ->
    gettingGenes.then( (ids) -> ids.should.have.lengthOf 7 )
                .then((-> done()), done)

  it 'should find h and H', (done) ->
    gettingGenes.then( (rows) -> (row[0] for row in rows) )
                .then( (symbols) -> (symbols.should.contain s for s in ['H', 'h']) )
                .then((-> done()), done)

