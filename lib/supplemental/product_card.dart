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

class EventCard extends StatelessWidget {
  EventCard({this.imageAspectRatio: 33 / 49, this.event})
      : assert(imageAspectRatio == null || imageAspectRatio > 0);

  final double imageAspectRatio;
  final Event event;

  static final kTextBoxHeight = 65.0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final imageWidget = Image.network(
      event.image_url,
        fit: BoxFit.cover
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        AspectRatio(
          aspectRatio: imageAspectRatio,
          child: imageWidget,
        ),
        SizedBox(
          height: kTextBoxHeight * MediaQuery.of(context).textScaleFactor + 10,
          width: 121.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // TODO(larche): Make headline6 when available
              Text(
                (event == null || event.name == null) ? '' : event.name,
                style: theme.textTheme.button.copyWith(
                  fontWeight: FontWeight.w800,
                ),
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 4.0),
              // TODO(larche): Make subtitle2 when available
              Text(
                (event == null || event.date == null) ? ''
                    : event.date.toString().replaceAll(":00.000",""),
                style: theme.textTheme.caption,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
