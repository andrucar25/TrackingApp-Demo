import 'package:flutter/material.dart';

import 'package:grouped_list/grouped_list.dart';
import 'package:aeromatersa/constants.dart';

List _data = [
  {
    'id':1,
    'mercaderia': 'Mercaderia de ropa verano',
    'imagen': 'https://www.eluniverso.com/resizer/jU_ZfrnNMAOBB9aRqLs7HKW0PRM=/1117x670/smart/filters:quality(70)/cloudfront-us-east-1.images.arcpublishing.com/eluniverso/WANKWEDZPRHNLHGT3HN7OMVFTE.jpg',
    'fechaEmision': '24/10/2021',
    'tipoServicio': 'Almacenaje',
    'estado':'En espera',
    'moneda':'Dolar americano',
    'fechaVencimiento': '24/11/2021',
    'observacion':'01 cuota de pago - 30 dias de plazo',
    'valor':'177.88',
    'total':'209.78',
    'cantidad':'01',
  },
   {
    'id':2,
    'mercaderia': 'Mercaderia de zapatos',
    'imagen': 'https://www.ministeriodegobierno.gob.ec/wp-content/uploads/2014/09/pagguayaquil1.jpg',
    'fechaEmision': '24/10/2021',
    'tipoServicio': 'Montacarga',
    'estado':'En espera',
    'moneda':'Dolar americano',
    'fechaVencimiento': '24/11/2021',
    'observacion':'01 cuota de pago - 30 dias de plazo ',
    'valor':'16.95',
    'total':'20',
    'cantidad':'01',
  }
];


class PendientesScreen extends StatefulWidget {
  PendientesScreen({Key? key}) : super(key: key);

  @override
  _PendientesScreenState createState() => _PendientesScreenState();
}

class _PendientesScreenState extends State<PendientesScreen> {
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
        //     Text('Ropa verano',
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('Aeromater S.A.',
              style: TextStyle(color: Colors.white, fontSize: 24),),
              decoration: BoxDecoration(
                color: Colors.purple
              ),
            ),
            ListTile(
              leading: Icon(Icons.help_center),
              title: Text('Servicios de Aeromater'),
            ),
              ListTile(
              leading: Icon(Icons.move_to_inbox),
              title: Text('Quejas y reclamos'),
            ),
            ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text('Cerrar sesión'),
            ),
          ],
        ),
      ),

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

                onTap: () {
                  Navigator.pushNamed(context, 'detalle');
                },
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
