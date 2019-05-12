// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import '../model/event.dart';
import 'product_columns.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AsymmetricView extends StatelessWidget {
  final List<Event> events;

  AsymmetricView({Key key, this.events});

  Widget _buildColumns(BuildContext context, DocumentSnapshot document, int index) {

      double width = .59 * MediaQuery.of(context).size.width;
      Widget column;
      if (index % 2 == 0) {
        /// Even cases

          int bottom = _evenCasesIndex(index);
          column = TwoProductCardColumn(
              bottom: null,
              top: events[bottom]);

        width += 32.0;
      } else {
//        Odd cases
        column = OneProductCardColumn(
          event: events[_oddCasesIndex(index)],
        );
      }
      return Container(
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: column,
        ),
      );
  }

  int _evenCasesIndex(int input) {
    /// The operator ~/ is a cool one. It's the truncating division operator. It
    /// divides the number and if there's a remainder / decimal, it cuts it off.
    /// This is like dividing and then casting the result to int. Also, it's
    /// functionally equivalent to floor() in this case.
    return input ~/ 2 * 3;
  }

  int _oddCasesIndex(int input) {
    assert(input > 0);
    return (input / 2).ceil() * 3 - 1;
  }

  int _listItemCount(int totalItems) {
    if (totalItems % 3 == 0) {
      return totalItems ~/ 3 * 2;
    } else {
      return (totalItems / 3).ceil() * 2 - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('events').snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return Center(child: const Text('Loading...'));
        return ListView.builder(
          itemCount: snapshot.data.documents.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.fromLTRB(0.0, 34.0, 16.0, 44.0),
          itemBuilder: (context, index) =>
              _buildColumns(context, snapshot.data.documents[index], index),
        );
      }
    );
  }
}
