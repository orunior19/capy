describe 'Botões de seleção única', :hovers do

    before(:each) do
        visit '/hovers'
    end

    it 'quando passo o mouse sobre o blade' do
        card = find('img[alt=Blade]')
        card.hover

        expect(page).to have_content "Nome: Blade"
    end
    
    it 'quando passo o mouse sobre o Pantera Negra' do
        # Regex Começa com ^=
        # Regex Termina com $= 
        card = find('img[alt^="Pantera"]')
        card.hover

        expect(page).to have_content "Nome: Pantera Negra"
    end

    it 'quando passo o mouse sobre o Homem Aranha' do
        # Regex Contains 
        card = find('img[alt*="Homem Aranha"]')
        card.hover

        expect(page).to have_content "Nome: Homem Aranha"
    end

    after(:each) do
        sleep 2
    end
end