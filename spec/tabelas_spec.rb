describe 'Tabelas', :tabs, :smoke do
    
    before(:each) do
        visit '/tables'
    end

    it 'deve exibir o salario do stark' do
        atores = all('table tbody tr')
        stark = atores.detect { |ator| ator.text.include?('Robert Downey Jr')}
        puts stark.text
        expect(stark.text).to include '10.000.000'
    end

    it 'deve exibir o salário do vin diesel' do
        diesel = find('table tbody tr', text: '@vindiesel')
        expect(diesel).to have_content '10.000.000'
    end

    it 'deve exibir o filme velozes' do
        # Busca a linha com find somente se passar um valor chave
        # Se for ambiguo é melhor usar o all e depois filtrar com o metodo detect { |ator| ator.text.include?('TEXTO ESPERADO') }
        diesel = find('table tbody tr', text: '@vindiesel')
        
        # $('table tbody tr:contains("@vindiesel") td');
        # faz filtro e salva novo result
        movie = diesel.all('td')[2].text
        expect(movie).to eql 'Velozes e Furiosos'
    end

    it 'deve exibir o insta do Chris Evans' do
        evans = find('table tbody tr', text: 'Chris Evans')
        insta = evans.all('td')[4].text

        expect(insta).to eql '@teamcevans'
    end

    it 'deve selecionar Chris Pratt para remoção' do
        prat = find('table tbody tr', text: 'Chris Pratt')
        prat.find('a', text: 'delete').click

        message = page.driver.browser.switch_to.alert.text
        page.driver.browser.switch_to.alert.accept
        expect(message).to eql 'Chris Pratt foi selecionado para remoção!'
    end

    it 'deve selecionar Chris Pratt para edição' do
        prat = find('table tbody tr', text: 'Chris Pratt')
        prat.find('a', text: 'edit').click
        # mensagem esperada: 'Chris Pratt foi selecionado para remoção!'
        message = page.driver.browser.switch_to.alert.text
        page.driver.browser.switch_to.alert.accept
        expect(message).to eql 'Chris Pratt foi selecionado para edição!'
    end

end