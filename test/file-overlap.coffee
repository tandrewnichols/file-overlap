describe 'file-overlap', ->
  Given -> @subject = require '../lib/file-overlap'

  describe '.overlap', ->
    context 'absolute path and file', ->
      Then -> @subject.overlap('/foo/bar/baz', 'bar/baz/banana.js').should.eql 'bar/baz'

    context 'file and absolute path', ->
      Then -> @subject.overlap('bar/baz/banana.js', '/foo/bar/baz').should.eql 'bar/baz'
      
    context 'two absolute paths', ->
      Then -> @subject.overlap('/foo/bar/baz/banana.js', '/foo/bar/baz').should.eql '/foo/bar/baz'
      
    context 'two relative paths', ->
      Then -> @subject.overlap('foo/bar/baz/banana.js', 'bar/baz').should.eql 'bar/baz'

    context 'only a', ->
      Then -> @subject.overlap('foo/bar/baz/banana.js').should.eql ''

    context 'only b', ->
      Then -> @subject.overlap(undefined, 'foo/bar/baz/banana.js').should.eql ''

    context 'neither a nor b', ->
      Then -> @subject.overlap().should.eql ''
      
      
  describe '.difference', ->
    context 'absolute path and file', ->
      Then -> @subject.difference('/foo/bar/baz', 'bar/baz/banana.js').should.eql '/foo'

    context 'file and absolute path', ->
      Then -> @subject.difference('bar/baz/banana.js', '/foo/bar/baz').should.eql 'banana.js'
      
    context 'two absolute paths', ->
      Then -> @subject.difference('/foo/bar/baz/banana.js', '/foo/bar/baz').should.eql 'banana.js'
      
    context 'two relative paths', ->
      Then -> @subject.difference('foo/bar/baz/banana.js', 'bar/baz').should.eql 'foo'

    context 'only a', ->
      Then -> @subject.difference('foo/bar/baz/banana.js').should.eql 'foo/bar/baz/banana.js'

    context 'only b', ->
      Then -> @subject.difference(undefined, 'foo/bar/baz/banana.js').should.eql 'foo/bar/baz/banana.js'

    context 'neither a nor b', ->
      Then -> @subject.difference().should.eql ''

  describe '.differenceRight', ->
    context 'absolute path and file', ->
      Then -> @subject.differenceRight('/foo/bar/baz', 'bar/baz/banana.js').should.eql 'banana.js'

    context 'file and absolute path', ->
      Then -> @subject.differenceRight('bar/baz/banana.js', '/foo/bar/baz').should.eql '/foo'
      
    context 'two absolute paths', ->
      Then -> @subject.differenceRight('/foo/bar/baz/banana.js', '/foo/bar/baz').should.eql ''
      
    context 'two relative paths', ->
      Then -> @subject.differenceRight('foo/bar/baz/banana.js', 'bar/baz').should.eql ''

    context 'only a', ->
      Then -> @subject.difference('foo/bar/baz/banana.js').should.eql 'foo/bar/baz/banana.js'

    context 'only b', ->
      Then -> @subject.difference(undefined, 'foo/bar/baz/banana.js').should.eql 'foo/bar/baz/banana.js'

    context 'neither a nor b', ->
      Then -> @subject.difference().should.eql ''
