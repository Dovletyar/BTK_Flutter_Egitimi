class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({required this.id, required this.todoText, this.isDone=false});

  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', todoText: 'Take a shower', isDone: true),
      ToDo(id: '02', todoText: 'Bakkala git', isDone: true),
      ToDo(id: '03', todoText: 'Play basketball',),
      ToDo(id: '04', todoText: 'Hang out with friends',),

    ];
  }
}