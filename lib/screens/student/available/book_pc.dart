import 'package:flutter/material.dart';
import 'package:maju_trackmate/apis/student/book_pc.dart';
import 'package:maju_trackmate/utils/constant_values/size.dart';
import 'package:maju_trackmate/widgets/student/logout_button.dart';

class BookPc extends StatefulWidget {
  final String pcId;
  const BookPc({super.key, required this.pcId});

  @override
  State<BookPc> createState() => _BookPcState();
}

class _BookPcState extends State<BookPc> {
  final _studentIdController = TextEditingController();

  final List<String> _timeSlots = ['08:30-10:00', '10:00-11:30', '11:30-02:30'];
  String? _selectedTimeSlot;

  @override
  void dispose() {
    _studentIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xff0D4065),
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [getLogoutButton()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: mq.height * 0.2,
                width: mq.width,
                decoration: const BoxDecoration(
                  color: Color(0xff0D4065),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/png/icons/student/computer.png',
                    ),
                    const Text(
                      'Book your Pc',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: mq.height * 0.1,
              ),
              Container(
                height: mq.height * 0.5,
                width: mq.width * 0.97,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey[500]!,
                      width: 4,
                      style: BorderStyle.solid),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Pc Reservation",
                      style: TextStyle(
                        color: Color(0xff0D4065),
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: mq.height * 0.05,
                    ),
                    SizedBox(
                      width: mq.width * 0.8,
                      child: TextFormField(
                        controller: _studentIdController,
                        decoration: const InputDecoration(
                          labelText: 'Student ID',
                          labelStyle: TextStyle(
                            color: Color(0xff0D4065),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xff0D4065),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: mq.height * 0.03),
                    SizedBox(
                      width: mq.width * 0.8,
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Select Time Slot',
                          labelStyle: const TextStyle(
                            color: Color(0xff0D4065),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        value: _selectedTimeSlot,
                        items: _timeSlots
                            .map((slot) => DropdownMenuItem<String>(
                                  value: slot,
                                  child: Text(slot),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedTimeSlot = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: mq.height * 0.02,
                    ),
                    SizedBox(
                      width: mq.width * 0.8,
                      child: Text.rich(
                        TextSpan(
                          text: 'Note: ',
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'Arrive the Lab right after the Time slot you choose After 15 mint if you haven’t Login your reservation will be cancel',
                              style: TextStyle(
                                color: Colors.grey[500]!,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: mq.height * 0.02,
                    ),
                    SizedBox(
                      width: mq.width * 0.3,
                      child: ElevatedButton(
                          onPressed: () async {
                            // Call the api to book the pc

                            bool val = await BookPcApi()
                                .bookPc(widget.pcId, _selectedTimeSlot!);
                            if (val) {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text(
                                          "Your Reservation is confirmed",
                                          style: TextStyle(
                                            color: Color(0xff0D4065),
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        content: SizedBox(
                                          width: mq.width * 0.2,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              },
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      const WidgetStatePropertyAll(
                                                    Color(0xff0D4065),
                                                  ),
                                                  shape: WidgetStatePropertyAll(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  )),
                                              child: const Text(
                                                "Ok",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                        ),
                                      ));
                            }
                          },
                          style: ButtonStyle(
                              backgroundColor: const WidgetStatePropertyAll(
                                Color(0xff0D4065),
                              ),
                              shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              )),
                          child: const Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
