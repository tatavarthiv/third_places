import 'package:parks/models/event.dart';

final List<Event> dummyEvents = [
  Event(
    name: 'Yoga in the Park',
    parkName: 'Central Park',
    city: 'New York',
    state: 'NY',
    dateTime: DateTime(2023, 10, 15, 9, 0),
    description: 'Join us for a relaxing morning yoga session in Central Park.',
  ),
  Event(
    name: 'Music Festival',
    parkName: 'Golden Gate Park',
    city: 'San Francisco',
    state: 'CA',
    dateTime: DateTime(2023, 10, 20, 12, 0),
    description:
        'Enjoy live music from various artists at the Golden Gate Park Music Festival.',
  ),
  Event(
    name: 'Food Truck Rally',
    parkName: 'Millennium Park',
    city: 'Chicago',
    state: 'IL',
    dateTime: DateTime(2023, 10, 25, 11, 0),
    description:
        'Taste delicious food from the best food trucks in Chicago at Millennium Park.',
  ),
  Event(
    name: 'Art in the Park',
    parkName: 'Balboa Park',
    city: 'San Diego',
    state: 'CA',
    dateTime: DateTime(2023, 10, 30, 10, 0),
    description:
        'Explore beautiful art installations and exhibits at Balboa Park.',
  ),
  Event(
    name: 'Outdoor Movie Night',
    parkName: 'Zilker Park',
    city: 'Austin',
    state: 'TX',
    dateTime: DateTime(2023, 11, 5, 19, 0),
    description: 'Watch a classic movie under the stars at Zilker Park.',
  ),
];
