import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "English",
                  style: GoogleFonts.poppins(fontSize: 23),
                ),
                Spacer(),
                Icon(Icons.check,size: 28,)
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Arabic",
                  style: GoogleFonts.poppins(fontSize: 23),
                ),
                Spacer(),
                Icon(Icons.check,size: 28,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
