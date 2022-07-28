require_relative '../../library/capitalize'

describe 'the capitalize decorator' do
  it 'should capitalize the nameable it receives' do
    mock = double('Person', { 'name' => 'pedro' })

    allow(mock).to receive(:correct_name)
      .and_return(mock.name)

    capitalized_name = CapitalizeDecorator.new(mock).correct_name

    expect(capitalized_name).to eq('Pedro')
  end
end
