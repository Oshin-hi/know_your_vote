import 'dart:ffi';

import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductState();
  }
}

var productList = [
  {
    "name": "Balen Shah",
    "image": "assets/candidate1.jpg",
    "wardnumber": 3.0,
    "party": "Independent",

  },
  {
    "name": "Srijana Singh",
    "image": "assets/candidate2.jpg",
    "wardnumber": 3.0,
    "party": "Nepali Congress",
  },
  {
    "name": "Samikshya Baskota",
    "image": "assets/candidate3.jpg",
    "wardnumber": 2.0,
    "party": "Bibeksheel Sajha",
  },
  {
    "name": "Keshav Sthapit",
    "image": "assets/candidate4.jpg",
    "wardnumber": 4.0,
    "party": "CPN UML",
  },
  {
    "name": "Suman Sayami",
    "image": "assets/candidate5.jpg",
    "wardnumber": 4.0,
    "party": "CPN UML",
  },
  {
    "name": "Keshav Singh",
    "image": "assets/candidate6.jpg",
    "wardnumber": 4.0,
    "party": "CPN UML",
  },
  {
    "name": "Keshav Soni",
    "image": "assets/candidate7.jpg",
    "wardnumber": 4.0,
    "party": "CPN UML",
  },
  {
    "name": "Keshav po",
    "image": "assets/candidate8.jpg",
    "wardnumber": 4.0,
    "party": "CPN UML",
  },
];

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        centerTitle: true,
        title: Text(
          "View your candidates",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey[300],
          ),
        ),
      ),
      backgroundColor: Colors.yellow[100],
      body: ListView(
        children: [
          SizedBox(height: 10),
          Container(
            width: 350,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage('assets/voting.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.2),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white60,
                    ),
                    child: Center(
                      child: Text(
                        "See your leaders",
                        style: TextStyle(
                          color: Colors.grey[900],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: productList.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return FeatureProduct(
                candidateName: productList[index]['name'] as String,
                candidateImage: productList[index]['image'] as String,
                candidateWard: productList[index]['wardnumber'] as double,
                candidateparty: productList[index]['party'] as String,
                index: index,
              );
            },
          ),
        ],
      ),
    );
  }
}

class FeatureProduct extends StatelessWidget {
  final String candidateImage;
  final String candidateName;
  final String candidateparty;
  final double candidateWard;

  final int index;

  FeatureProduct(
      {required this.candidateImage,
      required this.candidateName,
      required this.index,
      required this.candidateparty, required this.candidateWard});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: index,
        child: Material(
          child: InkWell(
            onTap: () {
              // print(candidateName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => new ProductDetail(
                    product: FeatureProduct(
                      candidateName: candidateName,
                      candidateImage: candidateImage,
                      candidateparty: candidateparty,
                      candidateWard: candidateWard,
                      index: index,
                    ),
                  ),
                ),
              );
            },
            child: GridTile(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.transparent,
                elevation: 0,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(candidateImage),
                              fit: BoxFit.cover)),
                    ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        '${candidateName}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ), )],
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductDetail extends StatelessWidget {
  final FeatureProduct product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("${product.candidateName}"),
        backgroundColor: Colors.red[800],

      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [Image.asset(
            product.candidateImage,
            width: 600,
            height: 240,
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
            SizedBox(height: 20.0,),
            Row(
              children: [
                Expanded(
                  /*1*/
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*2*/
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          product.candidateName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        product.candidateparty,
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),

                ),

                /*3*/
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(

                              Icons.where_to_vote_rounded,
                              color: Colors.red[500],
                            ),
                          ),
                          Text(product.candidateWard.toStringAsPrecision(1)),
                        ],
                      ),
                      SizedBox(height: 1),
                      Text("Ward Number"),

                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {},
                child: Text("Download Manifesto"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.red[800], // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  ),
                  elevation: 5.0, // Elevation
                )

            ),
          SizedBox(height: 20),
            Text("Candidate Election Symbol",
              style: TextStyle(
                fontSize: 18,

              ),
            ),
            SizedBox(height: 20),
            Container(
                height: 150,
                child: Icon(Icons.sunny,
                  size: 100,
                  color: Colors.grey[900],
                )),
          //add image of manifesto here],

        ],),
      ),
      );
  }
}
