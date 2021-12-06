import com.thomasdiewald.pixelflow.java.DwPixelFlow;
import com.thomasdiewald.pixelflow.java.imageprocessing.filter.DwFilter;
import processing.opengl.PGraphics2D;
import processing.opengl.PGraphics3D;

DwPixelFlow context;
DwFilter filter;
PGraphics3D tex;
PMatrix mat_scene;

void bloomSetup() {  
  mat_scene = getMatrix();
  tex = (PGraphics3D) createGraphics(width, height, P3D);
  context = new DwPixelFlow(this);
  filter = new DwFilter(context);
  filter.bloom.param.mult = 0.5; 
  filter.bloom.param.radius = 0.5; 
}


void bloomDraw() {
  filter.bloom.apply(tex);
  image(tex, 0, 0);
}


void bloomMatrixStart() {
  pushMatrix();
}

void bloomMatrixEnd() {
  setMatrix(mat_scene);
  bloomDraw();
  popMatrix();
}
