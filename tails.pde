public class Particle {
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  public float dimension;
  
  public int Ntail;
  public float[] xTail;
  public float[] yTail;
  
  //length of tail
  public void setTail(int Ntail) {
    this.Ntail = Ntail;
    
    this.xTail = new float[this.Ntail];
    this.yTail = new float[this.Ntail];
  }

  // dimension
  public void setDimension(float dimension) {
    this.dimension = dimension;
  }
  
  // position
  public void setPosition(float x, float y) {
    this.position.set(x, y);
  }
  public void updatePosition(PVector velocity) {
    this.position.add(velocity);
  }
  
  // velocity
  public void setVelocity(float vx, float vy) {
    this.velocity.set(vx, vy);
  }
  public void updateVelocity(PVector acceleration) {
    this.velocity.add(acceleration);
  }
  
  // acceleration
  public void setAcceleration(float ax, float ay) {
    this.acceleration.set(ax, ay);
  }
  
  // draw
  public void display() {
    for (int i=0;i<this.Ntail;i++) {
      circle(this.xTail[i], this.yTail[i], this.dimension);
    }
  }
}
