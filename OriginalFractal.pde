public float rot = 0;

public void setup() {
  size(900, 900, P3D);
  background(0);
  stroke(255, 0, 0);
  strokeWeight(3);
  noFill();
}

public void draw() {
  translate(400, 800);
  background(0);
  rotateX((float) Math.PI / 2);
  rotateZ(rot);
  octTest(100, 10, 0);
  rot += 0.1;
}

public void octTest(int len, float z1, int z2) {
  if (len < 1) {
    return;
  }
  translate(0, 0, z1 * 1.03);
  stroke((int)(Math.random() * 255));
  oct3D(len, z1, z2);
  octTest(len - 5, z1 * 1.1, z2);
}

public void oct3D(int len, float z1, int z2) {
  final float diag = len / (float) Math.sqrt(2);
  oct(len, diag, z1);
  beginShape(LINES);
  vertex(0, diag, z1);
  vertex(0, diag, z2);
  vertex(diag, 0, z1);
  vertex(diag, 0, z2);
  vertex(len + diag, 0, z1);
  vertex(len + diag, 0, z2);
  vertex(len + 2 * diag, diag, z1);
  vertex(len + 2 * diag, diag, z2);
  vertex(len + 2 * diag, len + diag, z1);
  vertex(len + 2 * diag, len + diag, z2);
  vertex(len + diag, len + 2 * diag, z1);
  vertex(len + diag, len + 2 * diag, z2);
  vertex(diag, len + 2 * diag, z1);
  vertex(diag, len + 2 * diag, z2);
  vertex(0, len + diag, z1);
  vertex(0, len + diag, z2);
  vertex(0, diag, z1);
  vertex(0, diag, z2);
  endShape();
  oct(len, diag, z2);
  System.out.println(len + 2 * diag);
}

public void oct(int len, float diag, float z) {
  beginShape();
  vertex(0, diag, z);
  vertex(diag, 0, z);
  vertex(len + diag, 0, z);
  vertex(len + 2 * diag, diag, z);
  vertex(len + 2 * diag, len + diag, z);
  vertex(len + diag, len + 2 * diag, z);
  vertex(diag, len + 2 * diag, z);
  vertex(0, len + diag, z);
  vertex(0, diag, z);
  endShape();
}
