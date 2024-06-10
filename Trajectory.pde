Cannon c;
Projectile p;
Ground g;
HitMark h;
int currentP = 0;
void setup() {
  size(1200, 900);
  rectMode(CENTER);

  c = new Cannon(width/2, height/2, 70, 30);
  g = new Ground(0, height - 50, 4);
  h = new HitMark(-100, -100, 1);
}

void draw() {
  background(255);
  ControlsDisplay();
  CannonStats();

  c.Draw();
  c.DrawForce();
  g.Draw();

  if (p != null)
  {

    ProjectileStats();
    if (p.m_y >= g.m_y)
    {
      p.m_freeze = true;
      h.m_x = p.m_x;
      h.m_y = p.m_y;
    }

    p.Draw();
  }

  if (h != null)
    h.Draw();
}

void mouseReleased() {
  Fire();
}

void keyPressed() {
  if (key == CODED) {

    if (keyCode == UP)
      c.m_y -= 10;

    if (keyCode == DOWN)
      c.m_y += 10;

    if (keyCode == LEFT)
      c.m_x -= 10;

    if (keyCode == RIGHT)
      c.m_x += 10;
  }

  if (key == ' ') {
    //Fire();
    if (p != null)
      p.m_freeze = !p.m_freeze;
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();

  if (-1f == e)
    c.SetForce(c.m_force + 10f);

  if (1f == e)
    c.SetForce(c.m_force - 10f);
}

void Fire() {
  //p.m_freeze = false;
  float[] l_pivot = c.GetPivot();
  float[] l_force = c.GetForce();

  p = new Projectile(l_pivot[0], l_pivot[1], 10, l_force[0], l_force[1], 9.81);

  m_projectileLaunchX = round(l_pivot[0] * 10) / 10;
  m_projectileLaunchY = round((g.m_y - l_pivot[1]) * 10) / 10;
  m_projectileMaxVelocityX = 0;
  m_projectileMaxVelocityY = 0;
  m_projectileLaunchAngle = (round(-(degrees(c.m_angle) - 180) * 10) / 10);
  m_projectileLaunchForce = (round(c.m_force * 10) / 10);
  m_projectileMaxHeight = m_projectileLaunchY;
}


float m_projectileMaxHeight = 9999999;
float m_projectileMaxVelocityX = 0;
float m_projectileMaxVelocityY = 0;
float m_projectileLaunchAngle = 0;
float m_projectileLaunchForce = 0;
float m_projectileLaunchX = 0;
float m_projectileLaunchY = 0;
void ProjectileStats() {
  float l_projectileVelocityX = round(p.m_velocityX * 10) / 10;
  float l_projectileVelocityY = round(p.m_velocityY * 10) / 10;

  if (l_projectileVelocityX < 0) l_projectileVelocityX = -l_projectileVelocityX;
  if (l_projectileVelocityY < 0) l_projectileVelocityY = -l_projectileVelocityY;

  if (m_projectileMaxVelocityX < l_projectileVelocityX) m_projectileMaxVelocityX = l_projectileVelocityX;
  if (m_projectileMaxVelocityY < l_projectileVelocityY) m_projectileMaxVelocityY = l_projectileVelocityY;
  
  if (m_projectileMaxHeight < round((g.m_y - p.m_y) * 10) / 10) m_projectileMaxHeight = round((g.m_y - p.m_y) * 10) / 10;

  fill(0);
  textSize(10);
  text("Projectile X: " + (round(p.m_x * 10) / 10) + " | Projectile Y: " + (round((g.m_y - p.m_y) * 10) / 10) + " | Launch Angle: " + m_projectileLaunchAngle + " | Launch Force: " + m_projectileLaunchForce + " | Initial X: " + m_projectileLaunchX + " | Initial Y: " + m_projectileLaunchY + " | Max Height: " + m_projectileMaxHeight + "| Velocity X: " + l_projectileVelocityX  + " | Velocity Y: " + l_projectileVelocityY + " | Max Velocity X: " + m_projectileMaxVelocityX  + " | Max Velocity Y: " + m_projectileMaxVelocityY, 10, height - 10);
  text((round((g.m_x + p.m_x) * 10) / 10), p.m_x, g.m_y - 10);
  text((round((g.m_y - p.m_y) * 10) / 10), g.m_x + 10, p.m_y);
}

void CannonStats() {
  float[] l_projectileStartPosition = c.GetPivot();
  l_projectileStartPosition[0] = l_projectileStartPosition[0] - g.m_x;
  l_projectileStartPosition[1] = g.m_y - l_projectileStartPosition[1];
  fill(0);
  textSize(10);
  text("Cannon X: " + (round((c.m_x - g.m_x) * 10) / 10) + " | Cannon Y: " + (round((g.m_y - c.m_y) * 10) / 10) + " | Force: " + (round(c.m_force * 10) / 10) + " | Angle: " + (round(-(degrees(c.m_angle) - 180) * 10) / 10) + " | Pojectile Start Position X: " + (round(l_projectileStartPosition[0] * 10) / 10) + " | Pojectile Start Position Y: " + (round(l_projectileStartPosition[1] * 10) / 10), 10, height - 25);
}

void ControlsDisplay() {
  fill(0);
  textSize(10);
  text("Mouse Position = Direction of Trajectory | Mouse Button = Fire | Space = Freeze Time | Arrows = Cannon Movement | Scroll = Cannon Force", 10, 10);
}
