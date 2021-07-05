(* Função que lê um número entre min e máx -> Só aceita dentro deste intervalo. *)
let rec ler min max =
  let i = read_int () 
  in 
    if i <= max && i > min 
      then i 
    else 
      let () = 
        if i>max || i<=min then 
          let () = print_string "Número inválido, digite outro --> "
          in print_string ""
      in ler min max;;

(* Dado um array de um determinado tamanho, insere nesse array determinados valores, 
seguindo determinadas regras (nomeadamente que os valores inseridos têm de estar 
por ordem crescente e que não podem ser inseridos números iguais) e por fim devolve-o.*)
let cria_sistema array tamanho = 
  let quantia = ref 0 in
  let temp = ref 0 in
  for i = 0 to (tamanho-1) do
    (* Só aceita ler por ordem crescente, como é pedido no enunciado *)
    quantia := (ler 0 500); 
    if !quantia > !temp then 
      array.(i)<- !quantia
    else 
      ((print_string "Número inválido, digite outro --> ");
      (quantia := (ler !temp 500));
      (array.(i)<- !quantia;));
    temp := !quantia;
  done;
  array;;

(* Função que dado um sistema monetário e uma determinada quantia, devolve a quantidade
de moedas que têm um valor inferior ou igual à quantia. *)
let quantidade_menores_ou_iguais sistema quantia =
  let cont = ref 0 in
  let tam = Array.length (sistema) in
  for i = 0 to (tam-1) do
    if sistema.(i) <= quantia then cont := !cont + 1;
  done;
  !cont;;

(* Função que compara os resultados de dois algoritmos (Guloso e "Smart") (armazenados em arrays), 
testados até uma quantia_limite, e que atuam sobre um determinado sistema monetário. *)
let compara_algoritmos smart guloso (sistema:int array) quantia_limite = 
  let quantia = ref 1 in
  let tam_sistema = Array.length(sistema) in
  let stop = ref 0 in
  while ((!stop != 1) && (!quantia != quantia_limite)) do (* Vai preencher e comparar os arrays smart e guloso até os resultados divergirem ou até se atingir a quantia_limite. *)

    (* IMPLEMENTAÇÃO DO ALGORITMO SMART *)
    let tam_AMI = quantidade_menores_ou_iguais sistema !quantia in (* Tamanho do array que contem os elementos do sistema menores ou iguais a uma certa quantia. *)
    let menores_iguais = Array.make (tam_AMI) 0 in
    for i = 0 to (tam_AMI-1) do
      menores_iguais.(i)<-(sistema.(i));
    done;
    for pos = 0 to (tam_AMI - 1) do
      let minimo = (min (smart.(!quantia - menores_iguais.(pos)) + 1) (smart.(!quantia))) in
      smart.(!quantia)<-minimo;
    done;

    (* IMPLEMENTAÇÃO DO ALGORITMO GULOSO *)
    let copia_quantia = ref !quantia in
    let contagem = ref 0 in
    for j = (tam_sistema-1) downto 0 do
      while (!copia_quantia >= (sistema.(j))) do
        copia_quantia := !copia_quantia - (sistema.(j));
        contagem := !contagem + 1;
      done;
    done;
    guloso.(!quantia)<-(!contagem);

    (*Exibição de resultados*)

    if ((smart.(!quantia)) == (quantia_limite+1)) then (smart.(!quantia)<-(0)); (* Permite que quando não se consiga calcular troco, o resultado seja equivalente para ambos os arrays. *)

    if (guloso.(!quantia) != smart.(!quantia)) then (* Caso os resultados testados sejam diferentes, então é mostrado no ecrã a quantia para qual falhou e os testes são terminados (stop). *)
      ((Printf.printf "%d\n" !quantia);
      (stop := 1));

    if (!quantia == (quantia_limite-1)) then (Printf.printf "YES\n"); (* Caso não tenham sido verificadas quaisquer divergências, os testes são concluídos após se chegar à quantia limite .*)

    quantia := !quantia + 1; (* Se deu tudo certo, então testa-se para uma nova quantia. *)
  done;;


(*CORPO DO PROGRAMA *)

let quantidade_de_moedas = ler 0 100;;
let sistema = Array.make (quantidade_de_moedas) (-1);; (* É criado um sistema de tamanho equivalente à quantidade de "moedas" *)
let sistema_criado = cria_sistema sistema quantidade_de_moedas;; (* São inseridos (pelo user) no sistema criado os valores numéricos de cada uma das moedas que o compõem *)

let quantia_limite = 850;; (* Quantia que determinará quando é que os testes serão terminados (caso não se tenha encontrado nenhuma divergência de resultados) *)

(* Criação dos arrays nos quais serão inseridos os resultados dos testes *)
let smart_array = Array.make (quantia_limite+1) (quantia_limite+1);; 
Array.set smart_array 0 0;;
let array_guloso = Array.make quantia_limite 0;;

compara_algoritmos smart_array array_guloso sistema_criado quantia_limite;; (* Execução da função que executa os algoritmos e compara os resultados dos testes *)