import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger iOS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MessengeriOS(),
    );
  }
}

class MessengeriOS extends StatefulWidget {
  const MessengeriOS({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MessengeriOSScreen createState() => _MessengeriOSScreen();
}

class _MessengeriOSScreen extends State<MessengeriOS> {
  final lengthListFriend = 50;

  List<String> listNameRandom = [
    'Brian',
    'Jamie',
    'Loredana',
    'Smith',
    'Nguyen',
    'Chuang',
    'Crew',
    'Karan',
    'Jeremy',
  ];

  List<String> listNameChatRandom = [
    'Jeremy Goldberg',
    'James Nuemann',
    'Alice Chuang',
    'Nguyễn Cường',
    'Alice Joyce',
    'Leon Hobb',
    'Loree Sieligowski',
    'Jacquetta Akhavan',
    'Julietta Coale',
    'Bryon Kummerow',
  ];

  List<String> listMessagesChat = [
    'Hey, how\'s it going?',
    'Let\'s get boba tonight?',
    'K sound good',
    'See you there!',
    'Nice',
    'LOL!',
    'Hi',
    'Xin chào',
    'alo',
    ':3',
    ':))',
    '=))',
    ':)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _buildDrawer(),
        // backgroundColor: Colors.blue,
        backgroundColor: Colors.white24,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Messages",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          _buildCupertinoSearch(),
          Expanded(
            flex: 1,
            child: _buildListViewStory(),
          ),
          Expanded(
            flex: 4,
            child: _buildListViewChat(),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  String _buildRandomPicture() {
    List<String> listImageRadom = [
      'assets/avatar 1.jpg',
      'assets/avatar 2.jpg',
      'assets/avatar 4.jpg',
      'assets/avatar 5.jpg',
      'assets/avatar 6.jpg',
      'assets/avatar 7.jpg',
      'assets/avatar 8.jpg',
      'assets/avatar 9.jpg',
      'assets/avatar 10.jpg',
    ];

    listImageRadom.shuffle();
    String pathImage = listImageRadom[0];

    return pathImage;
  }

  String _buildRandomNameStory() {
    listNameRandom.shuffle();
    String nameRandomStory = listNameRandom[0];

    return nameRandomStory;
  }

  Widget _buildDrawer() {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[400],
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/avatar 3.jpg',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0,
      iconSize: 30,
      fixedColor: Colors.black,
      items: const [
        BottomNavigationBarItem(
          label: 'Chats',
          icon: Icon(Icons.message),
        ),
        BottomNavigationBarItem(
          label: 'People',
          icon: Icon(Icons.people),
        ),
      ],
    );
  }

  Widget _buildCupertinoSearch() {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 8,
      ),
      child: const CupertinoSearchTextField(),
    );
  }

  Widget _buildAddStory() {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 7,
                top: 16,
              ),
              padding: const EdgeInsets.all(11),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
              ),
              child: const Icon(
                Icons.add,
                size: 40,
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 12,
            top: 14,
          ),
          child: Text(
            "Your Story",
            style: TextStyle(
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildViewStory(String avatarStory, String nameStory) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 75,
              width: 75,
              margin: const EdgeInsets.only(
                left: 7,
                top: 3,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue,
                  width: 3,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.all(2.5),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  avatarStory,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 12,
            top: 14,
          ),
          child: Text(
            nameStory,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListViewStory() {
    return ListView.builder(
      // shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: listNameRandom.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            if (index == 0) _buildAddStory(),
            _buildViewStory(_buildRandomPicture(), _buildRandomNameStory()),
          ],
        );
      },
    );
  }

  String _randomNameChat() {
    listNameChatRandom.shuffle();

    return listNameChatRandom[0];
  }

  String _randomMessagesChat() {
    listMessagesChat.shuffle();

    return listMessagesChat[0];
  }

  Widget _buildAvatarChat(String avatarChat) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 70,
          margin: const EdgeInsets.only(left: 8),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            avatarChat,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildMessages() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 8,
            top: 10,
          ),
          child: Text(
            _randomNameChat(),
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 10,
          ),
          child: Text(
            _randomMessagesChat(),
          ),
        ),
      ],
    );
  }

  Widget _buildListViewChat() {
    return ListView.separated(
      itemCount: 20,
      itemBuilder: (context, index) {
        return Row(
          children: [
            _buildAvatarChat(_buildRandomPicture()),
            _buildMessages(),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 12,
        );
      },
    );
  }
}
