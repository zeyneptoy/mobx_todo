// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoStore on _TodoStore, Store {
  Computed<int>? _$totalTodosComputed;

  @override
  int get totalTodos => (_$totalTodosComputed ??=
          Computed<int>(() => super.totalTodos, name: '_TodoStore.totalTodos'))
      .value;
  Computed<int>? _$completedTodosComputed;

  @override
  int get completedTodos =>
      (_$completedTodosComputed ??= Computed<int>(() => super.completedTodos,
              name: '_TodoStore.completedTodos'))
          .value;
  Computed<int>? _$pendingTodosComputed;

  @override
  int get pendingTodos =>
      (_$pendingTodosComputed ??= Computed<int>(() => super.pendingTodos,
              name: '_TodoStore.pendingTodos'))
          .value;

  late final _$todosAtom = Atom(name: '_TodoStore.todos', context: context);

  @override
  ObservableList<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$newTodoTitleAtom =
      Atom(name: '_TodoStore.newTodoTitle', context: context);

  @override
  String get newTodoTitle {
    _$newTodoTitleAtom.reportRead();
    return super.newTodoTitle;
  }

  @override
  set newTodoTitle(String value) {
    _$newTodoTitleAtom.reportWrite(value, super.newTodoTitle, () {
      super.newTodoTitle = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TodoStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_TodoStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$addTodoAsyncAction =
      AsyncAction('_TodoStore.addTodo', context: context);

  @override
  Future<void> addTodo() {
    return _$addTodoAsyncAction.run(() => super.addTodo());
  }

  late final _$_TodoStoreActionController =
      ActionController(name: '_TodoStore', context: context);

  @override
  void setNewTodoTitle(String value) {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
        name: '_TodoStore.setNewTodoTitle');
    try {
      return super.setNewTodoTitle(value);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTodo(Todo todo) {
    final _$actionInfo =
        _$_TodoStoreActionController.startAction(name: '_TodoStore.removeTodo');
    try {
      return super.removeTodo(todo);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTodo(Todo todo) {
    final _$actionInfo =
        _$_TodoStoreActionController.startAction(name: '_TodoStore.toggleTodo');
    try {
      return super.toggleTodo(todo);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
newTodoTitle: ${newTodoTitle},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
totalTodos: ${totalTodos},
completedTodos: ${completedTodos},
pendingTodos: ${pendingTodos}
    ''';
  }
}
