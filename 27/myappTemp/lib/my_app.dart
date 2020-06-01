import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myappTemp/bloc/persons_bloc.dart';
import 'package:myappTemp/bloc/persons_events.dart';
import 'package:myappTemp/models/person.dart';

class MyApp extends StatelessWidget {
  final _textEditingControllerName = TextEditingController();
  final _textEditingControllerEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final PersonsBloc personsBloc = BlocProvider.of<PersonsBloc>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter name',
                    ),
                    controller: _textEditingControllerName,
                  ),
                  SizedBox(height: 20,),
                  TextField(
                      controller: _textEditingControllerEmail,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter email',
                      ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        padding: const EdgeInsets.all(10.0),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () {

                        },
                        child: new Text("Add Person", style: TextStyle(fontSize: 22),),
                      ),
                      SizedBox(width: 20,),
                      RaisedButton(
                        padding: const EdgeInsets.all(10.0),
                        textColor: Colors.white,
                        color: Colors.redAccent,
                        onPressed: () {
                          personsBloc.add(EventInsertPerson(
                              newPerson: Person(
                                  name: _textEditingControllerName.text,
                                  email: _textEditingControllerEmail.text,
                              ))
                          );
                        },
                        child: new Text("Delete", style: TextStyle(fontSize: 22),),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('haha'),
                            subtitle: Text('kekekeek'),
                          );
                        }
                    ),
                  )
                ],
              ),
            ),
          ))
    );
  }

}