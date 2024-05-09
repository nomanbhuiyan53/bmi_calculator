import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen>{
  final TextEditingController _HtFcontroller = TextEditingController();
  final TextEditingController _widgetController = TextEditingController();
  final TextEditingController _IncController = TextEditingController();
  String _selectedOption = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.restart_alt))
        ],
      ),
      body:  Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 60,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'age',

                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: TextFormField(
                    controller: _HtFcontroller,
                    keyboardType: TextInputType.number,
                    decoration:const InputDecoration(
                      labelText: 'Ht (f)',
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: TextFormField(
                    controller: _IncController,
                    keyboardType: TextInputType.number,
                    decoration:const InputDecoration(
                      labelText: 'Ht (in)',
                    ),
                  ),
                ),
               const SizedBox(
                 child: DropdownMenu(
                   initialSelection: 'Ft',
                   dropdownMenuEntries: [
                     DropdownMenuEntry(value: 'Ft', label: 'Ft'),
                     DropdownMenuEntry(value: 'In', label: 'In'),
                   ],
                 ),
               ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.male)),
                    Text('|'),
                    IconButton(onPressed: (){}, icon:const Icon(Icons.female))
                  ],
                ),
                SizedBox(
                  width: 90,
                  child: TextFormField(
                    controller: _widgetController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'Weight',
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  child: IconButton(
                    onPressed: (){
                      double hl = double.tryParse(_HtFcontroller.text) ?? 0;
                      double ins = double.tryParse(_IncController.text) ?? 0;
                      double weight = double.tryParse(_widgetController.text) ?? 0;

                      setState(() {});
                    },
                    icon:const Icon(Icons.manage_search_rounded),
                  ),
                )
              ],
            ),
            const SizedBox(height: 3,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:30, vertical: 0),
              child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(minimum: 1, maximum: 100,
                        ranges: <GaugeRange>[
                          GaugeRange(startValue: 0, endValue: 20, color:Colors.green),
                          GaugeRange(startValue: 20,endValue: 70,color: Colors.orange),
                          GaugeRange(startValue: 70,endValue: 100,color: Colors.red)],
                        pointers: <GaugePointer>[
                          NeedlePointer(value: 63)],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(widget: Container(child:
                          Text('63',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold))),
                              angle: 90, positionFactor: 0.5
                          )]
                    )]),
            )
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    _HtFcontroller.dispose();
    _IncController.dispose();
    _widgetController.dispose();
    super.dispose();
  }

}
