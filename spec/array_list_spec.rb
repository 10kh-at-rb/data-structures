require 'rspec'
require 'array_list'

describe ArrayList do
  let(:empty_list) { ArrayList.new }
  let(:array_list) { ArrayList.new }

  before(:each) do
    array_list[0] = "foo"
    array_list[1] = "bar"
  end

  describe "#[] and #[]=" do
    it "sets and gets the value at the given index" do
      array_list[0] = "foo"

      expect(array_list[0]).to eq("foo")
    end
  end

  describe "#[]" do
    context "when the index is in range" do
      it "returns the value at that index" do
        expect(array_list[1]).to eq("bar")
      end
    end

    context "when the index is out of range" do
      it "returns nil" do
        expect(empty_list[0]).to be_nil
      end
    end
  end

  describe "#pop" do
    context "when there are no elements in the array" do
      it "returns nil" do
        expect(empty_list.pop).to be_nil
      end
    end

    context "when there are multiple elements in the array" do
      it "returns the last element in the array" do
        expect(array_list.pop).to eq("foo")
      end

      it "removes the last element in the array" do
        array_list.pop

        expect(array_list[-1]).to eq("foo")
      end
    end
  end

  describe "#push" do
    it "adds an element to the end of the array" do
      array_list.push("hello world")

      expect(array_list[-1]).to eq("hello_world")
    end
  end

  describe "#shift" do
    context "when there are no elements in the array" do
      it "returns nil" do
        expect(empty_list.shift).to be_nil
      end
    end

    context "when there are multiple elements in the array" do
      it "returns the first element in the array" do
        expect(array_list.shift).to eq("foo")
      end

      it "removes the first element in the array" do
        array_list.shift

        expect(array_list[0]).to eq("bar")
      end
    end
  end

  describe "#unshift" do
    it "adds an element to the beginning of the array" do
      array_list.unshift("hello world")

      expect(array_list[0]).to eq("hello_world")
    end
  end
end