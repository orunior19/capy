describe 'Select 2 options', :select2 do
    
    describe('single option', :single) do
        before(:each) do
            visit '/apps/select2/single.html'
        end
    
        it 'seleciona um ator nas opções pelo nome' do
            find('.select2-selection--single').click
            find('.select2-results__option', text: 'Jim Carrey').select_option
        end
    
        it 'seleciona ator pelo campo de busca do select 2 single' do
            find('.select2-selection--single').click
            find('.select2-search__field').set 'Chris Rock'
            find('.select2-results__option').click
        end
    end

    describe('multiple selection', :mult) do

        before(:each) do
            visit '/apps/select2/multi.html'
        end

        $atores = ['Adam Sandler', 'Chris Rock', 'Jim Carrey', 'Kevin James', 'Owen Wilson']

        def seleciona(ator)
            find('.select2-selection--multiple').click
            find('.select2-search__field').set ator
            find('.select2-results__option').click                
        end
        
        def seleciona_option_on_click(ator)
            find('.select2-selection--multiple').click
            find('.select2-results__option', text: ator).select_option
        end

        it 'seleciona atores' do
            $atores.each do |ator|
                seleciona(ator)
                element = find('.select2-selection__choice', text: ator)
                puts element.text
                expect(element.text).to include ator
            end
        end

        it 'seleciona atores clicando em uma option' do
            $atores.each do |ator|
                seleciona_option_on_click(ator)
                element = find('.select2-selection__choice', text: ator)
                expect(element).to have_content ator
            end
        end
        
        context 'remove option selecionada' do
            before(:each) do
                $atores.each do |ator|
                    seleciona_option_on_click(ator)
                end
            end

            it 'remove option' do
                $atores.each do |ator_expect|
                    element_father = first('.select2-selection__choice', text: ator_expect)
                    element_father.find('.select2-selection__choice__remove').click
                    select_area = find('.select2-selection--multiple')
                    expect(select_area).not_to have_content ator_expect
                end
            end
        end
    end

    after(:each) do
        sleep 2
    end
end