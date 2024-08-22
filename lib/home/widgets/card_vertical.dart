import 'package:flutter/material.dart';
import 'package:pruebawather/home/widgets/texts.dart';

class CardVertical extends StatelessWidget {
  const CardVertical({
    super.key,
    required this.title,
    required this.subTitle,
    required this.weatherIcon,
    required this.weatherDescription, 

  });

  final String title;
  final String subTitle;
  final String weatherIcon;
  final String weatherDescription;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Tocaste la card en clima de home");
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
           width: 200,
           height: 200,
          padding: EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText( text : title), // Puedes cambiar esto a la fecha actual
              /// Thumbnail Container
              Container(
                height: 180,
                padding: EdgeInsets.all(8),
                child: Image.network(
                      'http://openweathermap.org/img/w/$weatherIcon.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
              ),
              SizedBox(height: 2),
              /// Details
              Padding(
                padding: EdgeInsets.symmetric(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText( text: 
                      subTitle,
                    fontSize: 20,
                    
                    ),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}