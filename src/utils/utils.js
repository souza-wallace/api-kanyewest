export class Utils {
    async chamaApi(url, metodo){
        console.log(url)
        try {
            const response = await fetch(url, {
                method: metodo,
                headers: {
                    'Content-Type': 'application/json',
                },
            });
    
            if (!response.ok) {
                console.log('Erro: ' + response.statusText);
            }
    
            const data = await response.json();
    
            return data;
    
        } catch (error) {
            console.error('Erro ao buscar dados da API:', error);
            return false
        }

    }
}