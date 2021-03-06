using static raylib_beef.Raylib;
using raylib_beef.Types;
using static raylib_beef.Raymath;
using System;
namespace Boids.lib
{
	public enum Pivot{
		CORNER,
		CENTER
	}
	/*
		Title: UIElement
		Description: Base class for UI elements such as buttons, textfields, etc.
	*/
	class UIElement
	{
		public Vector2 Position;
		public Vector2 AbsolutePosition;
		public Vector2 RelativePosition{get; private set;};
		public Vector2 Size;
		public Pivot pivot = Pivot.CENTER;
		public Rectangle Bounds;
		public bool isMouseOver => IsMouseOver();
		public Color color;

		public this(Vector2 pos, Vector2 size, Color c){
		}

		public this(Rectangle rect, Color c){
			
		}
		private bool IsMouseOver(){
			return CheckCollisionPointRec(GetMousePosition(),.(Position.x,Position.y,Bounds.width,Bounds.height));
		}
		private void UpdateRelativePosition(){
			RelativePosition=Vector2DivideV(.(
				Bounds.x-(Bounds.width/2),
				Bounds.y-(Bounds.height/2)
			),.(baseScreenWidth,baseScreenHeight));
		}

		public virtual void Draw(){
			UpdateRelativePosition();
			AbsolutePosition.x=(RelativePosition.x*GetScreenWidth())+Position.x;
			AbsolutePosition.y=RelativePosition.y*GetScreenHeight()+Position.y;

		}
		public virtual void Update(){
		}
	}
}
