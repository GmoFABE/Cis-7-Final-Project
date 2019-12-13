// Cis-7-Final-Project
#include <iostream>
using namespace std;
void toUpperCase(char[]);
void changKey(char[], int n);
void encode(char[], char[], int);
void decode(char[], char[], int);
 
int main() {
// Create all variable
int n;              // user input to decide ENCODE(1) or DECODE(2)
char letter;        // user input to decide Continue(y) or quit(2) program
char text[200];        // Plaintext need to encode or decode
char key[200];         // key, which use to decode or encode the text;
char result[200];      // to save the result of encode/decode
 
 
  cout <<"Hello, dear User~" << endl;
do{
   do{
   cout << "Would you like to encode or decode? (\"1\" to encode; \"2\" to decode):";
   cin >>n;    // if time permits, Do input validation;
   } while(n<1 && n>2);

  // Get the plain text;
  cout << "Enter your original text: ";
  cin >> text;

  // Get the key
  cout << "Enter your key: ";
  cin >>key;
 
// Change input text to uppercase
 toUpperCase(text);
 // recode the size of input
 int count=0; 
   while(text[count] !='\0'){
    count++;
  } 
// Change the key to uppercase and having the same size as the input
 toUpperCase(key);
 changKey(key, count);             
 

  // Encoding
  if(n==1){
    encode(text, key, count);
  }
  // Decoding
  else{
    decode(text, key, count);
  }


  // Ask user whether to continue or quit
cout << "-- Would you like to Encrypt/Decrypt another message? /n (Type\"y\" for continue; anything else to quit):";
cin >> letter;
}while(letter!='n' && letter!='N');
// End program
cout << "Thank you for using this program.";
return 0;
}
 

void toUpperCase(char text[]){
 
 // Change input text to uppercase
  int i=0;
  while(text[i] !='\0'  ){
    if(text[i]<='z' && text[i]>= 'a')
       text[i] = toupper(text[i]);

    i++;
  }
}

void changKey(char st[], int n){
  // get number of characters from the key
  int count=0; 
   while(st[count] !='\0'){
    count++;
  }
  // Change the key to the same length as the input
  if(n>count){
    int index=0;      // tracking the original key index 
    for(int i=count; i<n; i++){
      st[i]=st[index];
      index++;
      if(index>=count)
        index =0;
    }
  }
}

void encode(char text[], char key[], int n){
char result[200];
char element[26];
 for(int i='A', k=0; i<='Z'; i++, k++){
   element[k] = i;
 }
 

 for(int i=0; i<n; i++){
  char a = text[i]; 
  char b = key[i];

  // Encript--------------Encript = (text + Key) mod 26
  int index1, index2;
  for(int i=0; i<26; i++){
    if(a==element[i])
      index1 = i;
  }
  for(int i=0; i<26; i++){
    if(b==element[i])
      index2 = i;
  }
  result[i] = element[(index1+index2)%26];
 }
 cout << "the result is: " << result << endl << endl;
 

}
void decode(char text[], char key[], int n){
  char result[200];
  char element[26];
  for(int i='A', k=0; i<='Z'; i++, k++){
    element[k] = i;
  }
  

  for(int i=0; i<n; i++){
    char a = text[i]; 
    char b = key[i];

 // Decript --------------Decode = (Encode - Key + 26) mod 26
    int index1, index2;
    for(int i=0; i<26; i++){
      if(a==element[i])
        index1 = i;
    }
    for(int i=0; i<26; i++){
      if(b==element[i])
        index2 = i;
    }
    result[i] = element[(index1-index2+26)%26];
  }
  cout << "the result is: " << result << endl << endl;;
 
}


