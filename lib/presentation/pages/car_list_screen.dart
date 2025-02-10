// import 'package:blocapplication/data/models/car.dart';
import 'package:blocapplication/presentation/bloc/car_bloc.dart';
import 'package:blocapplication/presentation/bloc/car_state.dart';
import 'package:blocapplication/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});
  // final List<Car> cars = [
  //   Car(
  //       model: 'Fortuner GR',
  //       distance: 265,
  //       fuelCapacity: 23,
  //       pricePerHour: 29),
  //   Car(
  //       model: 'Fortuner GR',
  //       distance: 265,
  //       fuelCapacity: 23,
  //       pricePerHour: 29),
  //   Car(
  //       model: 'Fortuner GR',
  //       distance: 265,
  //       fuelCapacity: 23,
  //       pricePerHour: 29),
  //   Car(
  //       model: 'Fortuner GR',
  //       distance: 265,
  //       fuelCapacity: 23,
  //       pricePerHour: 29),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Choose Your Car'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarsLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CarsLoaded) {
            return ListView.builder(
              itemCount: state.cars.length,
              itemBuilder: (context, index) {
                return CarCard(car: state.cars[index]);
              },
            );
          } else if (state is CarsError) {
            return Center(
              child: Text('error : ${state.message}'),
            );
          }
          return Container();
        },
      ),
    );
  }
}
