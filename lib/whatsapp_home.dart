import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:whatsappclone/pages/call_screen.dart';
import 'package:whatsappclone/pages/camera_screen.dart';
import 'package:whatsappclone/pages/chat_screen.dart';
import 'package:whatsappclone/pages/status_screen.dart';

class WhatsAppHome extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const WhatsAppHome({super.key, this.cameras});

  @override
  State<WhatsAppHome> createState() => _WhatsAppHomeState();
}

class _WhatsAppHomeState extends State<WhatsAppHome>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  bool showFab = true;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(vsync: this, initialIndex: 1, length: 4);
    _tabController!.addListener(() {
      if (_tabController!.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WhatsApp"),
        elevation: 0.7,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "CHATS"),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            ),
          ],
        ),
        actions: const <Widget>[
          Icon(Icons.search),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0),
          ),
          Icon(Icons.more_vert)
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          CameraScreen(widget.cameras!),
          ChatScreen(),
          const StatusScreen(),
          const CallsScreen(),
        ],
      ),
      floatingActionButton: showFab
          ? FloatingActionButton(
              backgroundColor: Theme.of(context).cardColor,
              child: const Icon(
                Icons.message,
                color: Colors.white,
              ),
              onPressed: () => print("open chats"),
            )
          : null,
    );
  }
}
