import 'package:parks/models/event.dart';

final List<ParkEvent> upcomingEvents = [
  ParkEvent(
    id: '1',
    title: 'Hyde Park 5K',
    date: '8/20',
    location: 'Hyde Park',
    imageUrl:
        'https://images.squarespace-cdn.com/content/v1/613ceb3abf1d44616784cf72/03e845e2-332c-49dc-9a4f-a86f9918ba5d/GYC_9687.jpg',
    parkName: 'Hyde Park',
    parkType: 'City park',
    parkSize: '350 acres',
    description: 'Annual 5K run through scenic Hyde Park.',
  ),
  ParkEvent(
    id: '2',
    title: 'Family Fun Day',
    date: '8/22',
    location: 'Washington Park',
    imageUrl:
        'https://www.clayhealth.com/ImageRepository/Document?documentID=1692',
    parkName: 'Washington Park',
    parkType: 'Community park',
    parkSize: '150 acres',
    description: 'A day of family activities and games.',
  ),
  ParkEvent(
    id: '3',
    title: 'Flow in the Park',
    date: '8/27',
    location: 'Lake Union Park',
    imageUrl:
        'https://media.istockphoto.com/id/618859804/photo/young-woman-is-practicing-yoga-at-mountain-lake.jpg?s=612x612&w=0&k=20&c=qxaV8hU7KLuwjN7DCN5tJicph_U9OW0orD4kTgJaHEQ=',
    parkName: 'Lake Union Park',
    parkType: 'Waterfront park',
    parkSize: '12 acres',
    description: 'Outdoor yoga session by the lake.',
  ),
];

final List<ParkEvent> communityEvents = [
  ParkEvent(
    id: '4',
    title: 'Sunday Yoga',
    date: 'August 25th · 11:00 am',
    location: 'Nichols Park · Chicago, IL',
    parkName: 'Nichols Park',
    parkType: 'Local park',
    parkSize: '2.1 acres',
    imageUrl:
        'https://media.istockphoto.com/id/1157343333/photo/ooo-i-can-definitely-feel-that.jpg?s=612x612&w=0&k=20&c=enujGK_G79nouRZdneq04S35zyvifwDL-bshnDe6N5Y=',
    description:
        'Join us for a fun and relaxing morning of Yoga with Goats! Whether you\'re a seasoned yogi or new to the practice, this unique event will combine gentle yoga poses with the playful energy of adorable goats! Stretch, breathe, and laugh as these curious and friendly animals interact with you during the session. Bring your yoga mat, a towel, and a smile. Goat nuzzles and cuddles are free of charge!',
    isOfficial: true,
    tags: ['Popular with women', 'Free'],
  ),
  ParkEvent(
    id: '5',
    title: 'Chicago Half Marathon',
    date: 'August 27th · 9:00 am',
    location: 'Grant Park · Chicago, IL',
    parkName: 'Grant Park',
    parkType: 'City park',
    parkSize: '319 acres',
    imageUrl: 'https://example.com/event5.jpg',
    description:
        'Join thousands of runners for the annual Chicago Half Marathon through the scenic streets of Chicago.',
    isOfficial: true,
    tags: ['Race', 'Popular'],
  ),
];
