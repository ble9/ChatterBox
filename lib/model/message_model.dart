import 'package:ChatterBox/model/user_model.dart';

class Message {
   String sender;
   String time;
   String text;
   bool isLiked;
   bool unread;
   String message;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread, message,
  });
}


final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/brian.jpg',
);

// USERS
final User brian = User(
  id: 1,
  name: 'brian',
  imageUrl: 'assets/images/brian.jpg',
);
final User josh = User(
  id: 2,
  name: 'josh',
  imageUrl: 'assets/images/josh.jpg',
);
final User job = User(
  id: 3,
  name: 'job',
  imageUrl: 'assets/images/job.jpg',
);
final User kaley = User(
  id: 4,
  name: 'kaley',
  imageUrl: 'assets/images/kaley.jpg',
);
final User sharon = User(
  id: 5,
  name: 'sharon',
  imageUrl: 'assets/images/sharon.jpg',
);
final User maddie = User(
  id: 6,
  name: 'maddie',
  imageUrl: 'assets/images/maddie.jpg',
);
final User steven = User(
  id: 7,
  name: 'Steven',
  imageUrl: 'assets/images/steven.jpg',
);

// FAVORITE CONTACTS
List<User> favorites = [sharon, steven, kaley, job, brian];

// EXAMPLE CHATS ON HOME SCREEN
//List<Message> chats = [
//  Message(
//    sender: josh,
//    time: '5:30 PM',
//    text: 'Hey, whatsup bro?',
//    isLiked: false,
//    unread: true,
//  ),
//  Message(
//    sender: kaley,
//    time: '4:30 PM',
//    text: 'Hey, can we meet today?',
//    isLiked: false,
//    unread: true,
//  ),
//  Message(
//    sender: job,
//    time: '3:30 PM',
//    text: 'Hey, when we playing together',
//    isLiked: false,
//    unread: false,
//  ),
//  Message(
//    sender: maddie,
//    time: '2:30 PM',
//    text: 'Hey, how was the exam',
//    isLiked: false,
//    unread: true,
//  ),
//  Message(
//    sender: steven,
//    time: '1:30 PM',
//    text: 'Hey, What are you doing today',
//    isLiked: false,
//    unread: false,
//  ),
//  Message(
//    sender: sharon,
//    time: '12:30 PM',
//    text: 'Hey, did you do the assignment',
//    isLiked: false,
//    unread: false,
//  ),
//  Message(
//    sender: brian,
//    time: '11:30 AM',
//    text: 'Hey, ded',
//    isLiked: false,
//    unread: false,
//  ),
//];

// EXAMPLE MESSAGES IN CHAT SCREEN
//List<Message> messages = [
//  Message(
//    sender: josh,
//    time: '5:30 PM',
//    text: 'lets go play some among us',
//    isLiked: true,
//    unread: true,
//  ),
//  Message(
//    sender: currentUser,
//    time: '4:30 PM',
//    text: 'you know being a baby and kicking and screaming',
//    isLiked: false,
//    unread: true,
//  ),
//  Message(
//    sender:josh,
//    time: '3:45 PM',
//    text: 'How\'s the baby?',
//    isLiked: false,
//    unread: true,
//  ),
//  Message(
//    sender: josh,
//    time: '3:15 PM',
//    text: 'It did not sit well in my stomach',
//    isLiked: true,
//    unread: true,
//  ),
//  Message(
//    sender: currentUser,
//    time: '2:30 PM',
//    text: 'Nice! How was it?',
//    isLiked: false,
//    unread: true,
//  ),
//  Message(
//    sender: josh,
//    time: '2:00 PM',
//    text: 'I tried out thai food',
//    isLiked: false,
//    unread: true,
//  ),
//];
