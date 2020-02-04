String.prototype.isEmpty =
  String.prototype.isEmpty ||
  function() {
    const str = this.toString()
    return str === undefined || str === null || str === ''
  }

String.prototype.toWeekday =
  String.prototype.toWeekday ||
  function() {
    const str = parseInt(this.toString())
    return [undefined, 'Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'][str]
  }
