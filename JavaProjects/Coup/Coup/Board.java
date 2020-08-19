package Coup;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.Point;

import javax.swing.JPanel;

public class Board extends JPanel {
    public static Color blue = new Color(255);

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);

        g.setColor(blue);
        g.fillRect(0, 0, 800, 700);

        Coup coup = Coup.coup;
    }
}