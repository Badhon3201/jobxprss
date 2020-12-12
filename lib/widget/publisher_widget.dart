import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:jobxpress/api_daata/jobs_models.dart';
import 'package:jobxpress/api_daata/string_url.dart';

class publisherWidget extends StatefulWidget {
  @override
  _publisherWidgetState createState() => _publisherWidgetState();
}

class _publisherWidgetState extends State<publisherWidget> {
  bool pressGeoON = false;
  bool cmbscritta = false;
  @override
  List<JobsPublisher> jobstData = [];
  @override
  Future<JobsPublisher> getJobs()async{
    var client = http.Client();

    var response = await client.get(StringUrl.job_url);

    if(response.statusCode == 200){
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      print(jsonMap);
      setState(() {
        for(Map i in jsonMap){
          jobstData.add(JobsPublisher.fromJson(i));
          print(jobstData);
        }
      });

    }

  }
  @override
  void initState() {
    super.initState();
    getJobs();
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              )

          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: ListView.builder(
              itemCount: jobstData.length,
              itemBuilder: (_,index){
                JobsPublisher cdiscounts = jobstData[index];

                return GestureDetector(
                  onTap: (){
                    /*Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_)=>ChatScreen(
                              user: chat.sender,
                            )
                        )
                    );*/
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 5,bottom: 5,right: 10),
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    decoration: BoxDecoration(
                        color: Color(0XFFFFEFEE),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 35,
                              backgroundImage: NetworkImage(
                                  cdiscounts.imageUrl,
                              ),
                            ),
                            SizedBox(width: 10,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.45,
                                  child: Text(
                                    cdiscounts.position,
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,

                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(cdiscounts.cname,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),),
                                SizedBox(height: 10,),
                                Text('Post on: ${cdiscounts.date}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),),

                              ],
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                                child: IconButton(
                                  icon: Icon(Icons.delete,
                                    size: 30,
                                    color: Colors.black54,
                                  ),
                                  onPressed: (){
                                    print('click');
                                  },
                                )
                            ),
                            SizedBox(height: 5,),
                            /*GestureDetector(
                              onTap: (){

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Post',style: TextStyle(
                                    fontSize: 15,
                                  ),),
                                ),
                              ),
                            ),*/
                            /*GestureDetector(
                              onTap: (){
                                /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_)=>Screen(
                                          user: chat.sender,
                                        )
                                    )
                                );*/
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0),
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Post',style: TextStyle(
                                    fontSize: 15,
                                  ),),
                                ),
                              )
                            ),*/
                            RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.red)),
                              color: pressGeoON ? Colors.yellow: Colors.amber,
                              textColor: Colors.white,
                              child:  cmbscritta ? Text("Posted",style: TextStyle(fontSize: 15,color: Colors.black),): Text("Details",style: TextStyle(fontSize: 15,color: Colors.black)),
                              //    style: TextStyle(fontSize: 14)

                              onPressed: () {
                                setState(() => cdiscounts.id);
                                setState(() => pressGeoON = !pressGeoON);
                                setState(() => cmbscritta = !cmbscritta);
                              },
                            )

                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
      ),
    );
  }
}
