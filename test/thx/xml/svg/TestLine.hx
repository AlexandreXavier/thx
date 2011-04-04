package thx.xml.svg;

import utest.Assert;
import thx.xml.svg.LineInterpolator;

class TestLine
{
	public function testDefault()
	{
		var line = Line.pointArray();
		
		Assert.equals("M0,0", line.shape([[0.0, 0.0]]));
		Assert.equals("M0,0L1,1", line.shape([[0.0, 0.0], [1.0, 1.0]]));
		Assert.equals("M0,0L1,1L2,0", line.shape([[0.0, 0.0], [1.0, 1.0], [2.0, 0.0]]));
	}
	
	public function testY()
	{
		var line = Line.pointArray().y(function(_, _) return -1);
		
		Assert.equals("M0,-1", line.shape([[0.0, 0.0]]));
		Assert.equals("M0,-1L1,-1", line.shape([[0.0, 0.0], [1.0, 1.0]]));
		Assert.equals("M0,-1L1,-1L2,-1", line.shape([[0.0, 0.0], [1.0, 1.0], [2.0, 0.0]]));
	}
	
	public function testXY()
	{
		var line = Line.pointObject();
		
		Assert.equals("M0,0", line.shape([{x:0.0, y:0.0}]));
		Assert.equals("M0,0L1,1", line.shape([{x:0.0, y:0.0}, {x:1.0, y:1.0}]));
		Assert.equals("M0,0L1,1L2,0", line.shape([{x:0.0, y:0.0}, {x:1.0, y:1.0}, {x:2.0, y:0.0}]));
	}
	
	public function testStepBefore()
	{
		var line = Line.pointArray().interpolator(StepBefore);
		
		Assert.equals("M0,0", line.shape([[0.0, 0.0]]));
		Assert.equals("M0,0V1H1", line.shape([[0.0, 0.0], [1.0, 1.0]]));
		Assert.equals("M0,0V1H1V0H2", line.shape([[0.0, 0.0], [1.0, 1.0], [2.0, 0.0]]));
	}
	
	public function testStepAfter()
	{
		var line = Line.pointArray().interpolator(StepAfter);
		
		Assert.equals("M0,0", line.shape([[0.0, 0.0]]));
		Assert.equals("M0,0H1V1", line.shape([[0.0, 0.0], [1.0, 1.0]]));
		Assert.equals("M0,0H1V1H2V0", line.shape([[0.0, 0.0], [1.0, 1.0], [2.0, 0.0]]));
	}
	
	public function testBasis()
	{
		var line = Line.pointArray().interpolator(Basis);
		
		Assert.equals("M0,0", line.shape([[0.0, 0.0]]));
		Assert.equals("M0,0L1,1", line.shape([[0.0, 0.0], [1.0, 1.0]]));
		Assert.equals("M0,0C0,0,0,0,1,1C2,2,4,4,6,4C8,4,10,2,11,1C12,0,12,0,12,0", line.shape([[0.0, 0.0], [6.0, 6.0], [12.0, 0.0]]));
	}
	
	public function testBasisClosed()
	{
		var line = Line.pointArray().interpolator(BasisClosed);
		
		Assert.equals("M0,0C0,0,0,0,0,0", line.shape([[0.0, 0.0]]));
		Assert.equals("M2,2C2,2,4,4,4,4C4,4,2,2,2,2", line.shape([[0.0, 0.0], [6.0, 6.0]]));
		Assert.equals("M9,1C8,0,4,0,3,1C2,2,4,4,6,4C8,4,10,2,9,1", line.shape([[0.0, 0.0], [6.0, 6.0], [12.0, 0.0]]));
	}
	
	public function testCardinal()
	{
		var line = Line.pointArray().interpolator(Cardinal());
		
		Assert.equals("M0,0", line.shape([[0.0, 0.0]]));
		Assert.equals("M0,0L5,5", line.shape([[0.0, 0.0], [5.0, 5.0]]));
		Assert.equals("M0,0Q4,5,5,5Q6,5,10,0", line.shape([[0.0, 0.0], [5.0, 5.0], [10.0, 0.0]]));
	}
	
	public function testCardinalClosed()
	{
		var line = Line.pointArray().interpolator(CardinalClosed());
		
		Assert.equals("M0,0", line.shape([[0.0, 0.0]]));
		Assert.equals("M0,0L5,5", line.shape([[0.0, 0.0], [5.0, 5.0]]));
		Assert.equals("M0,0C0,0,3.5,5,5,5S10,0,10,0", line.shape([[0.0, 0.0], [5.0, 5.0], [10.0, 0.0]]));
	}
	
	public function new();
}