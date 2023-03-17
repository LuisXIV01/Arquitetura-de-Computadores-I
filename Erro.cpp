#include <bits/stdc++.h>
#define pi 3.1415926535897932384626433832795028841971
void letraA(){
	
	std::cout << " ___________________________________________";
	std::cout << "\n  A: Valores de sen(pi/2) para k=1 a k=10 \n";
	std::cout << std::fixed << std::setprecision(15);
	double x, prod;
	double soma;
	long long int fat, cont, sinal, k, n=10;
	std::cout << " ___________________________________________\n";
	std::cout << "                  Valores                 \n";
	for(k=1; k<=n; k++){
		
		std::cout << " PARA k = " << k << '\n';
		
		soma=0;
		sinal=1;
		fat=1;
		cont=1;
		x = pi/2;
		prod = pi/2;
		
		for(int i=1; i<=k; i++){
			
			soma += (sinal * (x/fat));
			fat *= ++cont;
			fat *= ++cont; 
			x *= prod * prod;
			sinal *= -1;
		}
		std::cout << " " << soma << '\n'; //--Seno: 
		std::cout << " erro relativo= " << (fabs(sin(pi/2) - soma) / fabs(sin(pi/2))) << '\n'; //-- 
		std::cout << " erro absoluto= " << fabs(sin(pi/2) - soma) << '\n'; //-- 
		std::cout << " ___________________________________________\n";
	}
}

void letraB(){
	std::cout << " ____________________________________________________________________";
	std::cout << "\n B: Prescisão de uma máquina e quantidade de algarismo significativos\n";
	std::cout << " Precisão = 0,000015259\n\n";
	
	std::string numero = "0.000015259";
	long long int primeiro=-1, segundo=-1;
	for(int i=0; i<(int)numero.size(); i++){
		if(primeiro == -1 && numero[i]!='0' && numero[i]!='.'){
			primeiro = i;
		}
		if(primeiro != -1 && numero[i]!='0' && numero[i]!='.'){
			segundo = i;
		}
	}
	std::cout << " Número: " << numero << '\n';
	std::cout << " Significativos = " << segundo - primeiro + 1 << '\n';
	std::cout << " ____________________________________________________________________";
}

void letraC(){
	
	std::cout << " ____________________________________________________________________";
	std::cout << "\n C: Calcular o valor de seno(pi/2) e o erro de truncamento\n";
	long double soma;
	long double an, prod;
	long long int fact, cont, op, n=10;
	
	double truncamento;

	soma=0;
	op=1;
	fact=1;
	cont=1;
	an = pi/2;
	prod = pi/2;
	
	for(int i=1; i<=n; i++){
		
		//std::cout << i << ": " << std::fixed << std::setprecision(15) << fabs(op * (an/fact)) << '\n';
		soma += (op * (an/fact));
		truncamento = fabs(op * (an/fact));
		fact *= ++cont;
		fact *= ++cont; 
		an *= prod * prod;
		op *= -1;
	}
	
	std::cout << " seno(pi/2) = " << soma << "\n\n"; 
	std::cout << " Erro: -" << std::fixed << std::setprecision(15) << truncamento << " a +" << truncamento << '\n';
	std::cout << " ____________________________________________________________________";
}

int main(){
	setlocale (LC_ALL,"");
	
	letraA();
	std::cout << '\n';
	
	letraB();
	std::cout << '\n';
	
	letraC();
}
