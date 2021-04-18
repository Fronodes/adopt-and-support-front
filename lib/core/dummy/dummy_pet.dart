import '../core_shelf.dart';

Pet getDummyPet() {
  return Pet(
      '1',
      'Kedi',
      ['https://i.ytimg.com/vi/1Ne1hqOXKKI/maxresdefault.jpg'],
      'Cat',
      'Male',
      2,
      10,
      'Summary will be here',
      User(
          '2',
          'Person',
          '10310321',
          Address('cadde', 'mahalle', 'fatih', 'istanbul'),
          'mail.com',
          'https://i.ytimg.com/vi/1Ne1hqOXKKI/maxresdefault.jpg', []),
      'ads');
}
