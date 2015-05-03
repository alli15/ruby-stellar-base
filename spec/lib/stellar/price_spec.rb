require "spec_helper"

describe Stellar::Price, "#from_f" do
  subject{ Stellar::Price }
  let(:seed){ 225571644875421139403973254661022579608 } #generated using Random.new
  let(:random){ Random.new(seed) } 
  let(:iterations){ ENV["SMOKE_ITERATIONS"].present? ? ENV["SMOKE_ITERATIONS"] : 2000}

  it "withstands a random smoke test" do
    iterations.times do |i|
      expected = random.rand
      actual_p = subject.from_f(expected)
      actual = actual_p.to_f

      expect(actual).to be_within(0.000000001).of(actual)
      expect(actual_p.n).to be <= Stellar::Price::MAX_PRECISION
      expect(actual_p.d).to be <= Stellar::Price::MAX_PRECISION
    end
  end

end
