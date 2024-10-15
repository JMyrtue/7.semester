using TDD_ITV;

namespace TDD_test
{
    
    public class UnitTest1
    {
        fizzBuzzClass temp = new fizzBuzzClass();

        [Fact]
        public void take_string()
        {
            var expected = "4";
            Assert.Equal(temp.fizzBuzz(4), expected);

        }
        [Fact]
        public void correct_type()
        {
            Assert.IsType<String>(temp.fizzBuzz(5));
        }

        [Fact]
        public void not_type()
        {
            Assert.IsNotType<int>(temp.fizzBuzz(5));
        }
    }

    public class UnitTest2
    {
        fizzBuzzClass obj = new fizzBuzzClass();

        [Fact]
        public void MultOfThree()
        {
            var Expected = "Fizz";
            Assert.Equal(obj.fizzBuzz(6), Expected);
        }

        [Fact]
        public void NotMultOfThree()
        {
            var MultOfThreeResponse = "Fizz";
            Assert.NotEqual(obj.fizzBuzz(5), MultOfThreeResponse);
        }
    }

    public class UnitTest3
    {
        fizzBuzzClass obj = new fizzBuzzClass();

        [Fact]
        public void MultOfFive()
        {
            var Expected = "Buzz";
            Assert.Equal(obj.fizzBuzz(10), Expected);
        }

        [Fact]
        public void NotMultofFive()
        {
            var MultOfFiveResponse = "Buzz";
            Assert.NotEqual(obj.fizzBuzz(7), MultOfFiveResponse);
        }
    }

    public class UnitTest4
    {
        fizzBuzzClass obj = new fizzBuzzClass();

        [Fact]
        public void MultOfFiveAndThree() 
        {
            var Expected = "FizzBuzz";
            Assert.Equal(obj.fizzBuzz(15), Expected);
        }

        [Fact]
        public void NotMultOfFiveAndThree()
        {
            var MultOfThreeAndFiveResponse = "FizzBuzz";
            Assert.NotEqual(obj.fizzBuzz(10), MultOfThreeAndFiveResponse);
        }
    }
}