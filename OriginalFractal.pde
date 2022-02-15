final static float ANGLE = (float) Math.PI / 16;

public void setup() {
  size(800, 800);
  stroke(255);
  strokeWeight(1);
}

public void draw() {
  background(0);
  translate(400, 800);
  line(0, 0, 0, -40);
  translate(0, -40);
  tree(-40, 30);
}

public void tree(int y, int len) {
  if (len > 1) {
    pushMatrix();
    rotate(ANGLE);
    line(0, 0, 0, -len);
    translate(0, -len);
    tree(y - len, len - 2);
    popMatrix();

    pushMatrix();
    rotate(-ANGLE);
    line(0, 0, 0, -len);
    translate(0, -len);
    tree(y - len, len - 1);
    popMatrix();
  }
}
