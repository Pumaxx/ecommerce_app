import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final bool isRecommended;
  final bool isPopular;

  const Product({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props =>
      [name, category, imageUrl, price, isRecommended, isPopular];

  static List<Product> products = [
    const Product(
        name: 'Chips #1',
        category: 'Chips',
        imageUrl:
            'https://images.unsplash.com/photo-1576642589592-7d9778a1c9e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1135&q=80',
        price: 1.99,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: 'Chips #2',
        category: 'Chips',
        imageUrl:
            'https://images.unsplash.com/photo-1600952841320-db92ec4047ca?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=725&q=80',
        price: 1.59,
        isRecommended: false,
        isPopular: true),
    const Product(
        name: 'Pretzels #1',
        category: 'Pretzels',
        imageUrl:
            'https://as2.ftcdn.net/v2/jpg/04/18/79/29/1000_F_418792953_DG4Osny2YTTTM03qoFIcnfLzPsvZXbSa.jpg',
        price: 1.99,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: 'Nuts #1',
        category: 'Nuts',
        imageUrl:
            'https://as2.ftcdn.net/v2/jpg/05/17/78/83/1000_F_517788324_epd6v8D9NY6sVGEjUn8CHbxT6xwKgRfD.jpg',
        price: 5.99,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: 'Nuts #2',
        category: 'Nuts',
        imageUrl:
            'https://as1.ftcdn.net/v2/jpg/00/00/98/56/1000_F_985698_NfuQisXqUnSlQis2345FuiMAK8dI6l.jpg',
        price: 1.09,
        isRecommended: false,
        isPopular: true),
    const Product(
        name: 'Pretzels #2',
        category: 'Pretzels',
        imageUrl:
            'https://as2.ftcdn.net/v2/jpg/01/29/35/85/1000_F_129358521_xuNcqVe39Zhx88pCom8yzg30jzt3HVJ4.jpg',
        price: 1.29,
        isRecommended: false,
        isPopular: true),
    const Product(
        name: 'Chips #3',
        category: 'Chips',
        imageUrl:
            'https://images.unsplash.com/photo-1585220202939-c10ec7c6dc4e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1039&q=80',
        price: 1.89,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Pretzels #3',
        category: 'Pretzels',
        imageUrl:
            'https://as1.ftcdn.net/v2/jpg/04/22/47/86/1000_F_422478648_QrjWNOE4tV9fvWfD46Q46XpCkVRqkQc0.jpg',
        price: 1.59,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Nuts #3',
        category: 'Nuts',
        imageUrl:
            'https://as1.ftcdn.net/v2/jpg/03/10/02/54/1000_F_310025420_w1BzQHScw1xtBqPTB9QEGrBad9txhSBU.jpg',
        price: 1.59,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Nuts #4',
        category: 'Nuts',
        imageUrl:
            'https://as2.ftcdn.net/v2/jpg/01/42/57/83/1000_F_142578394_J7gM4pPY2OxjLL0w9my5TUdkDhqEng4w.jpg',
        price: 2.99,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: 'Chips #4',
        category: 'Chips',
        imageUrl:
            'https://images.unsplash.com/photo-1607872155443-d03f7a3a5b68?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
        price: 2.99,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: 'Pretzels #4',
        category: 'Pretzels',
        imageUrl:
            'https://as1.ftcdn.net/v2/jpg/03/48/63/42/1000_F_348634252_8vOQKsI7wjdMakCI1UPKK1HCMdpEgExe.jpg',
        price: 2.29,
        isRecommended: true,
        isPopular: false),
    const Product(
        name: 'Chips #5',
        category: 'Chips',
        imageUrl:
            'https://images.unsplash.com/photo-1644841135313-bf5fb206884c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
        price: 2.59,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Nuts #5',
        category: 'Nuts',
        imageUrl:
            'https://as2.ftcdn.net/v2/jpg/02/12/32/87/1000_F_212328706_eh7qTsvvEiAYvzAUIG3kbccYJHDwD5oi.jpg',
        price: 4.59,
        isRecommended: true,
        isPopular: true),
    const Product(
        name: 'Pretzels #5',
        category: 'Pretzels',
        imageUrl:
            'https://as1.ftcdn.net/v2/jpg/05/76/44/94/1000_F_576449491_Pnli8pkPcQZgeqE5RLxcsjoogVQALOHi.jpg',
        price: 2.79,
        isRecommended: true,
        isPopular: true),
  ];
}
