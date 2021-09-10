/*import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final Orderdata order;
  DetailsPage(this.order);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future getOrder(String number) async {
    var client = NegotiateAuthClient(
        'restuser', 'Ta9gGi6v7vxWBzXKTHN3MrJ1JHi6WZdHzIktCIdl');
    final url = Uri.parse('https://taskit.de/testing/api/orders/' +
        number +
        "/?useNumberAsId=true");
    final response = await client.get(url);
    if (response.statusCode == 200) {
      //var jsonData = (jsonDecode(response.body) as Map)['data'];
      var jsonData = jsonDecode(response.body);
      var orderDetailsList = <Orderdetails>[];
      //var od = jsonData["details"][0];
      /*print(od);
      Orderdetails orderDetails =
          Orderdetails(od["articleNumber"], od["articleName"], od["price"]);
      return orderDetails;*/
      for (var od in jsonData["data"]["details"]) {
        print(od);
        Orderdetails orderDetails = Orderdetails(od["quantity"],
            od["articleNumber"], od["articleName"], od["price"]);
        orderDetailsList.add(orderDetails);
      }
      print(orderDetailsList.length);
      return orderDetailsList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("№" + widget.order.number,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 23.0)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: FutureBuilder(
          future: getOrder(widget.order.number),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text(
                    "Loading...",
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(children: [
                      Card(
                          color: Colors.green[50],
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black38, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.all(5.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Menge: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.0)),
                                      Text(
                                          snapshot.data[index].quantity
                                              .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 20.0))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Artikelnummer: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.0)),
                                      Text(snapshot.data[index].articleNumber,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 20.0)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Artikelname: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.0)),
                                      Text(snapshot.data[index].articleName,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 20.0))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10, left: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Einzelpreis: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.0)),
                                      Text(
                                          snapshot.data[index].price.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 20.0))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 15, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Gesamtpreis: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.0)),
                                      Text(
                                          [
                                            (snapshot.data[index].price) *
                                                (snapshot.data[index].quantity)
                                          ].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 20.0))
                                    ],
                                  ),
                                ),
                              ])),
                      Card(
                          color: Colors.green[50],
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black38, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.all(5.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: 10, left: 15, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Totalpreis: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20.0)),
                                      Text(
                                          [
                                            (snapshot.data[index].price) *
                                                (snapshot.data[index].quantity)
                                          ].toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 20.0))
                                    ],
                                  ),
                                ),
                              ]))
                    ]);
                  });
            }
          },
        ),
      ),
    );
  }
}*/
