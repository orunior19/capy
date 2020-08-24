describe 'Drag and Drop', :drop do

    before(:each) do
        visit '/drag_and_drop'
    end

    it 'quando homem aranha muda de time' do
        
        #identifica as áreas origem e destino
        team_stark_area = find('.team-stark .column')
        team_cap_area = find('.team-cap ')

        #identificar elemento dragable
        spiderman = find('img[alt$=Aranha]')
        
        #mover para outra área
        spiderman.drag_to team_stark_area

        #double check verificar se moveu e se não duplicou
        expect(team_stark_area).to have_css 'img[alt$=Aranha]'
        expect(team_cap_area).not_to have_css 'img[alt$=Aranha]'
    end

    after(:each) do
        sleep 2
    end

end