import 'package:flutter/material.dart';
import 'package:quiz_app_jcf10/utils/questions_utils.dart';
import 'package:quiz_app_jcf10/views/components/option_box_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i = 0;

  bool a = false;
  bool b = false;
  bool c = false;
  bool d = false;

  int score = 0;
  String? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: IndexedStack(
            index: i,
            children: allQuestion
                .map(
                  (que) => Container(
                    height: s.height,
                    width: s.width,
                    decoration: BoxDecoration(
                      color: Colors.primaries[allQuestion.indexOf(que)][200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const Spacer(
                          flex: 2,
                        ),
                        Text(
                          que['que'],
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  a = !a;
                                  selectedAnswer = "A";
                                  b = c = d = false;
                                });
                              },
                              child: optionBox(
                                optIndex: "A",
                                option: que['A'],
                                isSelected: a,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  b = !b;
                                  selectedAnswer = "B";
                                  a = c = d = false;
                                });
                              },
                              child: optionBox(
                                  optIndex: "B",
                                  option: que['B'],
                                  isSelected: b),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  c = !c;
                                  selectedAnswer = "C";
                                  a = b = d = false;
                                });
                              },
                              child: optionBox(
                                  optIndex: "C",
                                  option: que['C'],
                                  isSelected: c),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  d = !d;
                                  selectedAnswer = "D";
                                  a = b = c = false;
                                });
                              },
                              child: optionBox(
                                  optIndex: "D",
                                  option: que['D'],
                                  isSelected: d),
                            ),
                          ],
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (i == allQuestion.length - 1) {
              if (allQuestion[i]['ans'] == selectedAnswer) {
                score += allQuestion[i]['amount'] as int;
              }
              a = b = c = d = false;
              Navigator.of(context)
                  .pushNamed('result_page', arguments: score)
                  .then(
                    (value) => setState(() {
                      i = 0;
                      score = 0;
                      a = b = c = d = false;
                    }),
                  );
            } else {
              if (allQuestion[i]['ans'] == selectedAnswer) {
                score += allQuestion[i]['amount'] as int;
              }
              a = b = c = d = false;
              i++;
            }
          });
        },
        child: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
