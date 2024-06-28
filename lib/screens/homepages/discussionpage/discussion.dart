import 'package:flutter/material.dart';
import 'package:learningapp/features/searchbar1.dart';

class DiscussionPage extends StatefulWidget {
  @override
  _DiscussionPageState createState() => _DiscussionPageState();
}

class _DiscussionPageState extends State<DiscussionPage> {
  String? activeReplyText;
  List<Comment> comments = [];

  @override
  void initState() {
    super.initState();
    comments = [
      Comment('Container 1 Text', 'Reply 1'),
      Comment('Container 2 Text', 'Reply 2'),
      Comment('Container 3 Text', 'Reply 3'),
      Comment('Container 4 Text', 'Reply 4'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.height * 0.19,
              child: Image.asset(
                'assets/ob97.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08),
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              color: Color(0xFF7D7CC9),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Discussion Forum',
                              style: TextStyle(
                                color: Color(0xFF7D7CC9),
                                fontSize: 24.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: buildSearchBar(),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: comments.map((comment) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal:16.0),
                          child: Column(
                            children: [
                              buildContainerWithText(comment),
                              SizedBox(height: 4),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        addComment();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF7D7CC9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Add Comment',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildContainerWithText(Comment comment) {
    TextEditingController replyController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 10,
              backgroundImage: AssetImage('assets/ob96.png'),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(8), // Adjusted padding
                color: Colors.grey[200],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      comment.text,
                      style: TextStyle(
                        fontSize: 16, // Adjusted font size
                      ),
                    ),
                    SizedBox(height: 20), // Adjusted spacing
                    buildDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: comment.replyText == activeReplyText,
                          child: Expanded(
                            child: TextFormField(
                              controller: replyController,
                              decoration: InputDecoration(
                                hintText: 'Type your reply...',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    sendReply(
                                        comment, replyController.text);
                                  },
                                  icon: Icon(Icons.send),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: comment.replyText == activeReplyText,
                          child: SizedBox(
                            width: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showReplyField(comment.replyText);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8.0),
                              // border: Border.all(color: Color(0xFF7D7CC9)),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 6.0),
                            child: Text(
                              'Reply',
                              style:
                                  TextStyle(color: Color(0xFF7D7CC9)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void showReplyField(String replyText) {
    setState(() {
      activeReplyText = replyText;
    });
  }

  void sendReply(Comment originalComment, String replyText) {
    print('Replying to: ${originalComment.text} with: $replyText');
    setState(() {
      activeReplyText = null;
    });
  }

  Widget buildDivider() {
    return Divider(
      color: Colors.grey,
      thickness: 1,
      height: 0,
    );
  }

  void addComment() {
    setState(() {
      comments.add(Comment('New Container Text', 'New Reply'));
    });
  }
}

class Comment {
  final String text;
  final String replyText;

  Comment(this.text, this.replyText);
}
