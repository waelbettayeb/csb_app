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

import 'event.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventsRepository {
  static List<Event> loadEvents() {

    const allProducts = <Event> [
      Event(
        id: 9,
        isFeatured: true,
        name: 'Gilt desk trio',
        date: 58,
      ),
      Event(
        id: 10,
        isFeatured: false,
        name: 'Copper wire rack',
        date: 18,
      ),
      Event(
        id: 11,
        isFeatured: false,
        name: 'Soothe ceramic set',
        date: 28,
      ),
      Event(
        id: 12,
        isFeatured: false,
        name: 'Hurrahs tea set',
        date: 34,
      ),
      Event(
        id: 13,
        isFeatured: true,
        name: 'Blue stone mug',
        date: 18,
      ),
      Event(
        id: 14,
        isFeatured: true,
        name: 'Rainwater tray',
        date: 27,
      ),
      Event(
        id: 15,
        isFeatured: true,
        name: 'Chambray napkins',
        date: 16,
      ),
      Event(
        id: 16,
        isFeatured: true,
        name: 'Succulent planters',
        date: 16,
      ),
      Event(
        id: 17,
        isFeatured: false,
        name: 'Quartet table',
        date: 175,
      ),
      Event(
        id: 18,
        isFeatured: true,
        name: 'Kitchen quattro',
        date: 129,
      ),
    ];
      return allProducts.toList();
    }
  }

