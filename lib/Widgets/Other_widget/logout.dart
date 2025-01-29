import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showLogoutDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: false, // Prevent dismissing by tapping outside
    barrierLabel: "Logout",
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: _LogoutDialogContent(),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
        scale: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
          reverseCurve: Curves.easeInBack,
        ),
        child: child,
      );
    },
  );
}

class _LogoutDialogContent extends StatelessWidget {
  const _LogoutDialogContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define color scheme
    final Color primaryColor = Colors.redAccent;
    final Color backgroundColor = Colors.white;
    final Color buttonTextColor = Colors.white;

    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.85,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Icon
          Icon(
            Icons.logout,
            size: 60.0,
            color: primaryColor,
          ),
          SizedBox(height: 20.0),
          // Title
          Text(
            "Confirm Logout",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10.0),
          // Description
          Text(
            "Are you sure you want to logout from your account?",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 30.0),
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Yes Button
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Optional: Show a loading indicator before exiting
                    // _showLoading(context);
                    SystemNavigator.pop(); // Exits the app
                  },
                  icon: Icon(Icons.check, color: buttonTextColor),
                  label: Text(
                    "Yes",
                    style: TextStyle(color: buttonTextColor, fontSize: 16.0),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor, // Updated from 'primary'
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              // No Button
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  icon: Icon(Icons.close, color: primaryColor),
                  label: Text(
                    "No",
                    style: TextStyle(color: primaryColor, fontSize: 16.0),
                  ),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    side: BorderSide(color: primaryColor, width: 2.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}