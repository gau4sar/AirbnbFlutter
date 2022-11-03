class AirbnbModel {
  String? nhits;

  AirbnbModel({this.nhits});

  AirbnbModel.fromJson(Map<String, dynamic> json) {
    nhits = json['nhits'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nhits'] = this.nhits;
    return data;
  }
}