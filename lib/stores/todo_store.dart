import 'package:mobx/mobx.dart';
import '../models/todo.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  @observable
  ObservableList<Todo> todos = ObservableList<Todo>();

  @observable
  String newTodoTitle = '';

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @computed
  int get totalTodos => todos.length;

  @computed
  int get completedTodos => todos.where((todo) => todo.done).length;

  @computed
  int get pendingTodos => todos.where((todo) => !todo.done).length;

  @action
  void setNewTodoTitle(String value) {
    newTodoTitle = value;
  }

  @action
  Future<void> addTodo() async {
    if (newTodoTitle.isEmpty) return;

    try {
      isLoading = true;
      final todo = Todo(
        id: DateTime.now().toIso8601String(),
        title: newTodoTitle,
      );
      
      await Future.delayed(const Duration(seconds: 1));
      todos.add(todo);
      newTodoTitle = '';
      errorMessage = null;
    } catch (e) {
      errorMessage = 'Görev eklenirken hata oluştu';
    } finally {
      isLoading = false;
    }
  }

  @action
  void removeTodo(Todo todo) {
    todos.removeWhere((t) => t.id == todo.id);
  }

  @action
  void toggleTodo(Todo todo) {
    final index = todos.indexWhere((t) => t.id == todo.id);
    if (index != -1) {
      todos[index] = todo.copyWith(
        done: !todo.done,
        completedAt: !todo.done ? DateTime.now() : null,
      );
    }
  }
}