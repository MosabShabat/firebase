import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../fire_base/store_firebse.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: StoreFireBase().getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const CircleAvatar(
                    radius: 150,
                    backgroundColor: Colors.orange,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    snapshot.data![index].name,
                    style: GoogleFonts.actor(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    snapshot.data![index].email,
                    style: GoogleFonts.actor(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            },
          );
        } else {
          return Text(
            "no data found",
            style: GoogleFonts.actor(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              letterSpacing: 1,
            ),
          );
        }
      },
    );
  }
}
/*
ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data!.name),
                subtitle: Text(snapshot.data![index].email),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send),
                    color: Colors.orange),
              );
            },
          )
*/