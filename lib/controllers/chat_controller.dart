import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String chatId = 'userA_userB'; // Hardcoded chat ID
  final String currentUser =
      'userA'; // Hardcoded current user (change to 'userB' for second user)

  final RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;
  final RxString lastSeen = 'Unknown'.obs;

  @override
  void onInit() {
    super.onInit();
    _setupStreams();
  }

  void _setupStreams() {
    // Messages stream
    _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .listen((snapshot) {
          messages.assignAll(snapshot.docs.map((doc) => doc.data()).toList());
        });

    // Last seen stream for the other user
    _firestore
        .collection('users')
        .doc(currentUser == 'userA' ? 'userB' : 'userA')
        .snapshots()
        .listen((snapshot) {
          final data = snapshot.data();
          if (data != null && data['lastSeen'] != null) {
            lastSeen.value = _formatLastSeen(data['lastSeen'].toDate());
          }
        });
  }

  String _formatLastSeen(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp).inMinutes;

    if (difference < 1) return 'Online now';
    if (difference < 60) return 'Last seen $difference min ago';
    return 'Last seen ${timestamp.hour}:${timestamp.minute}';
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    await _firestore.collection('chats').doc(chatId).collection('messages').add(
      {'text': text.trim(), 'sender': currentUser, 'timestamp': DateTime.now()},
    );

    // Update last seen
    await _firestore.collection('users').doc(currentUser).set({
      'lastSeen': DateTime.now(),
    }, SetOptions(merge: true));
  }
}
