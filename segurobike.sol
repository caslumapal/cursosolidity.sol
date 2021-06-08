// SPDX-License-Identifier: CC-BY-4.0
// (c) Desenvolvido por Lucas Louvison Palma

pragma solidity 0.8.4;

//Contrato de Seguro de bicicleta
//Possibilidade de insluir valores ao Contrato
//É possível consultar o valor pago a vista e comparar com o valor do Contrato
contract SeguroBike {
    
    address public contaSeguradora;
    
    uint public valorContrato;
    uint public pagamentoAVista;
    
    struct DadosSegurado { 
        address payable contaSegurado;
        string nomeSegurado;
    }
   
    bool public quitado;
    
    event contratoCumprido (uint valorContrato, uint pagamentoAVista, bool quitado); // xxxxxxxxxxxxx
    
 //Vincula um tipo de sinistro à quantidade das ocorrências
    mapping(string => uint) public registroSinistro;
    string [] Sinistros; 
    
    modifier somenteSeguradora {
        require(msg.sender == contaSeguradora, "Somente Seguradora");
    _;
    }
    
    constructor () {
        valorContrato = 1000;
        contaSeguradora = msg.sender; 
    }
    
    function inserirPagamentoAVista (uint valorPago) payable public{
        pagamentoAVista = valorPago;
    }
    
    function verificarValor (uint _pagamentoAVista) public view returns (bool _quitado) { 
        
        if (_pagamentoAVista > valorContrato) {
            return true;
        } else {
            return false;
        }    
    }
  
   function quantidadeSinistro(string memory _incluirQuantidadeSinistro) public {
        Sinistros.push(_incluirQuantidadeSinistro);
   }
   
   function incluirTipoSinistro(string memory _tipoSinistro, uint _quantificacao) public {
        registroSinistro[_tipoSinistro] = _quantificacao;
    }
   
   
    }
