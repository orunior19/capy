describe 'Iframes', :iframes, :smoke do
    
    describe 'bom', :nice_frames do
        before(:each) do
            visit '/nice_iframe'
        end

        it 'adicionar ao carrinho' do
            within_frame('burgerId') do
                produto = find('.menu-item-info-box', text: 'REFRIGERANTE')
                produto.find('a').click
                expect(find('#cart')).to have_content 'R$ 4,50'
                sleep 2
            end
        end

    end

    describe 'ruim', :bad_iframe do
        before(:each) do
            visit '/bad_iframe'
        end
        
        it 'carrinho deve estar vazio' do
            
            script = '$(".box-iframe").attr("id", "tempIdFrame");'
            page.execute_script(script)

            within_frame('tempIdFrame') do
                expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
            end
            sleep 2
        end
    end

end