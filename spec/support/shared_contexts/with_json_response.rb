RSpec.shared_context 'with json response' do
  let(:body) { JSON.parse(response.body) }

  let(:raw_fixture) do
    File.read(File.join(RSpec.configuration.fixture_path, fixture_path))
  end

  let(:fixture) do
    JSON.parse(
      raw_fixture.gsub(
        /#{fixture_params.keys.map { |s| ':' + s.to_s }.join('|')}/,
        fixture_params.map { |k, v| [':' + k.to_s, v] }.to_h
      )
    )
  end
end
