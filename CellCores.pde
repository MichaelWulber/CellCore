// Michael Wulber
// 6/2/18

Culture culture;
Cell cell;

void setup() {
  size(720, 720);
  background(40);
  frameRate(60);
  float border = width/20.0f;
  
  float x0 = border;
  float x1 = width - border;
  float y0 = border;
  float y1 = height - border;
  
  PVector[] vertices = new PVector[]{ 
    new PVector(border, border),
    new PVector(border, height - border),
    new PVector(width - border, height - border),
    new PVector(width - border, border)
  };
  
  // test npoly triangulation
  PVector[] verts = new PVector[3];
  PVector c = new PVector(width/2, height/2);
  float r = width/2 - 10;
  float theta = 2*PI/verts.length;
  for (int i = 0; i < verts.length; ++i) {
    verts[i] = new PVector(c.x + cos(i * theta) * r, c.y + sin(i * theta) * r);
  }
  
  NPolygon npoly = new NPolygon(verts);
  NPolygon quad = new NPolygon(vertices);
  
  cell = new Cell(npoly, color(255));
  culture = new Culture(cell);
} 

void draw() {
  background(40);
  culture.render();
  culture.grow();
  
  // if rendering demo uncomment
  saveFrame("frames/cell_growth_####.png");
  
  // uncomment to render the cursor as a blue circle
  // renderCursor();
}

void renderCursor() {
  noStroke();
  fill(92, 240, 255);
  ellipse(mouseX, mouseY, 20, 20);
}