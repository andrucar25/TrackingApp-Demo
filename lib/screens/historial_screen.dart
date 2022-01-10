import 'package:flutter/material.dart';

import 'package:grouped_list/grouped_list.dart';
import 'package:aeromatersa/constants.dart';

List _data = [
  {
    'id':1,
    'mercaderia': 'Mercaderia de ropa invierno',
    'imagen': 'https://safestorage.pe/wp-content/uploads/2019/07/the-safe-storage-consejos-almacenamiento-ropa-bodegas.jpg',
    'fechaEmision': '20/08/2021',
    'tipoServicio': 'Almacenaje',
    'estado':'Entregado',
    'moneda':'Dolar americano',
    'fechaVencimiento': '20/10/2021',
    'observacion':'02 cuota de pago - 60 dias de plazo - Mercaderia no fragil',
    'valor':'200.00',
    'total':'250.00',
    'cantidad':'02',
  },
   {
    'id':2,
    'mercaderia': 'Mercaderia de laptops',
    'imagen': 'https://logistica360.pe/wp-content/uploads/2019/09/VITZ..jpg',
    'fechaEmision': '25/09/2021',
    'tipoServicio': 'Montacarga',
    'estado':'Entregado',
    'moneda':'Dolar americano',
    'fechaVencimiento': '25/10/2021',
    'observacion':'01 cuota de pago - 30 dias de plazo - Mercaderia fragil ',
    'valor':'1500.',
    'total':'2000',
    'cantidad':'01',
  }
];


class HistorialScreen extends StatefulWidget {
  HistorialScreen({Key? key}) : super(key: key);

  @override
  _HistorialScreenState createState() => _HistorialScreenState();
}

class _HistorialScreenState extends State<HistorialScreen>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 5.0,
        //    title: Row(
        //   children: [
        //     SizedBox(height:20),
        //     Text('Ropa invierno',
        //         textAlign: TextAlign.left,
        //         style: TextStyle(
        //             color: Colors.black,
        //             fontSize: 20,
        //             fontWeight: FontWeight.w900)),
        //   ],
        // ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: kPrimaryColor,
                ),
                onPressed: () {}
                ),
          ]),

      body: GroupedListView<dynamic, String>(
        elements: _data,
        groupBy: (item) => item['tipoServicio'],
        groupSeparatorBuilder: (groupValue) => Padding(
          padding: EdgeInsets.only(top:25, bottom:8, left:8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          left: 8,
                          right: 8),
                      child: Text(
                        groupValue,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: kPrimaryColor),
                    ),
                    Expanded(
                      child: Divider(color: kPrimaryColor),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        itemBuilder: (context, item) {
          return Card(
            clipBehavior: Clip.antiAlias,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            elevation: 8.0,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            child: Container(
              child: InkWell(
                onTap: () {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Ink.image(
                      height: 220,
                      image: NetworkImage(item['imagen']),
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16,
                        top: 16,
                        right: 16,
                        bottom: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item['mercaderia'],
                            style: TextStyle(
                              color: kTxtColor, //Colors.grey[700],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            item['observacion'],
                            style: TextStyle(
                              color: kTxtColor, //Colors.grey[700],
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              Text(
                                "Vencimiento:",
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                item['fechaVencimiento'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                               SizedBox(width: 100),
                              IconButton(
                                icon: Icon(
                                  Icons.file_download,
                                ),
                                iconSize: 50,
                                color: Colors.purple,
                                splashColor: Colors.purple,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        groupComparator: (group1, group2) => group1.compareTo(group2),
        itemComparator: (item1, item2) =>
            item1['title'].compareTo(item2['title']),
        useStickyGroupSeparators: true,
        floatingHeader: false,
        order: GroupedListOrder.ASC,
      ),

 
   );
  }
}
