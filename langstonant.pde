ArrayList<pixel> screen = new ArrayList<pixel>();
int pixelSize = 1;
int[] pos = new int[2];
int dir; //0 - up, 1 - right, 2 - down, 3 - left RRLLLRLLLLLL
int[] instructions = {-1,-1,1,1,1,-1,1,1,1,1,1,1}; //1 left, -1 right

void setup() {
  size(1280, 720);
  for (int i = 0; i < width/pixelSize; i++) {
    for (int j = 0; j < height/pixelSize; j++) {
      screen.add(new pixel(i, j));
    }
  }
  colorMode(RGB);
  pos[0] = (width/pixelSize)/2;
  pos[1] = (height/pixelSize)/2;
  dir = 0;
}

void draw() {
  for (int k = 0; k < 10000; k++) {
    int status = screen.get(convertCoords(pos)).status;
    changeDir(instructions[status]);
    screen.get(convertCoords(pos)).status = status+1;
    if (status+1 >= instructions.length) {
      screen.get(convertCoords(pos)).status = 0;
    }
    changePos();
  }
  for (int i = 0; i < screen.size(); i++) {
    screen.get(i).show();
  }
  fill(255, 0, 0);
  rect(pos[0] * pixelSize, pos[1] * pixelSize, pixelSize, pixelSize);
}

int convertCoords(int[] x) {
  return x[0] * ((int)height/pixelSize) + x[1];
}

void changePos() {
  if (dir == 0) {
    pos[1]--;
  } else if (dir == 1) {
    pos[0]++;
  } else if (dir == 2) {
    pos[1]++;
  } else if (dir == 3) {
    pos[0]--;
  }
  if (pos[0] >= width/pixelSize) {
    pos[0] = 0;
  }
  if (pos[0] < 0) {
    pos[0] = width/pixelSize - 1;
  }
  if (pos[1] >= height/pixelSize) {
    pos[1] = 0;
  }
  if (pos[1] < 0) {
    pos[1] = height/pixelSize - 1;
  }
}

void changeDir(int x) { //-1 = left, 1 = right
  dir += x;
  if (dir >= 4) {
    dir -= 4;
  }
  if (dir <= -1) {
    dir += 4;
  }
}
