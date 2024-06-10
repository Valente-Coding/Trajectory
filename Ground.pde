class Ground {
  float m_x = 0;
  float m_y = 0;
  float m_height = 0;

  Ground(float p_x, float p_y, float p_height) {
    m_x = p_x;
    m_y = p_y;
    m_height = p_height;
  }

  void Draw() {
    fill(0);
    rect(width/2 + m_x, m_y, width, m_height);
  }
}
