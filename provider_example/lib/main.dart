import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';

void main() {

  runApp(

      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CounterProvider()),
        ],
          child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    final counterProvider = context.watch<CounterProvider>();

    return Scaffold(
      body: ListView.builder(
        itemCount: counterProvider.notes.length,
        itemBuilder: (context, index) {
          var note = counterProvider.notes[index];
          return ListTile(
            leading: IconButton(
              onPressed: (){

                counterProvider.deleteNote(
                  note: note,
                );
              },
              icon: const Icon(Icons.delete),
            ),
            title: Text(note.title),
            subtitle: Text(note.content),

          );


      },),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
         if(counterProvider.isNoteAddAvailable){
           ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(
               content: Text('You can add only 5 notes'),
             ),
           );
          }else{
           counterProvider.addNote(
             title: 'Title 1',
             content: 'Content 1',
           );
         }

        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
