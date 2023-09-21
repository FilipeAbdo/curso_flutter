

//run with Ctrl + Alt + n

//dynamic type function declaration
somaDynamic(a, b){
    return a + b;
}

// typed function declaration
int soma(int a, int b){
    return a + b;
}

dynamic execDynamic(dynamic a, dynamic b, dynamic Function(dynamic, dynamic) fn){
   return fn(a,b);
}

int execInt(int a, int b, int Function(int, int) fn){
   return fn(a,b);
}

class Produto{
    late String nome;
    late double preco;

    Produto(){
        this.nome = "";
        this.preco = 0;
    }

    Produto.set(this.nome, this.preco);
    Produto.setNamed({required this.nome, this.preco = 1.99});

    Produto.copy(Produto reference){
        this.nome = reference.nome;
        this.preco = reference.preco;
    }

    @override
    String toString() {
        return "${this.nome}: R\$${this.preco}#3.2f";
    }

    @override
    bool operator ==(covariant Produto reference){
        return reference.nome == this.nome;
    }
}

void main() {
    print("Hello World!");
    var c = 'Hello World! 2';
    print(c);

    List<String> lista = ["Filipe", "Alexandre"];
    lista.add("Júlio");
    print(lista.length);
    print(lista);
    print(lista[1]);

    Set<int> conjunto = {0, 1, 2, 3, 4, 4, 4, 5};
    print(conjunto.length);

    Map<String, double> notasDosAlunos = {
        "Filipe": 0,
        "Alexandre": 2,
        "Júlio": 1
    };

    print(notasDosAlunos);

    for(String chave in notasDosAlunos.keys){
        print("chave = $chave");
    }

    notasDosAlunos.addAll({"Aluno1": 2.3});

    notasDosAlunos["Aluno2"] = 10.0;
    
    for(MapEntry<String, double> entries in notasDosAlunos.entries){
        print("chave = ${entries.key}, valor = ${entries.value}");
    }

    dynamic x = "Teste";

    print("\nvalue = $x, type ${x.runtimeType}");

    x = 0;
    print("value = $x, type ${x.runtimeType}");

    int a = 0;
    a = 2;

    final int b = 0;
    // b = 2; Erro - final é verificado em runtime


    const int d = 1;
    // d = 3; Erro - const é otimizado em compilation time

    print("soma = ${soma(3, 4)}");
    print("somaDynamic int = ${somaDynamic(3, 4)}");
    print("somaDynamic string ${somaDynamic("3", "4")}");
    print("exec soma Int = ${execInt(3, 4, soma)}");
    print("exec soma Dynamic int = ${execDynamic(3, 4, somaDynamic)}");
    print("exec soma Dynamic string = ${execDynamic("3", "4", somaDynamic)}");
    int returnExec = execInt(3, 4, (a, b) {return a - b;});
    print("exec subtração Inline function declaration = ${returnExec}");
    returnExec = execInt(3, 4, (a, b) => a * b);
    print("exec multiplicação Inline function declaration = ${returnExec}");


    Produto produto1 = new Produto();

    produto1.nome = "Caneta";
    produto1.preco = 12.3;
    print(produto1);

    Produto produto2 = new Produto.set("Borracha", 2.12);
    print(produto2);

    print(produto1 == produto2);

    Produto produto3 = Produto.copy(produto2); // não precisa do new
    print(produto3);

    print(produto3 == produto2);

    Produto produto4 = Produto.setNamed(nome: "Grafite");
    print(produto4);

    Produto produto5 = Produto.setNamed(nome: "Lapiseira", preco: 54.92);
    print(produto5);
}


//run with Ctrl + Alt + n