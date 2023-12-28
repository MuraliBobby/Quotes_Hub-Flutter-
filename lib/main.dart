import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: const Home(),
  ));
}

class Home extends StatefulWidget {
   const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  List<String> quotes = [
    "All is well",
    "redBus is the world's largest online bus ticket booking service trusted by over 25 million happy customers globally. redBus offers bus ticket booking through its website, iOS and Android mobile apps for all major routes."
  ];

  void _showAddQuoteDialog(BuildContext context){
    TextEditingController textEditingController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Enter a quote'),
            content: TextField(
              controller: textEditingController,
              decoration:  InputDecoration(labelText:"Enter Your Quote"),
            ),

            actions: [
              FloatingActionButton(
                isExtended: true,
                onPressed: (){
                  setState(() {
                    quotes.add(textEditingController.text);
                  });
                  textEditingController.clear();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Add Quote',
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),

              TextButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Close"),),
            ],


          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(
            "Quotes Hub",
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 5,
          ) ,
        ),
        centerTitle: true,
        backgroundColor: Colors.red[300],
      ),

      body: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(30),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: quotes.map((quote){
            return Card(

                shape: Border.symmetric(),
                margin: EdgeInsets.all(10),
                child:  Container(

                  padding: EdgeInsets.all(10),
                    child: Row(

                      children: [

                        Flexible(
                          child: Text(
                            quote,
                            maxLines: 10,

                            overflow: TextOverflow.ellipsis ,
                          ),
                        ),
                       IconButton(
                            onPressed: (){
                              setState(() {
                                quotes.remove(quote);
                              });
                            },
                            icon: Icon(Icons.delete)
                        ),


                      ],
                    ),

                ),
            );
          }).toList(),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddQuoteDialog(context);
        },
        child: Icon(Icons.add),
      ),


    );
  }
}




