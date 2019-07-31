#include<stdio.h>

//YJXYWTSNH
int main()
{
	char message[100], ch;
	int i, key;

	printf("Enter a word for decrypting: ");
	gets(message);
	printf("Enter key: ");
	scanf("%d", &key);

	 if(ch >= 'A' && ch <= 'Z'){
			ch = ch - key;

			if(ch < 'A'){
				ch = ch + 'Z' - 'A' + 1;
			}

			message[i] = ch;
		}
	printf("___Decrypted message: %s___", message);

	return 0;
}
