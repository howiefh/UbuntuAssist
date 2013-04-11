#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
using namespace std;
char encodetab[]="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
char decodetab[124]={0};


//------------------------------------------------------------------------------
void init()
{
	int i=0;
	int j=0;
	for(i=65; i<=90; i++)
		decodetab[i]=j++;
	for(i=97;i<=122; i++)
		decodetab[i]=j++;
	for(i=48;i<=57; i++)
		decodetab[i]=j++;
	decodetab[43]=j++;
	decodetab[47]=j++;
	decodetab[61]=j++;
}

//------------------------------------------------------------------------------
char* encode(const void* buff, int buffsize)
{ 
	const unsigned char* a = (const unsigned char* )buff;
	int alen = buffsize;
	int blen = alen/3*4;
	if(alen%3)
		blen+=4;
	char* b = new char[blen+1];
	memset(b,'\0',blen+1);
	int j=0;
	int i;
	//-----------------------------------
	for ( i=0; i<=alen-3; i+=3,j+=4)
	{
		/*
		//此段代码更为高效，但是由于编译器优化的原因，在VC下需要调整编译器选项方可运行
		b[j] = a[i]>>2;
		b[j+1] = ((a[i]<<6)>>2) | (a[i+1]>>4);
		b[j+2] = ((a[i+1]<<4)>>2) | (a[i+2]>>6);
		b[j+3] = (a[i+2]<<2)>>2;
		*/
		b[j] = a[i]>>2;
		b[j+1] = ((a[i]&0x3)<<4) | (a[i+1]>>4);
		b[j+2] = ((a[i+1]&0xf)<<2) | (a[i+2]>>6);
		b[j+3] = a[i+2]&0x3f;
	}

	int rem =alen %3;
	if (rem == 1 )
	{
		b[j] = a[i]>>2;
		b[j+1] = ((a[i]&0x3)<<4) ;
		b[j+2] = 64;
		b[j+3] = 64;  
	}
	else if(rem ==2)
	{
		b[j] = a[i]>>2;
		b[j+1] = ((a[i]&0x3)<<4) | (a[i+1]>>4);
		b[j+2] = ((a[i+1]&0xf)<<2) ;
		b[j+3] = 64;
	}

	//-----------------------------------
	for (j=0; j<blen; j++)
	{
		b[j] = encodetab[b[j]];
	}
	return b; 
}


//------------------------------------------------------------------------------
void* decode(const char *s, int &bufflen)
{
	int chrlen = strlen(s);
	if(chrlen<=0 || chrlen%4)
		return NULL;
	bufflen = chrlen/4*3;
	char* chr = new char[chrlen+1];
	unsigned char* buff = new unsigned char[bufflen];

	int i=0;
	int j=0;
	for(i=0; i<chrlen; i++)
		chr[i] = decodetab[s[i]];

	for(i=0; i<chrlen; i+=4)
	{
		buff[j] = (chr[i]<<2) | (chr[i+1]>>4);
		buff[j+1] = (chr[i+1]<<4) | (chr[i+2]>>2);
		buff[j+2] = (chr[i+2]<<6) | chr[i+3];
		j+=3;
	}

	if(s[chrlen-1] == '=')
		bufflen--;
	if(s[chrlen-2] == '=')
		bufflen--;
	return buff;

}


//------------------------------------------------------------------------------
int main(int argc, char const* argv[])
{
	char * c;
	char * dore;
	if (argc == 3) {
		dore = (char *)argv[1];
		c = (char *)argv[2];
	} else {
		return -1;
	}
	init();
	if (strcmp(dore,"e") == 0) {
		char *d = encode(c,strlen(c));
		cout<<d<<endl;
	} else if (strcmp(dore,"d") == 0) {
		int len= 0;
		char *d = (char*)decode(c,len);
		for(int i=0; i<len; i++)
		{
			cout<<*(d+i);
		}
		cout<<endl;		
	} else {
		return -1;
	}
	return 0;
}
