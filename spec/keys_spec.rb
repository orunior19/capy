describe 'Teclado', :keys do
    before(:each) do
        visit '/key_presses'
    end

    it 'enviando teclas' do
        teclas = %i[tab escape space enter shift control alt]
        
        teclas.each do |tecla|
            find('#campo-id').send_keys tecla
            expect(page).to have_content 'You entered: ' + tecla.to_s.upcase
            sleep 1
        end
    end

    it 'deve enviar letras' do
        letras = %w[a s d f g h j k l]

        letras.each do |letra|
            find('#campo-id').send_keys letra
            expect(page).to have_content 'You entered: ' + letra.to_s.upcase
            sleep 1
        end
    end
end