should = require 'should'
{Service} = require 'imjs'

describe 'Getting the model from flymine', ->

  @slow 250

  flymine = Service.connect root: 'www.flymine.org/query'

  gettingModel = flymine.fetchModel()

  it 'should find the Gene class', (done) ->
    gettingModel.then( (model) -> should.exist model.classes.Gene )
                .then((-> done()), done)

  it 'should find that the Gene class has a symbol field', (done) ->
    gettingModel.then( (model) -> should.exist model.classes.Gene.fields.symbol )
                .then((-> done()), done)
