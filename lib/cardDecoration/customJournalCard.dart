import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomJournalCard extends StatefulWidget {
  final object;
  final width;
  final type;

  const CustomJournalCard({Key key, this.object, this.width, this.type})
      : super(key: key);

  _MyCustomJournalCardState createState() => new _MyCustomJournalCardState();
}

class _MyCustomJournalCardState extends State<CustomJournalCard> {
  double width;

  //Card is the colorful display next to the journal information
  Widget _card(
      {Color primaryColor = Colors.redAccent,
      String imgPath,
      Widget backWidget}) {
    return Container(
        height: 190,
        width: widget.width * .34,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: Offset(0, 5),
                  blurRadius: 10,
                  color: Color(0x12000000))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: backWidget,
        ));
  }

  //Used to create the display for all the journal information itself
  Widget createCustomJournalCard() {
    var journalDate = DateTime.parse(widget.object.date);
    var formatter = new DateFormat('MMMM dd,yyyy');
    String formatted = formatter.format(journalDate);

    width = widget.width;
    return Container(
        height: 170,
        width: width - 20,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black))),
        child: Row(
          children: <Widget>[
            AspectRatio(
              aspectRatio: .7,
              child: _card(
                  primaryColor: Colors.blue,
                  backWidget: _decorationContainerJournal()),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15),
                Container(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        child: Text(widget.object.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                      CircleAvatar(
                        radius: 3,
                        backgroundColor: Colors.blue,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(formatted,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          )),
                      SizedBox(width: 10)
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(widget.object.details,
                    style: TextStyle(fontSize: 14)
                        .copyWith(fontSize: 12, color: Colors.black)),
                SizedBox(height: 15),
              ],
            ))
          ],
        ));
  }

  //Used to render the journal card
  Widget _decorationContainerJournal() {
    return Stack(
      children: <Widget>[
        //This is used to render the outcome.jpg image instead of previous card decoration
        Positioned(
          top: 0,
          bottom: 0,
          right: 0,
          left: 0,
          child: Image.asset('assets/images/journal/diary.png'),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    if (this.mounted) {
      setState(() {});
    }
    return createCustomJournalCard();
  }
}
