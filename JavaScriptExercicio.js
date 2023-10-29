var clientes = [
    {
        "id": 1,
        "nome": "Luis Santos Silveira",
        "idade": 18
    },
    {
        "id": 2,
        "nome": "Ricardo Lopes Alves",
        "idade": 30
    },
    {
        "id": 3,
        "nome": "Gustavo Silva Junior",
        "idade": 26
    }
];
var numero = "5(1)9-876-543-21";

printNome(clientes, numero);


function printNome(clientes, numero='') {
    let array_nome= '';
    let novo_nome = '';

    clientes.forEach(element => {
        array_nome= element.nome.split(' ');
        array_nome = array_nome.reverse();
        novo_nome ='';
        novo_nome = array_nome.join(' ');

        console.log(novo_nome);

        });

    if(numero){
        let numero_limpo = numero.replaceAll(/[^0-9]/g, '');//apagar os -
        console.log('tem numero para formatar (XX)_X_XXXX-XXXX');
        let array_numero = numero_limpo.split('');// criar o array de elementos do string
        //Reposicionar os ()
        array_numero.unshift('(');//colocando parentesis na primeira posição
        array_numero.splice(3, 0, ')');//fechando o parentesis na quarta posição.

        //posição dos (_ e -) no array
        array_numero.splice(4, 0, '_');
        array_numero.splice(6, 0, '_');
        array_numero.splice(11, 0, '-');
        
        console.info(`O número formatado é: ${array_numero.join('')}`);

    }else{
        console.info('Não tem numero para formatar...')
    }
}






//3) Qual a ordem dos prints no console?
// sem correção do codigo:
    // A função é: c
    // A função é: d
    // A função é: a
//Com correçao de codigo
    // A função é: b --> Despois da correção.
    // A função é: c
    // A função é: d
    // A função é: a

//4) Existe algum erro nesse código? Se sim, comente sobre?
/*na função b "function b(){}" o ordem do print e o rerturn ficaram invertidos dai que nao dava para imprimir o messagem, despois de corregido foi posivel mostrar o msg da funçao b */

async function a() {
    b();
    await c();
    await d();
    alertUser("a");
}
a();

function b() {
    alertUser('b');//corregido...
    return
    
   
}

function c(){
    return new Promise((resolve)=>{
        resolve();
        alertUser('c');
    })
}

function d(){
    return new Promise((resolve)=>{
        resolve();
        alertUser('d');
    })
}

function alertUser(message) {
    console.log('A função é: '+message);
}