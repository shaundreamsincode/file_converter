require "rails_helper"

describe ConversionsController, type: :request do
  describe "#create" do
    let(:trigger!) { post "/conversions", params: params }
    let(:params) { { old_file_type: "pdf", new_file_type: "doc", encoded_file: "Old Encoded File" } }

    it "creates a new Conversion" do
      expect { trigger! }.to_change { Conversion.count }.from(0).to(1)
    end

    it "assigns the correct values to the Conversion" do
      allow(ConversionRepository).to receive(:convert_file).
        with(old_file_type: "pdf", new_file_type: "doc", encoded_file: "Old Encoded File").and_return("New Encoded File")

      trigger!
      conversion = Conversion.first

      expect(conversion.old_file_type).to eq("pdf")
      expect(conversion.new_file_type).to eq("doc")
      expect(conversion.encoded_file).to eq("New Encoded File")
    end
  end
end
