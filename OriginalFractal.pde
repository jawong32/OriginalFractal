public void setup() {
  size(800, 800, P3D);
  background(0);
  stroke(255, 0, 0);
  strokeWeight(3);
  noFill();
}

public void draw() {
  translate(300, 300, 10);
  oct(10, 0);
  translate(10 + 20 / (float) Math.sqrt(2), 0);
  oct(10, 0);
}

public void oct(int len, int z) {
  final float RT2 = (float) Math.sqrt(2);
  final float DIAG = len / RT2;
  beginShape();
  vertex(0, DIAG, z);
  vertex(DIAG, 0, z);
  vertex(len + DIAG, 0, z);
  vertex(len + 2 * DIAG, DIAG, z);
  vertex(len + 2 * DIAG, len + DIAG, z);
  vertex(len + DIAG, len + 2 * DIAG, z);
  vertex(DIAG, len + 2 * DIAG, z);
  vertex(0, len + DIAG, z);
  vertex(0, DIAG, z);
  endShape();
}
