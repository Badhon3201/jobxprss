import 'usermodel.dart';

class Publish{
  final User sender;
  final String time;
  final String position;
  final String date;
  final bool unread;

  Publish({this.sender,this.time,this.position,this.unread,this.date});
}

final User currentUser = User(
  id: 0,
  c_name: 'Ishraak Solution',
  imageUrl: 'images/ishraak.jpg',
);

// USERS
final User dsoft = User(
  id: 1,
  c_name: 'Datasoft',
  imageUrl: 'images/data_logo.jpg',
);
final User james = User(
  id: 2,
  c_name: 'Leads',
  imageUrl: 'images/LEADS.png',
);
final User john = User(
  id: 3,
  c_name: 'Johns IT',
  imageUrl: 'images/ishraak.jpg',
);
final User ish = User(
  id: 4,
  c_name: 'Ishraak Solution',
  imageUrl: 'images/ishraak.jpg',
);

// USERS
final User datasoft = User(
  id: 5,
  c_name: 'Datasoft',
  imageUrl: 'images/data_logo.jpg',
);
final User leads = User(
  id: 6,
  c_name: 'Leads',
  imageUrl: 'images/LEADS.png',
);



// EXAMPLE CHATS ON HOME SCREEN
List<Publish> chats = [
  Publish(
    sender: ish,
    position: 'Flutter Developer',
    time: '5:30 PM',
    date: '01/11/20',
    unread: true,
  ),
  Publish(
    sender: leads,
    time: '4:30 PM',
    date: '01/11/20',
    position: 'Apps Developer',
    unread: true,
  ),
  Publish(
    sender: john,
    date: '01/11/20',
    time: '3:30 PM',
    position: 'Web Developer',
    unread: false,
  ),
  Publish(
    sender: datasoft,
    date: '01/11/20',
    time: '2:30 PM',
    position: 'Web Application Developer',
    unread: true,
  ),
  Publish(
    sender: ish,
    time: '1:30 PM',
    date: '19/11/20',
    position: 'Web Application Developer',
    unread: false,
  ),
  Publish(
    sender: currentUser,
    time: '12:30 PM',
    date: '05/11/20',
    position: 'Flutter',
    unread: false,
  ),
];

