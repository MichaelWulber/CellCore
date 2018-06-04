class Pallet {
  public color[] colors;
  
  Pallet(color... colors) {
    this.colors = colors;
  }
  
  public color getRandomColor() {
    return colors[ (int)(random(colors.length)) ];
  }
}