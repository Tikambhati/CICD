import 'package:cupertino_ui/cupertino_ui.dart';
import 'package:material_ui/material_ui.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      showMessage('Please enter your email and password');
      return;
    }

    if (!emailController.text.contains('@')) {
      showMessage('Please enter a valid email');
      return;
    }

    if (passwordController.text.length < 6) {
      showMessage('Password must be at least 6 characters');
      return;
    }

    setState(() => isLoading = true);

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() => isLoading = false);
    showMessage('Login successful!');
  }

  void showMessage(String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFF080D1B);
    const accent = Color(0xFF8B7CFF);

    return CupertinoPageScaffold(
      backgroundColor: background,
      child: Stack(
        children: [
          // Background decoration
          Positioned(
            top: -120,
            right: -100,
            child: Container(
              height: 320,
              width: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF6554D9).withValues(alpha: 0.20),
              ),
            ),
          ),

          Positioned(
            bottom: 100,
            left: -160,
            child: Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF2676D9).withValues(alpha: 0.12),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Logo
                  Row(
                    children: [
                      Container(
                        height: 43,
                        width: 43,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF9B8AFF), Color(0xFF6554D9)],
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          CupertinoIcons.bolt_fill,
                          color: CupertinoColors.white,
                          size: 23,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'NEXUS',
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 3,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 65),

                  // Welcome Text
                  const Text(
                    'WELCOME BACK',
                    style: TextStyle(
                      color: Color(0xFF9B8AFF),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    'Sign in to your\naccount.',
                    style: TextStyle(
                      color: CupertinoColors.white,
                      fontSize: 38,
                      height: 1.18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1.2,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    'Your workspace is waiting for you.\nEnter your details to continue.',
                    style: TextStyle(
                      color: Color(0xFF9299AB),
                      fontSize: 15,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Login Card
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: const Color(0xFF151C2E),
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email Address',
                          style: TextStyle(
                            color: Color(0xFFDCE0EB),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 12),

                        buildTextField(
                          controller: emailController,
                          hint: 'name@example.com',
                          icon: CupertinoIcons.mail,
                          keyboardType: TextInputType.emailAddress,
                        ),

                        const SizedBox(height: 25),

                        const Text(
                          'Password',
                          style: TextStyle(
                            color: Color(0xFFDCE0EB),
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 12),

                        buildTextField(
                          controller: passwordController,
                          hint: 'Enter your password',
                          icon: CupertinoIcons.lock,
                          obscure: !isPasswordVisible,
                          suffix: GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child: Icon(
                              isPasswordVisible
                                  ? CupertinoIcons.eye_slash
                                  : CupertinoIcons.eye,
                              color: const Color(0xFF9299AB),
                              size: 20,
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        Align(
                          alignment: Alignment.centerRight,
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              showMessage('Forgot password selected');
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Color(0xFFAA9DFF),
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            borderRadius: BorderRadius.circular(15),
                            color: accent,
                            onPressed: isLoading ? null : login,
                            child: isLoading
                                ? const CupertinoActivityIndicator(
                                    color: CupertinoColors.white,
                                  )
                                : const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Sign In',
                                        style: TextStyle(
                                          color: CupertinoColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        CupertinoIcons.arrow_right,
                                        color: CupertinoColors.white,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Divider
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: const Color(0xFF293147),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'OR CONTINUE WITH',
                          style: TextStyle(
                            color: Color(0xFF747D91),
                            fontSize: 10,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: const Color(0xFF293147),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Apple Login
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      borderRadius: BorderRadius.circular(15),
                      color: const Color(0xFF20283B),
                      onPressed: () {
                        showMessage('Apple Sign In selected');
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.device_phone_portrait,
                            color: CupertinoColors.white,
                            size: 19,
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Continue with Apple',
                            style: TextStyle(
                              color: CupertinoColors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Sign Up
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Color(0xFF9299AB),
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showMessage('Sign Up selected');
                          },
                          child: const Text(
                            'Create Account',
                            style: TextStyle(
                              color: Color(0xFFAA9DFF),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  const Center(
                    child: Text(
                      'SECURE LOGIN  •  POWERED BY NEXUS',
                      style: TextStyle(
                        color: Color(0xFF555F73),
                        fontSize: 9,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscure = false,
    Widget? suffix,
  }) {
    return CupertinoTextField(
      controller: controller,
      placeholder: hint,
      placeholderStyle: const TextStyle(color: Color(0xFF68738A), fontSize: 14),
      style: const TextStyle(color: CupertinoColors.white, fontSize: 14),
      keyboardType: keyboardType,
      obscureText: obscure,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      prefix: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Icon(icon, color: const Color(0xFF9299AB), size: 19),
      ),
      suffix: suffix == null
          ? null
          : Padding(padding: const EdgeInsets.only(right: 14), child: suffix),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1424),
        borderRadius: BorderRadius.circular(13),
        border: Border.all(color: const Color(0xFF303A50)),
      ),
    );
  }
}
