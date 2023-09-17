class CepsBack4AppModel {
  List<EnderecosBack4AppModel> enderecos = [];

  CepsBack4AppModel(this.enderecos);

  CepsBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      enderecos = <EnderecosBack4AppModel>[];
      json['results'].forEach((v) {
        enderecos.add(EnderecosBack4AppModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = enderecos.map((v) => v.toJson()).toList();
    return data;
  }
}

class EnderecosBack4AppModel {
  String _objectId = "";
  String _cep = "";
  String _logradouro = "";
  String _bairro = "";
  String _cidade = "";
  String _uf = "";
  String _createdAt = "";
  String _updatedAt = "";

  EnderecosBack4AppModel(this._cep, this._logradouro, this._bairro,
      this._cidade, this._uf, this._createdAt, this._updatedAt);

      EnderecosBack4AppModel.update(this._objectId, this._cep, this._logradouro, this._bairro, this._cidade, this._uf);

  EnderecosBack4AppModel.create(
      this._cep, this._logradouro, this._bairro, this._cidade, this._uf);

  String get objectId => _objectId;
  set objectId(String objectId) => _objectId = objectId;
  String get cep => _cep;
  set cep(String cep) => _cep = cep;
  String get logradouro => _logradouro;
  set logradouro(String logradouro) => _logradouro = logradouro;
  String get bairro => _bairro;
  set bairro(String bairro) => _bairro = bairro;
  String get cidade => _cidade;
  set cidade(String cidade) => _cidade = cidade;
  String get uf => _uf;
  set uf(String uf) => _uf = uf;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  EnderecosBack4AppModel.fromJson(Map<String, dynamic> json) {
    _objectId = json['objectId'];
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _bairro = json['bairro'];
    _cidade = json['cidade'];
    _uf = json['uf'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJsonEndpoint() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = _objectId;
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['bairro'] = _bairro;
    data['cidade'] = _cidade;
    data['uf'] = _uf;
    return data;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = _objectId;
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['bairro'] = _bairro;
    data['cidade'] = _cidade;
    data['uf'] = _uf;
    data['createdAt'] = _createdAt;
    data['updatedAt'] = _updatedAt;
    return data;
  }
}
