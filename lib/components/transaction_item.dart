import 'dart:math';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  final Transaction tr;
  final void Function(String p1) onRemove;
  
  const TransactionItem({
    required Key key,
    required this.tr,
    required this.onRemove,
  }) : super (key: key);


  @override 
  _TransactionItemState createState() => _TransactionItemState();

}

class _TransactionItemState extends State<TransactionItem> {

 static const colors = [
    Colors.red,
    Colors.purple,
    Colors.orange,
    Colors.blue,
    Colors.black,
  ];

  Color? _backgroundColor;
  @override
  void initState() {
    super.initState();
    int i = Random().nextInt(5);
    _backgroundColor = colors[i];
  }


  @override
  Widget build(BuildContext context) {
     final tr = widget.tr;
    final onRemove = widget.onRemove;

    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: _backgroundColor,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                child: Text(
                  'R\$${tr.value}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            tr.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          subtitle: Text(
            DateFormat('d MMM y').format(tr.date),
          ),
          trailing: MediaQuery.of(context).size.width > 480
              ? TextButton.icon(
                  onPressed: () => onRemove(tr.id),
                  icon: Icon(Icons.delete,
                      color: Theme.of(context).colorScheme.error),
                  label: Text(
                    'Excluir',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.error),
                  ),
                )
              : IconButton(
                  icon: const Icon(Icons.delete),
                  color: Theme.of(context).colorScheme.error,
                  onPressed: () => onRemove(tr.id),
                )),
      );
    }
}
