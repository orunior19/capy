describe 'IDs Dinâmicos', :ids_dinamicos do
    before(:each) do
        visit '/access'
    end

    it 'deve cadastrar usando ids dinamicos' do
        find('input[id$=UsernameInput]').set 'Junior Souza'
        find('input[id^=PasswordInput]').set '123456'
        find('a[id*=GetStartedButton]').click

        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
        sleep 2
    end
end