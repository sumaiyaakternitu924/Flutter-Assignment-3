import 'package:flutter/material.dart';
import 'package:flutter_assignment_3_2022350/widgets/simple_input_field.dart';

class tip_calculator_page extends StatefulWidget {
  const tip_calculator_page({super.key});

  @override
  State<tip_calculator_page> createState() => _tip_calculator_pageState();
}

class _tip_calculator_pageState extends State<tip_calculator_page> {
  final formKey = GlobalKey<FormState>();

  final totalBillController = TextEditingController();
  final totalTipController = TextEditingController();
  final totalPeopleController = TextEditingController();

  static const Color containerColor = Color(0xffF5F8FB);
  static const Color textBlack = Color(0xff232323);
  static const Color textLightBlack = Color(0xff717171);
  static const Color clearButtonColor = Color(0xffFF7511);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Tip Calculator',
            style: TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.w600)),
        centerTitle: true,
        elevation: 3,
        shadowColor: Colors.black54,
        backgroundColor: Colors.white,
      ),

      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text("Total Bill", style: TextStyle(color: textLightBlack)),
                      Text("\$ ${totalBillController.text}", style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700, color: textBlack)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Persons", style: TextStyle(color: textLightBlack)),
                          Text("Tip Amount", style: TextStyle(color: textLightBlack)),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("05", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: textBlack)),
                          Text("\$ 20.0", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: textBlack)),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Amount per person", style: TextStyle(color: textLightBlack)),
                      Text("\$0.00", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: textBlack)),
                    ],
                  ),
                ),

                const Spacer(),

                simple_input_field(
                    controller: totalBillController,
                    title: "Total Bill",
                    iconData: Icons.attach_money,
                    hintText: "Please enter total bill"
                ),

                simple_input_field(
                    controller: totalTipController,
                    title: "Tip percentage",
                    iconData: Icons.percent,
                    hintText: "Please enter tip percentage"
                ),

                simple_input_field(
                    controller: totalPeopleController,
                    title: "Number of people",
                    hintText: "Please enter number of people"
                ),


                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            formKey.currentState!.validate();
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(top: 10),
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                          decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          alignment: Alignment.center,
                          child: const Text("Calculate", style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    GestureDetector(
                      onTap: (){
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 45),
                        decoration: BoxDecoration(
                            color: clearButtonColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: const Text("Clear", style: TextStyle(color: Colors.white),),
                      ),
                    )

                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}