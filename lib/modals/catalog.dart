class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "iPhone 12 Pro",
        desc: "Apple iPhone 12 generation",
        price: 999,
        color: "#33505a",
        image:
            "https://images.unsplash.com/photo-1611791485440-24e8239a0377?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aXBob25lJTIwMTIlMjBwcm98ZW58MHx8MHx8fDA%3D")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
