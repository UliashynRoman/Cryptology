#include<stdio.h>

int main()
{
	char message[100], ch;
	int i, key;

	printf("Enter a message to encrypt: ");
	gets(message);
	printf("Enter key: ");
	scanf("%d", &key);

	for(i = 0; message[i] != '\0'; ++i){
		ch = message[i];

		if(ch >= 'A' && ch <= 'Z'){
			ch = ch + key;

			if(ch > 'Z'){
				ch = ch - 'Z' + 'A' - 1;
			}

			message[i] = ch;
		}
	}
	printf("___Encrypted message: %s___", message);

	return 0;
}
