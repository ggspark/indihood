import 'package:flutter/material.dart';

///A common card widget to render the rows of widgets provided by children
class CommonCard extends StatefulWidget {
  ///Title to display on top of card
  final String title;

  ///List of widgets which have to rendered in rows of 2 columns
  final List<Widget> children;

  ///Number of rows to show when card is collapsed
  final int collapsedRows;

  ///Text of expand button when the card is collapsed
  final String expandButtonTitle;

  ///Text of collapse button when the card is expanded
  final String collapseButtonTitle;

  ///Constructor to initialise the fields
  const CommonCard({
    Key key,
    @required this.title,
    @required this.children,
    this.collapsedRows = 2,
    this.expandButtonTitle = "SEE MORE",
    this.collapseButtonTitle = "SEE LESS",
  }) : super(key: key);

  @override
  _CommonCardState createState() => _CommonCardState();
}

class _CommonCardState extends State<CommonCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> rows = _buildRow();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFCED7DB),
          width: 1,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Column(
            children: expanded
                ? rows
                : rows.sublist(
                    0,
                    rows.length > widget.collapsedRows
                        ? widget.collapsedRows
                        : rows.length),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: rows.length > widget.collapsedRows
                ? FlatButton(
                    child: Text(expanded
                        ? widget.collapseButtonTitle
                        : widget.expandButtonTitle),
                    textColor: Colors.blueAccent,
                    onPressed: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildRow() {
    List<Widget> rows = <Widget>[];
    for (int index = 0; index < widget.children.length - 1; index += 2) {
      rows.add(
        DoubleElementRow(widget.children[index], widget.children[index + 1]),
      );
    }
    if (widget.children.length % 2 == 1) {
      rows.add(
        DoubleElementRow(widget.children.last, Container()),
      );
    }
    return rows;
  }
}

///A widget to render a row of 2 widgets side by side
class DoubleElementRow extends StatelessWidget {
  final Widget _child1;
  final Widget _child2;

  ///Constructor to initialise the fields
  const DoubleElementRow(this._child1, this._child2, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: _child1,
          ),
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: _child2,
          ),
        ),
      ],
    );
  }
}
