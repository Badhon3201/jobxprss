import 'package:flutter/material.dart';
import 'package:jobxpress/widget/publisher_panding_widget.dart';


class publisherPandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        title: Text('Pending Jobs'),
        backgroundColor: Colors.amber,
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Stack(
            children: [
              IconButton(
                onPressed: (){},
                icon: Icon(
                  Icons.filter_list,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),*/
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )
              ),
              child: Column(
                children: [
                  publisherPandingWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
