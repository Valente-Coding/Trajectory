class HitMark {
  float m_x, m_y;
  float m_size;

  HitMark(float p_x, float p_y, float p_size) {
    m_x = p_x;
    m_y = p_y;
    m_size = p_size;
  }

  void Draw() {
    fill(0);
    translate(m_x, m_y);
    rotate(radians(45));
    rect(0, 0, 30 * m_size, 4 * m_size);
    rotate(-radians(45));
    rotate(-radians(45));
    rect(0, 0, 30 * m_size, 4 * m_size);
    rotate(radians(45));
    translate(-m_x, -m_y);
  }
}
