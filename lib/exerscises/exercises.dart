class Exercise {
  final String name;
  final String description;
  final String imagePath;

  Exercise({required this.name, required this.description, required this.imagePath});
}

List<Exercise> exampleExercises = [
  Exercise(
    name: 'Jumping Jacks',
    description: 'Start with your feet together and arms at your sides. Jump, spreading your legs out wide while simultaneously raising your arms above your head. Jump back to the starting position.',
    imagePath: 'assets/images/jumping jacks.png',
  ),
  Exercise(
    name: 'Push-ups',
    description: 'Begin in a plank position with your hands shoulder-width apart. Lower your body until your chest nearly touches the floor, then push back up to the starting position.',
    imagePath: 'assets/images/pushups.png',
  ),
  Exercise(
    name: 'Squats',
    description: 'Stand with your feet hip-width apart, toes slightly turned out. Lower your body as if you were sitting back into a chair, keeping your chest up and knees aligned with your toes. Push through your heels to return to standing.',
    imagePath: 'assets/images/squat.png',
  ),
  Exercise(
    name: 'Lunges',
    description: 'Stand with your feet together. Step forward with one leg and lower your body until both knees are bent at a 90-degree angle. Push through your front heel to return to the starting position and repeat with the other leg.',
    imagePath: 'assets/images/lunges.png',
  ),
  Exercise(
    name: 'Plank',
    description: 'Start in a push-up position, but with your weight resting on your forearms instead of your hands. Keep your body in a straight line from head to heels, engaging your core muscles.',
    imagePath: 'assets/images/plank.png',
  ),
  Exercise(
    name: 'Burpees',
    description: 'Begin standing, then squat down and place your hands on the floor. Jump your feet back into a plank position, perform a push-up, then jump your feet back towards your hands and explosively jump up into the air with arms raised.',
    imagePath: 'assets/images/burpees.png',
  ),
  Exercise(
    name: 'Mountain Climbers',
    description: 'Start in a plank position. Alternate bringing your knees towards your chest in a running motion while keeping your core engaged.',
    imagePath: 'assets/images/mountain-climbers.png',
  ),
  Exercise(
    name: 'Bicycle Crunches',
    description: 'Lie on your back with your hands behind your head. Lift your shoulders off the floor and bring your knees towards your chest. Rotate your torso, bringing your right elbow towards your left knee while extending your right leg. Repeat on the other side.',
    imagePath: 'assets/images/bicycle-crunches.png',
  ),
  Exercise(
    name: 'High Knees',
    description: 'Stand in place and alternate lifting your knees as high as possible while pumping your arms.',
    imagePath: 'assets/images/high-knees.png',
  ),  Exercise(
    name: 'Jump Squats',
    description: 'Perform a regular squat, but explode upward into a jump as you return to standing. Land softly and immediately lower back into the squat position.',
    imagePath: 'assets/images/jump-squat.png',
  ),  Exercise(
    name: 'Tricep Dips using a Chair',
    description: 'Sit on the edge of a sturdy chair or bench with your hands gripping the edge. Slide your bottom off the chair and lower your body until your elbows are bent at a 90-degree angle, then push back up to the starting position.',
    imagePath: 'assets/images/tricep-dips.png',
  ),
  Exercise(
    name: 'Russian Twists',
    description: 'Sit on the floor with your knees bent and feet elevated off the ground. Lean back slightly and clasp your hands together. Twist your torso to one side, then to the other, while keeping your core engaged.',
    imagePath: 'assets/images/russian-twist.png',
  ),
  Exercise(
    name: 'Jump Rope',
    description: 'Use a jump rope to perform continuous jumps, landing softly on the balls of your feet and swinging the rope with your wrists.',
    imagePath: 'assets/images/jump-rope.png',
  ),
  Exercise(
    name: 'Superman (Back Extension)',
    description: 'Lie face down on the floor with your arms extended in front of you. Lift your arms, chest, and legs off the floor simultaneously, keeping your neck in line with your spine.',
    imagePath: 'assets/images/superman.png',
  ),
  Exercise(
    name: 'Side Plank',
    description: 'Lie on your side with your legs straight and prop yourself up on your elbow, forming a straight line from head to heels. Hold this position, then switch sides.',
    imagePath: 'assets/images/side-plank.png',
  ),
  Exercise(
    name: 'Flutter Kicks',
    description: 'Lie on your back with your hands under your glutes. Lift your legs off the ground a few inches and alternate kicking them up and down in a fluttering motion.',
    imagePath: 'assets/images/flutter-kicks.png',
  ),
  Exercise(
    name: 'Leg Raises',
    description: 'Lie on your back with your legs straight and lift them towards the ceiling, then slowly lower them back down without letting them touch the floor.',
    imagePath: 'assets/images/straight-leg-raise.png',
  ),
  Exercise(
    name: 'Arm Circles',
    description: 'Stand with your arms extended straight out to the sides. Make small circular motions with your arms, gradually increasing the size of the circles.',
    imagePath: 'assets/images/big-arm-circles.png',
  ),
  Exercise(
    name: 'Single-leg Deadlifts',
    description: 'Stand on one leg with a slight bend in your knee and hinge forward at the hips, lowering your torso towards the floor while lifting your other leg straight out behind you. Return to the starting position and repeat on the other side.',
    imagePath: 'assets/images/side-leg-lifts.png',
  ),
  Exercise(
    name: 'Pike Push-ups',
    description: 'Start in a downward dog position with your hips raised towards the ceiling and your hands and feet on the floor. Lower your head towards the floor by bending your elbows, then push back up to the starting position.',
    imagePath: 'assets/images/pike-push-up.png',
  ),
  Exercise(
    name: 'Reverse Crunches',
    description: 'Lie on your back with your knees bent and feet flat on the floor. Lift your feet off the floor and bring your knees towards your chest, then lower them back down without letting them touch the floor.',
    imagePath: 'assets/images/reverse-crunches.png',
  ),
  Exercise(
    name: 'Spiderman Crawls',
    description: 'Start in a plank position and bring your right knee towards your right elbow, then return to the plank position and repeat on the other side.',
    imagePath: 'assets/images/spidermancrawls.png',
  ),
  Exercise(
    name: 'Box Jumps',
    description: 'Stand in front of a stable platform or box. Jump onto the box, then step back down and repeat.',
    imagePath: 'assets/images/box jumps.png',
  ),
  Exercise(
    name: 'Commando Plank',
    description: 'Start in a plank position on your elbows. Push up onto one hand, then the other, until you are in a push-up position, then lower back down to the starting position.',
    imagePath: 'assets/images/commandoPlank.png',
  ),
  Exercise(
    name: 'Bodyweight Rows using a Sturdy Table',
    description: 'Lie under a sturdy table or grab onto a low bar, keeping your body straight. Pull your chest towards the table or bar, then lower yourself back down.',
    imagePath: 'assets/images/Bodyweight Rows using a Sturdy Table.png',
  ),
  Exercise(
    name: 'Calf Raises',
    description: 'Stand with your feet hip-width apart and rise up onto the balls of your feet, then lower back down.',
    imagePath: 'assets/images/calf-raises.png',
  ),
  Exercise(
    name: 'Bicycle Crunches',
    description: 'Lie on your back with your hands behind your head. Lift your shoulders off the floor and bring your knees towards your chest. Rotate your torso, bringing your right elbow towards your left knee while extending your right leg. Repeat on the other side.',
    imagePath: 'assets/images/',
  ),
  Exercise(
    name: 'Plank with Shoulder Taps',
    description: 'Start in a plank position and touch your left hand to your right shoulder, then return to the plank position and repeat with the other hand.',
    imagePath: 'assets/images/plank-shoulder-tap.png',
  ),
  Exercise(
    name: 'Jumping Lunges',
    description: 'Start in a lunge position with your right foot forward. Jump explosively into the air, switching legs so that your left foot is now forward when you land.',
    imagePath: 'assets/images/jumping-lunges.png',
  ),
  Exercise(
    name: 'Bear Crawls',
    description: 'Start in a plank position with your hands and feet on the floor. Crawl forward by moving your opposite hand and foot at the same time, keeping your hips low.',
    imagePath: 'assets/images/bearcrawls.png',
  ),
  Exercise(
    name: 'Walking Lunges',
    description: 'Take a large step forward with your right foot and lower your body until both knees are bent at a 90-degree angle. Push off your right foot to step forward with your left foot and repeat.',
    imagePath: 'assets/images/walking-lunges.png',
  ),
  Exercise(
    name: 'Wall Push-ups',
    description: 'Stand facing a wall with your arms extended straight out in front of you. Lean forward and place your palms on the wall, then push yourself back to the starting position.',
    imagePath: 'assets/images/Wall Push-ups.png',
  ),
  Exercise(
    name: 'Donkey Kicks',
    description: 'Start on your hands and knees with your wrists under your shoulders and knees under your hips. Lift one leg towards the ceiling while keeping your knee bent at a 90-degree angle, then lower it back down and repeat on the other side.',
    imagePath: 'assets/images/donkey-kick.png',
  ),
  Exercise(
    name: 'Fire Hydrants',
    description: 'Start on your hands and knees with your wrists under your shoulders and knees under your hips. Lift one knee out to the side, keeping it bent at a 90-degree angle, then lower it back down and repeat on the other side.',
    imagePath: 'assets/images/fire-hydrant.png',
  ),
  Exercise(
    name: 'Clamshells',
    description: 'Lie on your side with your knees bent and hips stacked. Keeping your feet together, open your top knee as far as you can, then lower it back down and repeat.',
    imagePath: 'assets/images/clamshell.png',
  ),
  Exercise(
    name: 'Glute Bridges',
    description: 'Lie on your back with your knees bent and feet flat on the floor. Lift your hips towards the ceiling, squeezing your glutes at the top, then lower back down.',
    imagePath: 'assets/images/glute-bridge.png',
  ),
  Exercise(
    name: 'Side Leg Lifts',
    description: 'Lie on your side with your legs straight and lift your top leg towards the ceiling, then lower it back down and repeat.',
    imagePath: 'assets/images/single-leg-deadlift.png',
  ),
  Exercise(
    name: 'Inchworms',
    description: 'Stand with your feet hip-width apart and bend forward, placing your hands on the floor in front of you. Walk your hands forward until you are in a plank position, then walk your feet towards your hands and stand back up.',
    imagePath: 'assets/images/inchworm.png',
  ),
  Exercise(
    name: 'Jumping Squats',
    description: 'Perform a regular squat, then explode into a jump as you return to standing.',
    imagePath: 'assets/images/jump-squat.png',
  ),
  Exercise(
    name: 'Plank with Leg Lifts',
    description: 'Start in a plank position and lift one leg towards the ceiling, then lower it back down and repeat on the other side.',
    imagePath: 'assets/images/plank-leg-lifts.png',
  ),
  Exercise(
    name: 'Tricep Push-ups',
    description: 'Start in a plank position with your hands close together and your elbows tucked into your sides. Lower your body until your chest nearly touches the floor, then push back up to the starting position.',
    imagePath: 'assets/images/tricep push ups.png',
  ),
  Exercise(
    name: 'Russian Twists with a Weight or Without',
    description: 'Sit on the floor with your knees bent and feet elevated off the ground. Lean back slightly and clasp your hands together, then twist your torso to one side, then to the other, while keeping your core engaged.',
    imagePath: 'assets/images/russian twists with weights.png',
  ),
  Exercise(
    name: 'Sumo Squats',
    description: 'Stand with your feet wider than hip-width apart and toes turned out. Lower your body into a squat, keeping your chest up and knees aligned with your toes, then push through your heels to return to standing.',
    imagePath: 'assets/images/sumo-squat.png',
),
  Exercise(
    name: 'Jumping Jacks with Dumbbells',
    description: 'Perform jumping jacks while holding dumbbells in each hand.',
    imagePath: 'assets/images/Jumping Jacks with Dumbbells.png',
  ),
  Exercise(
    name: 'Jumping Rope',
    description: 'Use a jump rope to perform continuous jumps, landing softly on the balls of your feet and swinging the rope with your wrists.',
    imagePath: 'assets/images/jump-rope.png',
  ),
  Exercise(
    name: 'Lateral Lunges',
    description: 'Stand with your feet together and take a large step to the right, lowering your body into a lunge while keeping your left leg straight. Push off your right foot to return to standing, then repeat on the other side.',
    imagePath: 'assets/images/Lateral Lunges.png',
  ),
  Exercise(
    name: 'Side Plank with Leg Lift',
    description: 'Start in a side plank position with your elbow on the ground. Lift your top leg towards the ceiling, then lower it back down and repeat.',
    imagePath: 'assets/images/side-leg-lifts',
  ),
  Exercise(
    name: 'Sit-to-Stand Chair Exercises',
    description: 'Sit in a chair with your feet flat on the floor. Stand up, then sit back down, using only your leg muscles.',
    imagePath: 'assets/images/Sit-to-Stand Chair Exercises.png',
  ),
  Exercise(
    name: 'Wall Handstands',
    description: 'Face a wall and kick up into a handstand position, using the wall for support. Hold the handstand position for as long as you can.',
    imagePath: 'assets/images/Wall Handstands (for advanced).png',
  ),

];