import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import '../stores/todo_store.dart';
import '../widgets/todo_item.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoStore = Provider.of<TodoStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Görevlerim'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: todoStore.setNewTodoTitle,
                    decoration: const InputDecoration(
                      hintText: 'Yeni görev ekle',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: todoStore.addTodo,
                  child: const Text('Ekle'),
                ),
              ],
            ),
          ),
          Observer(
            builder: (_) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Bekleyen: ${todoStore.pendingTodos}'),
                  Text('Tamamlanan: ${todoStore.completedTodos}'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Observer(
              builder: (_) {
                if (todoStore.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                
                return ListView.builder(
                  itemCount: todoStore.todos.length,
                  itemBuilder: (context, index) {
                    final todo = todoStore.todos[index];
                    return TodoItem(
                      todo: todo,
                      onToggle: () => todoStore.toggleTodo(todo),
                      onDelete: () => todoStore.removeTodo(todo),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}