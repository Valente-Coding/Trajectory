class Projectile {
  float m_x, m_y, m_size;
  float m_gravity = -9.81;
  float m_velocityX = 0;
  float m_velocityY = 0;
  float m_simulationSpeed = 0.05;
  boolean m_freeze = false;

  Projectile(float p_startX, float p_startY, float p_size, float p_forceX, float p_forceY, float p_gravity) {
    m_x = p_startX;
    m_y = p_startY;
    m_size = p_size;
    m_velocityX = p_forceX;
    m_velocityY = p_forceY;
    m_gravity = p_gravity;
  }

  void Draw() {
    if (m_freeze == false) {
      m_velocityY += m_gravity * m_simulationSpeed;

      m_x += m_velocityX * m_simulationSpeed;
      m_y += m_velocityY * m_simulationSpeed;
    }

    fill(0);
    circle(m_x, m_y, 10);
  }
}
