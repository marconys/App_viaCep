class CepBack4AppModel {
  List<EnderecosBack4AppModel> _enderecos = [];

  CepBack4AppModel({List<EnderecosBack4AppModel>? results}) {
    if (results != null) {
      _enderecos = results;
    }
  }

  List<EnderecosBack4AppModel>? get results => _enderecos;
  set results(List<EnderecosBack4AppModel>? results) => _enderecos = results!;

  CepBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      _enderecos = <EnderecosBack4AppModel>[];
      json['results'].forEach((v) {
        _enderecos.add(EnderecosBack4AppModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = _enderecos.map((v) => v.toJson()).toList();
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

  EnderecosBack4AppModel(
      {String? objectId,
      String? cep,
      String? logradouro,
      String? bairro,
      String? cidade,
      String? uf,
      String? createdAt,
      String? updatedAt}) {
    if (objectId != null) {
      _objectId = objectId;
    }
    if (cep != null) {
      _cep = cep;
    }
    if (logradouro != null) {
      _logradouro = logradouro;
    }
    if (bairro != null) {
      _bairro = bairro;
    }
    if (cidade != null) {
      _cidade = cidade;
    }
    if (uf != null) {
      _uf = uf;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  String? get objectId => _objectId;
  set objectId(String? objectId) => _objectId = objectId!;
  String? get cep => _cep;
  set cep(String? cep) => _cep = cep!;
  String? get logradouro => _logradouro;
  set logradouro(String? logradouro) => _logradouro = logradouro!;
  String? get bairro => _bairro;
  set bairro(String? bairro) => _bairro = bairro!;
  String? get cidade => _cidade;
  set cidade(String? cidade) => _cidade = cidade!;
  String? get uf => _uf;
  set uf(String? uf) => _uf = uf!;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt!;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt!;

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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataEnderecosBack4App = <String, dynamic>{};
    dataEnderecosBack4App['objectId'] = _objectId;
    dataEnderecosBack4App['cep'] = _cep;
    dataEnderecosBack4App['logradouro'] = _logradouro;
    dataEnderecosBack4App['bairro'] = _bairro;
    dataEnderecosBack4App['cidade'] = _cidade;
    dataEnderecosBack4App['uf'] = _uf;
    dataEnderecosBack4App['createdAt'] = _createdAt;
    dataEnderecosBack4App['updatedAt'] = _updatedAt;
    return dataEnderecosBack4App;
  }
}
