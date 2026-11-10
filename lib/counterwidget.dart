import 'package:flutter/material.dart';

class Counterwidget extends StatefulWidget {
  const Counterwidget({super.key});

  @override
  State<Counterwidget> createState() => _CounterwidgetState();
}

class _CounterwidgetState extends State<Counterwidget> {
  int teamACount = 0;
  int teamBCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.redAccent,
        title: const Text(
          'BasketBall',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),

      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Team A
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Team A',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Text(
                '$teamACount',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    teamACount++;
                  });
                },
                child: const Text('Add 1 Point'),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    teamACount += 2;
                  });
                },
                child: const Text('Add 2 Point'),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    teamACount += 3;
                  });
                },
                child: const Text('Add 3 Point'),
              ),
            ],
          ),

          // Team B
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Team B',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Text(
                '$teamBCount',
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    teamBCount++;
                  });
                },
                child: const Text('Add 1 Point'),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    teamBCount += 2;
                  });
                },
                child: const Text('Add 2 Point'),
              ),

              const SizedBox(height: 10),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    teamBCount += 3;
                  });
                },
                child: const Text('Add 3 Point'),
              ),
            ],
          ),
        ],
      ),

      // Reset
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            teamACount = 0;
            teamBCount = 0;
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
