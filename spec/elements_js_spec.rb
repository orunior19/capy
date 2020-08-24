describe 'Alertas de JS', :js do
    before(:each) do
        visit '/javascript_alerts'
    end

    it 'deve validar alert()' do
        click_button 'Alerta'

        mensagem = page.driver.browser.switch_to.alert.text
        puts mensagem
        expect(mensagem).to eql 'Isto é uma mensagem de alerta'
    end

    it 'deve confirmar com sim' do
        click_button 'Confirma'

        mensagem = page.driver.browser.switch_to.alert.text
        expect(mensagem).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
    end

    it 'deve negar com não' do
        click_button 'Confirma'

        mensagem = page.driver.browser.switch_to.alert.text
        expect(mensagem).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
    end

    it 'deve preencher nome no prompt', :accept_prompt do 
        accept_prompt(with: "Junior Souza") do
            click_button 'Prompt'
            sleep 2
        end

        expect(page).to have_content 'Olá, Junior Souza'
        sleep 2
    end

    # desafio
    it "deve negar prompt", :dismiss_prompt do
        #quando eu não aceito este prompt
        dismiss_prompt() do
            click_button 'Prompt'

        end
        #então a mensagem deve ser null
        expect(page).to have_content 'Olá, null'
        sleep 2
    end
end