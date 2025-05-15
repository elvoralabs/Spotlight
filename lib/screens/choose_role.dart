import 'package:flutter/material.dart';
import 'package:spotlight/homepages/talent_organizer_home.dart';

class ChooseRolePage extends StatefulWidget {
  const ChooseRolePage({super.key});

  @override
  _ChooseRolePageState createState() => _ChooseRolePageState();
}

class _ChooseRolePageState extends State<ChooseRolePage> {
  String _selectedRole = ''; // Variable to store selected role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 150.0, horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Choose Your Role',
                style: TextStyle(
                  fontSize: 22.0,
                  // fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              // Use RadioListTile for each option
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: RadioListTile<String>(
                  value: 'Talent/Fan',
                  groupValue: _selectedRole,
                  title: Text('Talent/Fan'),
                  subtitle: Text('Upload, vote & engage'),
                  onChanged: (value) {
                    setState(() {
                      _selectedRole = value!;
                    });
                  },
                  activeColor: Colors.pink, // Color of the dot when selected
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10.0)),
                child: RadioListTile<String>(
                  value: 'Event Organizer',
                  groupValue: _selectedRole,
                  title: Text('Event Organizer'),
                  subtitle: Text('Host competitions'),
                  onChanged: (value) {
                    setState(() {
                      _selectedRole = value!;
                    });
                  },
                  activeColor: Colors.pink, // Color of the dot when selected
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: RadioListTile<String>(
                  value: 'Talent Scout',
                  groupValue: _selectedRole,
                  title: Text('Talent Scout'),
                  subtitle: Text('Find & endorse talents'),
                  onChanged: (value) {
                    setState(() {
                      _selectedRole = value!;
                    });
                  },
                  activeColor: Colors.pink, // Color of the dot when selected
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TalentOrganizerHome(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0))),
                child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
