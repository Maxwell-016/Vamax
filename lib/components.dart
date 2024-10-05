import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFonts extends StatelessWidget {
  final String text;
  final dynamic size;
  final dynamic weight;
  final dynamic color;
  final String googleFont;
  const MyFonts(
      {super.key,
      required this.text,
      this.size,
      this.weight,
      required this.googleFont,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.getFont(googleFont,
          fontSize: size, fontWeight: weight, color: color),
      overflow: TextOverflow.ellipsis,
    );
  }
}

class ItemCard extends StatefulWidget {
  final image;
  final price;
  final description;
  final name;
  const ItemCard(
      {super.key,
      required this.image,
      required this.price,
      required this.description,
      this.name});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard>{
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetails(
                description: widget.description,
                product: Product(name: widget.name, price: widget.price, image: widget.image),),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        width: deviceWidth / 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0)),
              child: SizedBox(
                width: deviceWidth / 3,
                height: deviceHeight / 4.5,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: MyFonts(
                text: widget.description,
                googleFont: "Open Sans",
                size: 11.0,
                weight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: MyFonts(
                text: widget.price,
                googleFont: "Poppins",
                size: 13.0,
                weight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDetails extends StatefulWidget {
  final Product product;
  final String description;
  const ItemDetails(
      {super.key,
      required this.description,
      required this.product});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 20.0,
          //backgroundColor: Colors.purpleAccent,
          iconTheme: const IconThemeData(size: 35.0, color: Colors.black),
          centerTitle: true,
          title: const MyFonts(
            text: "Details",
            googleFont: "Roboto",
            size: 24.0,
          ),
        ),
        endDrawer: const Padding(
          padding: EdgeInsets.all(10.0),
          child: SizedBox(
            height: 350.0,
            width: 250.0,
            child: Drawer(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  MobileTabs(
                    icon: Icons.home,
                    text: "Home",
                    route: '/home',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MobileTabs(
                    icon: Icons.category,
                    text: "Category",
                    route: '/category',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MobileTabs(
                    icon: Icons.shopping_cart,
                    text: "Cart",
                    route: '/cart',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  MobileTabs(
                    icon: Icons.person,
                    text: "Profile",
                    route: '/profile',
                  ),
                ],
              ),
            ),
          ),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: deviceHeight / 2.5,
              width: deviceWidth,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  widget.product.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyFonts(
                    text: widget.description,
                    googleFont: "Lato",
                    color: Colors.black,
                    size: 14.0,
                    weight: FontWeight.normal,
                  ),
                  MyFonts(
                    text: "ksh. ${widget.product.price}",
                    googleFont: "Arimo",
                    weight: FontWeight.bold,
                    size: 16.0,
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(

            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/home");
                  },
                  icon: Container(
                    width: 60.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.purpleAccent,
                          width: 2.0,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.home_outlined,
                        ),
                      ),
                    ),
                  ),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.purpleAccent,
                label: "",
                icon: MaterialButton(
                  onPressed: () {
                    //Provider.of<CartModel>(context,listen: false).addItem(widget.product);
                    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${widget.product.name} added to cart!"),));
                  },
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.purpleAccent,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.add_shopping_cart_outlined),
                        MyFonts(
                          text: "Add to cart",
                          googleFont: "Poppins",
                          size: 15.0,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}

class Product {
  final dynamic image;
  final String name;
  final double price;
  const Product(
      {required this.name, required this.price, required this.image});

}

// class CartItem extends StatelessWidget {
//   final Product product;
//   int quantity;
//   CartItem({super.key, required this.product, this.quantity = 1});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
//
// class CartModel extends ChangeNotifier{
//   final List _items=[];
//   List get items => _items;
//
//   void addItem(Product product){
//     // final existingItem= _items.firstWhere((item)=>item.product.id == product.id,orElse: () => null);
//     // if(existingItem != null){
//     //   existingItem.quantity++;
//     // }
//     // else{
//       _items.add(CartItem(product: product),);
//     // }
//     notifyListeners();
//   }
// }

class MobileTabs extends StatefulWidget {
  final IconData icon;
  final String text;
  final String route;
  const MobileTabs(
      {super.key, required this.icon, required this.text, required this.route});

  @override
  State<MobileTabs> createState() => _MobileTabsState();
}

class _MobileTabsState extends State<MobileTabs> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).pushNamed(widget.route);
      },
      child: Container(
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                widget.icon,
                color: Colors.white,
              ),
              const SizedBox(
                width: 20.0,
              ),
              MyFonts(
                text: widget.text,
                googleFont: "Open Sans",
                color: Colors.white,
                size: 24.0,
                weight: FontWeight.bold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
