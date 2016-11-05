require_relative '../../../lib/rpn_ruby'

class RPN_Container
  include RPN
end
  
describe RPN_Container do

  before(:each) do
    @calculator = RPN_Container.new
  end  

  context "presenting the latest input:" do

    describe "return the item at the top of the stack:" do

      it "echoes the only number entered" do
        expect(@calculator.enter('5.0').enter('='))
          .to eq('5.0')
      end

      it "echoes the last number entered" do
        expect(@calculator.enter('5.0').enter('3.54').enter('='))
          .to eq('5.0')
      end

      it "returns an empty string when the stack is empty" do
        expect(@calculator.result)
          .to eq('')
      end
    end
  end    

  context "calculations:" do

    describe "single operations:" do

      it "addition" do
        expect(@calculator.enter('5.25').enter('3.72').enter('+').enter('='))
          .to eq('8.97')
      end

      it "subtraction" do
        expect(@calculator.enter('66.5').enter('33.15').enter('-').enter('='))
          .to eq('33.35')
      end

      it "multiplication" do
        expect(@calculator.enter('2.2').enter('0.4').enter('*').enter('='))
          .to eq('0.8800000000000001')
      end

      it "division" do
        expect(@calculator.enter('10.88').enter('2').enter('/').enter('='))
          .to eq('5.44')
      end

      it "division using d instead of /" do
        expect(@calculator.enter('10.88').enter('2').enter('d').enter('='))
          .to eq('5.44')
      end

      it "modulo" do
        expect(@calculator.enter('56').enter('5').enter('%').enter('='))
          .to eq('1.0')
      end

      it "exponentiation" do
        expect(@calculator.enter('2').enter('5').enter('^').enter('='))
          .to eq('32.0')
      end

      it "roots" do
        expect(@calculator.enter('81').enter('4').enter('r').enter('='))
          .to eq('3.0')
      end
    end

    describe "multiple operations:" do

      it "handles the equivalent of (6(4+5))" do
        expect(@calculator
          .enter('6')
          .enter('4')
          .enter('5')
          .enter('+')
          .enter('*')
          .enter('='))
          .to eq('54.0')
      end

      it "handles the equivalent of (6(4+5))-(25/(2+3))" do
        expect(@calculator
          .enter('6')
          .enter('4')
          .enter('5')
          .enter('+')
          .enter('*')
          .enter('25')
          .enter('2')
          .enter('3')
          .enter('+')
          .enter('/')
          .enter('-')
          .enter('='))
          .to eq('49.0')
      end

      it "calculates the area of a circle" do
        expect(@calculator
          .enter(Math::PI)
          .enter('3')
          .enter('2')
          .enter('^')
          .enter('*')
          .enter('=').to_f)
          .to be_within(0.005).of(28.27)
      end
    end
  end  

  context "handling incorrect input:" do

    describe "too few values for an operation:" do

      it "does something reasonable" do
        expect(@calculator.enter('5.0').enter('*').enter('='))
          .to eq('invalid input')
      end
    end
  end    

end