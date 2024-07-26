class GeneralResponseModel {
  GeneralResponseModel({
    this.ok,
    this.data,
    this.status,
  });

  GeneralResponseModel.fromJson(dynamic json) {
    ok = json['ok'];
    data = json['data'];
    status = json['status'];
  }

  bool? ok;
  String? data;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ok'] = ok;
    map['data'] = data;
    map['status'] = status;
    return map;
  }
}
