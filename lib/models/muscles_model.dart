class MusclesModel {
  List<Result> result = [];
  MusclesModel.fromJson(Map<String, dynamic> json) {
    result.add(Result.fromJson(json));
  }
}

class Result {
  late String force;
  late String name;
  late String youtube;
  Result.fromJson(Map<String, dynamic> json) {
    force = json["force"];
    name = json["name"];
    youtube = json["Youtube link"];
  }
}
