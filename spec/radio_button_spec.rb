describe 'Botões de seleção única', :radiobuttons => true do

    before(:each) do
        visit '/radios'
    end

    it 'marcar por id' do
        choose('cap')
    end

    it 'selecionar por find com set true' do
        find('input[value=guardians').click
    end

    after(:each) do
        sleep 2
    end

end