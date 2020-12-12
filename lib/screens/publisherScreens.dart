import 'package:flutter/material.dart';
import 'package:jobxpress/screens/panding_jobs.dart';
import 'package:jobxpress/widget/publisher_widget.dart';

class publisherList extends StatefulWidget {
  @override
  _publisherListState createState() => _publisherListState();
}

class _publisherListState extends State<publisherList>{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )
              ),
              child: Column(
                children: [
                  publisherWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Post new Jobs', // used by assistive technologies
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => publisherPandingScreen()));
        },
       ),
    );
  }
}
