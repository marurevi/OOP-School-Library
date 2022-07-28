require_relative '../../library/trimmer'

describe 'The trimmer decorator' do
  it 'Should trimm the name of the nameable it receives' do
    mock = double('Person', { 'name' => 'Maximilianus' })

    allow(mock).to receive(:correct_name)
      .and_return(mock.name)

    trimmed_name = TrimmerDecorator.new(mock).correct_name

    expect(trimmed_name).to eq('Maximilian')
  end
end
