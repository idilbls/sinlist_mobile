// import 'package:equatable/equatable.dart';
//
// abstract class SinlistEvent extends Equatable {}
//
// class FetcheTodos extends SinlistEvent {
//   @override
//   List<Object> get props => [];
// }
//
// class FetcheTodo extends SinlistEvent {
//   int todoId;
//   FetcheTodo({this.todoId});
//   @override
//   List<Object> get props => [todoId];
// }
//
// class AddNewTodo extends SinlistEvent {
//   Todo todo;
//   AddNewTodo({this.todo});
//   @override
//   List<Object> get props => [todo];
// }
//
// class UpdateTodo extends SinlistEvent {
//   int todoId;
//   Todo todo;
//   UpdateTodo({this.todoId, this.todo});
//   @override
//   List<Object> get props => [todoId, todo];
// }
//
// class DeleteTodo extends SinlistEvent {
//   int todoId;
//   DeleteTodo({this.todoId});
//   @override
//   List<Object> get props => [todoId];
// }
//
// class SearchTodos extends SinlistEvent {
//   String search;
//   SearchTodos({this.search});
//   @override
//   List<Object> get props => [search];
// }