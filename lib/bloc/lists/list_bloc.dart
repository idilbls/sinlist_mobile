import 'package:flutter_bloc/flutter_bloc.dart';

class ListBloc extends Bloc<TodoEvent,TodoState>{
  TodoRepository todoRepo = TodoRepository();
  @override
  TodoState get initialState => InitialState();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async*{

    try{
      //Fetch All Todos
      if(event is FetcheTodos){
        yield RequestingState();
        List<Todo> todoList = await todoRepo.GetTodos("");
        yield FetchedTodosState(todos: todoList);
      }
      //Add New Todo
      if(event is AddNewTodo){
        yield RequestingState();
        await todoRepo.PostTodo(event.todo);
        yield RequestingState();
        List<Todo> todoList = await todoRepo.GetTodos("");
        yield FetchedTodosState(todos: todoList);
      }

      //Update Todo
      if(event is UpdateTodo){

        print('${event.todoId } : ${ event.todo}');

        yield RequestingState();
        await todoRepo.UpdateTodo(event.todoId,event.todo);
        yield RequestingState();
        List<Todo> todoList = await todoRepo.GetTodos("");
        yield FetchedTodosState(todos: todoList);
      }
      //Delete Todo
      if(event is DeleteTodo){

        print('${event.todoId }');

        yield RequestingState();
        await todoRepo.DeleteTodo(event.todoId);
        yield RequestingState();
        List<Todo> todoList = await todoRepo.GetTodos("");
        yield FetchedTodosState(todos: todoList);
      }
      //Search Todos
      //Fetch All Todos
      if(event is SearchTodos){
        yield RequestingState();
        print(event.search);
        List<Todo> todoList = await todoRepo.GetTodos(event.search);
        yield FetchedTodosState(todos: todoList);
      }
    }catch(error){
      yield ErrorState(msg: error.toString());
    }

  }

}