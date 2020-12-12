import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:jobxpress/models/publishModel.dart';

class publisherPandingWidget extends StatefulWidget {
  @override
  _publisherPandingWidgetState createState() => _publisherPandingWidgetState();
}

class _publisherPandingWidgetState extends State<publisherPandingWidget> {
  @override
  bool pressGeoON = false;

  bool cmbscritta = false;

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
              boxShadow:[
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0.0,2.0),
                  blurRadius: 6.0,
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              )
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (_,index){
                final Publish chat = chats[index];

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
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: AssetImage(
                                      chat.sender.imageUrl
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width*0.45,
                                      child: Text(
                                        chat.position,
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        overflow: TextOverflow.ellipsis,

                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(chat.sender.c_name,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on,size: 16,),
                                        Text('Dhaka, Bangladesh',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.account_balance_wallet_rounded,size: 16,),
                                        Text('Negotiable',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 13.0,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                      ],
                                    ),

                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(height: 5,),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 15,),
                        Container(
                          width: MediaQuery.of(context).size.width*80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                              color: Colors.white60,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Row(
                                  children: [
                                    Icon(Icons.access_time_sharp,size: 15,),
                                    Text('Time: ${chat.time}'),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20,),
                              RaisedButton(
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(20.0),
                                    side: BorderSide(color: Colors.red)),
                                color: pressGeoON ? Colors.yellow: Colors.amber,
                                textColor: Colors.white,
                                child:  cmbscritta ? Text("Posted",style: TextStyle(fontSize: 15,color: Colors.black),): Text("Post",style: TextStyle(fontSize: 15,color: Colors.black)),
                                //    style: TextStyle(fontSize: 14)

                                onPressed: () {
                                  setState(() => chat.sender.id);
                                  setState(() => pressGeoON = !pressGeoON);
                                  setState(() => cmbscritta = !cmbscritta);
                                },
                              )
                            ],
                          ),
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
