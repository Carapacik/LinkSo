// part 'rest_client.g.dart';
//
// @RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
// abstract class RestClient {
//   factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

// @GET("/tasks")
// Future<List<Task>> getTasks();
// }

// @JsonSerializable()
// class Task {
//   String id;
//   String name;
//   String avatar;
//   String createdAt;
//
//   Task({this.id, this.name, this.avatar, this.createdAt});
//
//   factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
//   Map<String, dynamic> toJson() => _$TaskToJson(this);
// }
