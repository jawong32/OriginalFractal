final static float ANGLE = (float) Math.PI / 2;
boolean showColor = false;
float x = 0, y = 0, z = 0;

public void setup() {
  size(900, 900, P3D);
  stroke(255);
}

public void draw() {
  background(0);
  translate(450, 450);
  rotateX(radians(x));
  rotateY(radians(y));
  rotateZ(radians(z));
  strokeWeight(10);
  line(0, 0, 0, -40);
  translate(0, -40);
  tree(10, 100);

  if (keyPressed) {
    if (key == 'w' || key == 'W')
      x += 2;
    if (key == 'a' || key == 'A')
      y -= 2;
    if (key == 's' || key == 'S')
      x -= 2;
    if (key == 'd' || key == 'D')
      y += 2;
    if (key == ' ') {
      x = 0;
      y = 0;
      z = 0;
    }
  }
}

// Using the Processing documentation's example Tree algorithmn
// because I couldn't think of anything that would work as well
// The FractalTree repo's rotation of axes would be hard to work
// with with the 3rd branch and 3D
public void tree(float chonk, float len) {
  if (len < 18) return;

  color b1 = showColor ? #408ec6 : 255;
  color b2 = showColor ? #ff6e40 : 255;
  color b3 = showColor ? #8a307f : 255;


  pushMatrix();
  stroke(b1);
  strokeWeight(chonk);
  rotateZ(ANGLE);
  rotateY(radians(120));
  rotateX(ANGLE / 2);
  line(0, 0, 0, -len);
  translate(0, -len);
  tree(chonk * 0.7, len * 0.8);
  popMatrix();

  pushMatrix();
  stroke(b2);
  strokeWeight(chonk);
  rotateZ(-ANGLE);
  rotateY(radians(-120));
  rotateX(ANGLE / 2);
  line(0, 0, 0, -len);
  translate(0, -len);
  tree(chonk * 0.7, len * 0.8);
  popMatrix();

  pushMatrix();
  stroke(b3);
  strokeWeight(chonk);
  rotateX(ANGLE);
  line(0, 0, 0, -len);
  translate(0, -len);
  tree(chonk * 0.7, len * 0.8);
  popMatrix();
}

public void keyPressed() {
  if (key == 'c' || key == 'C')
    showColor = !showColor;
}
