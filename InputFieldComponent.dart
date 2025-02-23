import 'package:flutter/material.dart';

class InputFieldComponent extends StatefulWidget {
  final String usernameHint;
  final String emailHint;
  final String passwordHint;
  final String confirmPasswordHint;

  InputFieldComponent({
    this.usernameHint = 'John Doe',
    this.emailHint = 'Johndoe123@gmail.com',
    this.passwordHint = '********',
    this.confirmPasswordHint = '********',
  });

  @override
  _InputFieldComponentState createState() => _InputFieldComponentState();
}

class _InputFieldComponentState extends State<InputFieldComponent> {
  bool _isPasswordVisible1 = false;
  bool _isPasswordVisible2 = false;
  
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Username Field
              _buildInputField(
                label: 'Username',
                controller: _usernameController,
                hintText: widget.usernameHint,
              ),
              SizedBox(height: 16),

              // Email Field
              _buildInputField(
                label: 'Email',
                controller: _emailController,
                hintText: widget.emailHint,
              ),
              SizedBox(height: 16),

              // Password Field
              _buildInputField(
                label: 'Password',
                controller: _passwordController,
                hintText: widget.passwordHint,
                obscureText: !_isPasswordVisible1,
                toggleVisibility: () {
                  setState(() {
                    _isPasswordVisible1 = !_isPasswordVisible1;
                  });
                },
                isPassword: true,
              ),
              SizedBox(height: 16),

              // Confirm Password Field
              _buildInputField(
                label: 'Confirm Password',
                controller: _confirmPasswordController,
                hintText: widget.confirmPasswordHint,
                obscureText: !_isPasswordVisible2,
                toggleVisibility: () {
                  setState(() {
                    _isPasswordVisible2 = !_isPasswordVisible2;
                  });
                },
                isPassword: true,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    VoidCallback? toggleVisibility,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xFF1E1E1E),
            fontWeight: FontWeight.w400,
            height: 1.4,
          ),
        ),
        SizedBox(height: 8),
        Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFFD9D9D9),
              width: 1,
            ),
          ),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 16,
                color: Color(0xFF5A5A5A),
                fontWeight: FontWeight.w400,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              border: InputBorder.none,
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Color(0xFF5A5A5A),
                      ),
                      onPressed: toggleVisibility,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}

