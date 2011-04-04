/**
 * ...
 * @author Franco Ponticelli
 */

package thx.math.scale;

import utest.Assert;
import utest.Runner;
import utest.ui.Report;

class TestAll
{
	public static function addTests(runner : Runner)
	{
		runner.addCase(new TestLinear());
		runner.addCase(new TestLinearString());
		runner.addCase(new TestLog());
		runner.addCase(new TestOrdinal());
		runner.addCase(new TestPow());
		runner.addCase(new TestQuantile());
		runner.addCase(new TestQuantize());
	}
	
	public static function main()
	{
		var runner = new Runner();
		addTests(runner);
		Report.create(runner);
		runner.run();
	}
	
	function assertScale(scalef : Float -> Float, expected : Array<Float>, values : Array<Float>)
	{
		for (i in 0...expected.length)
			Assert.floatEquals(expected[i], scalef(values[i]), 1e-3);
	}
	
	public function new();
}