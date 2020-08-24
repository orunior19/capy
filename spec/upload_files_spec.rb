describe 'Botões de seleção única', :upload do

    before(:each) do
        visit '/upload'

        @arquivo = Dir.pwd + '/spec/fixtures/arquivo_texto.txt'
        @imagem = Dir.pwd + '/spec/fixtures/foto_minha.jpg'
    end
    
    it 'subir arquivo' do
        attach_file('file-upload', @arquivo)

        click_button 'Upload'

        div_arquivo = find('#uploaded_file')
        expect(div_arquivo.text).to eql 'arquivo.txt'
    end

    it 'subir imagem .txt', :upload_image do
        attach_file('file-upload', @imagem)
        click_button 'Upload'
        
        div_image = find('#new-image')
        expect(div_image[:src]).to include '/uploads/foto_minha.jpg'
    end

    after(:each) do
        sleep 2
    end

end