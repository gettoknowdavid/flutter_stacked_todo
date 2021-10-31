import 'package:dio/dio.dart';
import 'package:flutter_stacked_architecture/models/todo.dart';
import 'package:retrofit/http.dart';

part 'retrofit_client.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:1337')
abstract class RetrofitClient {
  factory RetrofitClient(Dio dio, {String baseUrl}) = _RetrofitClient;

  @GET('/todos')
  Future<List<Todo>> getTodos();

  @POST('/todos')
  Future<Todo> addTodo(
    @Field('title') String title,
    @Field('description') String? description,
    @Field('isComplete') bool isComplete,
  );

  @DELETE('/todos/{id}')
  Future<void> deleteTodo(@Path('id') String id);

  @PUT('/todos/{id}')
  Future<Todo> editTodo(
    @Path('id') String id, {
    @Field('title') String? title,
    @Field('description') String? description,
    @Field('isComplete') bool? isComplete,
  });
}
