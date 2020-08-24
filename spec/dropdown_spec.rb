#tag de suite dropdown rsped --tag @dropdown
describe 'Caixa de opções', :dropdown do

    before(:all) do
        visit '/dropdown'
    end
    it 'item especifico simples' do
        select('Loki', from: 'dropdown')
        sleep 3
    end

    it 'item especifico com o find', :select_open do
        visit '/dropdown'
        drop = find('.avenger-list')
        drop.click
        sleep 2
        drop.find('option', text: 'Scott Lang').select_option
        sleep 3
    end

    it 'todos os options', :sample do
        visit '/dropdown'
        drop = find('.avenger-list')
        drop.all('option').sample.select_option
        sleep 2
    end
end