class Cannon {
  float m_x = 0;
  float m_y = 0;
  float m_angle = 0;
  float m_width = 0;
  float m_height = 0;
  float m_force = 10f;
  float m_minForce = 10f;
  float m_maxForce = 100f;
  float m_forceDisplayHeight = height - 200;
  float m_forceDisplayX = width - 25;
  float m_forceDisplayY = height / 2;
  


  Cannon(float p_x, float p_y, float p_width, float p_height) {
    m_x = p_x;
    m_y = p_y;
    m_width = p_width;
    m_height = p_height;
  }

  void Draw() {
    fill(0);
    translate(m_x, m_y); // Positionar o canhao no centro do canvas
    m_angle = GetAngle(m_x, m_y, mouseX, mouseY); // Obter o angulo do canhao para o rato
    rotate(m_angle); // Rodar o canvas ao angulo
    rect(0, 0, m_width, m_height); // Desenhar o canhao no ecra
    rotate(-m_angle); // Colocar o angulo de volta
    translate(-m_x, -m_y);
  }

  float[] GetPivot() {
    float[] pos = new float[2];

    pos[0] = m_x + (m_width / 2) * cos(m_angle + PI);
    pos[1] = m_y + (m_width / 2) * sin(m_angle + PI);

    return pos;
  }

  void SetForce(float value) {
    m_force = value;

    if (m_force < m_minForce)
      m_force = m_minForce;


    if (m_force > m_maxForce)
      m_force = m_maxForce;
  }

  float[] GetForce() {
    float[] pos = new float[2];

    pos[0] = m_force * cos(m_angle + PI);
    pos[1] = m_force * sin(m_angle + PI);

    return pos;
  }
  float GetAngle(float p_groundX, float p_groundY, float p_x, float p_y) {
    return atan2((p_groundY - p_y), (p_groundX - p_x));
  }

  void DrawForce() {
    float l_forceSize = map(m_force, m_minForce, m_maxForce, 4, m_forceDisplayHeight - 8);

    fill(0);
    rect(m_forceDisplayX, m_forceDisplayY - (m_forceDisplayHeight / 2), 40, 4);
    rect(m_forceDisplayX, m_forceDisplayY + (m_forceDisplayHeight / 2), 40, 4);
    rect(m_forceDisplayX, m_forceDisplayY + (m_forceDisplayHeight / 2) - (l_forceSize/2) - 4, 30, l_forceSize);
  }
}
