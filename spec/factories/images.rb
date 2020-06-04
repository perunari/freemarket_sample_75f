FactoryBot.define do
  factory :image do
    item_id {"1"}
    picture { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/factories/sample1.jpg')) }
  end
end