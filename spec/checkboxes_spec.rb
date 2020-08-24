describe 'Caixa de seleção', :checkbox do
    before(:each) do
        visit '/checkboxes'
    end

    it 'marcando uma opção' do
        check('thor')
    end

    it 'desmarcando uma opção marcada' do
        uncheck('antman')
    end

    it 'marcando com find set true' do
        find('input[value=cap]').set(true)
    end

    it 'desmarcando com find set false' do
        find('input[value=cap]').set(false)
    end

    after(:each) do
        sleep 2
    end

end