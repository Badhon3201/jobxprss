import 'package:flutter/material.dart';
import 'package:jobxpress/screens/panding_jobs.dart';
import 'package:jobxpress/screens/publisherScreens.dart';

class PubliaherHome extends StatefulWidget {
  @override
  _PubliaherHomeState createState() => _PubliaherHomeState();
}

class _PubliaherHomeState extends State<PubliaherHome> with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState(){
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 0,length: 2);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.amber,
        title: Text('Publisher',style: TextStyle(color: Colors.black),),
        elevation: 0,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(text: 'Published Jobs',),
            Tab(text: 'Pending Jobs',)
          ],
        ),
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
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          publisherList(),
          publisherPandingScreen(),
        ],
      ),
    );
  }
}
