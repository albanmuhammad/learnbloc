import 'package:blocapplication/data/models/car.dart';
import 'package:blocapplication/presentation/pages/car_details_page.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final Car car;
  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => CarDetailsPage(car: car)));
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Color(0xffF3F3f3),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 10, spreadRadius: 5)
              ]),
          child: Column(
            children: [
              Image.asset(
                'assets/car_image.png',
                height: 120,
              ),
              Text(
                car.model,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/gps.png'),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${car.distance.toStringAsFixed(0)}km'),
                      SizedBox(
                        width: 8,
                      ),
                      Image.asset('assets/pump.png'),
                      SizedBox(
                        width: 6,
                      ),
                      Text('${car.fuelCapacity.toStringAsFixed(0)}L')
                    ],
                  ),
                  Text(
                    '\$${car.pricePerHour.toStringAsFixed(2)}/h',
                    style: TextStyle(fontSize: 16),
                  )
                ],
              )
            ],
          )),
    );
  }
}
