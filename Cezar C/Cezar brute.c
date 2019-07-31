#include<stdio.h>

int main()
{
    char message[100], ch;
    int i , key;

    printf("Enter the text for encrypting: ");
    gets(message);
    for( key =1; key<=26; key++)
    {
        for(i = 0; message[i] != '\0'; ++i)
        {
            ch = message[i];

            if(ch >= 'a' && ch <= 'z')
            {
                ch = ch + key;

                if(ch > 'z')
                {
                    ch = ch - 'z' + 'a' - 1;
                }

                message[i] = ch;
            }
            else if(ch >= 'A' && ch <= 'Z')
            {
                ch = ch + key;

                if(ch > 'Z')
                {
                    ch = ch - 'Z' + 'A' - 1;
                }

                message[i] = ch;
            }

        }
        printf("Key: %d || Encrypted message: %s\n", key,message);
    }
    printf("___ T H E  E N D ___");


    return 0;
}
