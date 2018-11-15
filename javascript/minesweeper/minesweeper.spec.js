var Minesweeper = require('./minesweeper');

describe('Minesweeper()', function () {
  it('handles no rows', function () {
    var minesweeper = new Minesweeper([]);
    expect(minesweeper.annotate()).toEqual([]);
  });

  it('handles no columns', function () {
    var minesweeper = new Minesweeper(['']);
    expect(minesweeper.annotate()).toEqual(['']);
  });

  it('handles no mines', function () {
    var input = [
      '   ',
      '   ',
      '   '
    ];
    var expected = [
      '   ',
      '   ',
      '   '
    ];
    var minesweeper = new Minesweeper(input);
    expect(minesweeper.annotate(input)).toEqual(expected);
  });

  it('handles board with only mines', function () {
    var input = [
      '***',
      '***',
      '***'
    ];
    var expected = [
      '***',
      '***',
      '***'
    ];
    var minesweeper = new Minesweeper(input);
    expect(minesweeper.annotate(input)).toEqual(expected);
  });

  it('handles mine surrounded by spaces', function () {
    var input = [
      '   ',
      ' * ',
      '   '
    ];
    var expected = [
      '111',
      '1*1',
      '111'
    ];
    var minesweeper = new Minesweeper(input);
    expect(minesweeper.annotate(input)).toEqual(expected);
  });

  it('handles space surrounded by mines', function () {
    var input = [
      '***',
      '* *',
      '***'
    ];
    var expected = [
      '***',
      '*8*',
      '***'
    ];
    var minesweeper = new Minesweeper(input);
    expect(minesweeper.annotate(input)).toEqual(expected);
  });

  it('handles space surrounded by mines', function () {
    var input = [
      '***',
      '* *',
      '***'
    ];
    var expected = [
      '***',
      '*8*',
      '***'
    ];
    var minesweeper = new Minesweeper(input);
    expect(minesweeper.annotate(input)).toEqual(expected);
  });

  it('handles horizontal line', function () {
    var input = [' * * '];
    var expected = ['1*2*1'];
    var minesweeper = new Minesweeper(input);
    expect(minesweeper.annotate(input)).toEqual(expected);
  });

  it('handles horizontal line, mines at edges', function () {
    var input = ['*   *'];
    var expected = ['*1 1*'];
    var minesweeper = new Minesweeper(input);
    expect(minesweeper.annotate(input)).toEqual(expected);
  });

  it('handles vertical line', function () {
    var input = [
      ' ',
      '*',
      ' ',
      '*',
      ' '
    ];
    var expected = [
      '1',
      '*',
      '2',
      '*',
      '1'
    ];
    var minesweeper = new Minesweeper(input);
    expect(minesweeper.annotate(input)).toEqual(expected);
  });

  it('handles vertical line, mines at edges', function () {
    var input =  [
      '*',
      ' ',
      ' ',
      ' ',
      '*'
    ];
    var expected = [
      '*',
      '1',
      ' ',
      '1',
      '*'
    ];
    var minesweeper = new Minesweeper(input);
    expect(minesweeper.annotate(input)).toEqual(expected);
  });

  it('handles cross', function () {
    var input =   [
      '  *  ',
      '  *  ',
      '*****',
      '  *  ',
      '  *  '
    ];
    var expected = [
      ' 2*2 ',
      '25*52',
      '*****',
      '25*52',
      ' 2*2 '
    ];
    var minesweeper = new Minesweeper(input);
    expect(minesweeper.annotate(input)).toEqual(expected);
  });

  it('handles large board', function () {
    var input =  [
      ' *  * ',
      '  *   ',
      '    * ',
      '   * *',
      ' *  * ',
      '      '
    ];
    var expected = [
      '1*22*1',
      '12*322',
      ' 123*2',
      '112*4*',
      '1*22*2',
      '111111'
    ];
    var minesweeper = new Minesweeper(input);
    expect(minesweeper.annotate(input)).toEqual(expected);
  });
});
