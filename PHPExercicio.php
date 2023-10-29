<?php
$nomes = ['Francisco Souza', 'Guilherme Rosa', 'Arthur Golveia'];
$cliente1 = new stdClass();
$cliente1->nome = $nomes[0];
$cliente2 = new stdClass();
$cliente2->nome = $nomes[1];
$cliente3 = new stdClass();
$cliente3->nome = $nomes[2];
$arrayDeClientes = [$cliente1, $cliente2, $cliente3];
echo 'O nome do segundo cliente é: '.$arrayDeClientes[1]->nome.'<br>';

$arrayDeNascimento = [
'Francisco Souza' => '10-12-1996',
'Arthur Golveia' => '14-01-2000',
'Guilherme Rosa' => '26-05-1985',
'Marcelo Planalto' => '26-05-1985'
];

$cont = 0;
$primer_array = [];
foreach ($arrayDeNascimento as $key=>$value) {
	foreach($arrayDeClientes as $element){
    	if($element->nome == $key){
            $element->data_nacimento = $value;
            $cont ++;
        }        
    }
}
echo '<br> A data de nascimento de cada cliente no array é: <br>';
var_dump($arrayDeClientes);

echo '<br><br>Neste elemento destaca-se que apenas a data de nascimento de cada cliente é adicionada ao array de clientes original e não especifica o que fazer com os dados extras no array de data de nascimento, portanto apenas ajuda a entender o que significa para focar nos clientes que existem na matriz de clientes.';
// Função de comparação para ordenar com base na data
function compararDatas($objeto1, $objeto2) {
    $data1 = strtotime($objeto1->data_nacimento);
    $data2 = strtotime($objeto2->data_nacimento);

    if ($data1 == $data2) {
        return 0;
    }

    return ($data1 < $data2) ? -1 : 1;
}


usort($arrayDeClientes, 'compararDatas');

echo '<br><br> A ordenação pela data de nacimento do mais velho ao mais novo do Cliente mais o Novo (NAO FOI ESPECIFICADO NO REQUERIMENTO MAS POR DEFEIO DEIXE ASSIM) : <br>';
foreach($arrayDeClientes as $element){
    echo '<br>'.$element->nome.'  nascido em '.$element->data_nacimento;   
}



?>