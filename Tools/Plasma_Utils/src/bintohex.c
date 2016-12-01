/*
bintohex by Steve Rhoads 5/29/02

Convert the binary object file [out_filename].bin
into hexadecimal object file [out_filename].hex

UPDATED: 11/30/16 by Karl Janson (karl.janson@ati.ttu.ee)
* Added capability to specify input and output file names with arguments.
* Changed some strings
*/
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define BUF_SIZE (1024*1024)

int main(int argc, char *argv[])
{
  FILE *file;
  unsigned char *buf;
  unsigned long size, mem_size = 1024 * 4, i, j, k, sum;
  char out_filename[80];
  char * out_ext;

  /* Process arguments */
  if(argc < 3)
  {
    printf ("Usage: %s <infile.bin> <outfile.hex>\n", argv[0]);
    return -1;
  }
  out_ext = strrchr(argv[2], '.');

  if (!out_ext) {
    out_ext = ".hex";
    strncpy(out_filename, argv[2], strlen(argv[2]));
  } else {
    strncpy(out_filename, argv[2], out_ext-argv[2]);
  }

  /* Load input file into the buffer */
  file = fopen(argv[1], "rb");
  if(file == NULL)
  {
    printf("Can't open input file %s\n", argv[1]);
    return -1;
  }

  buf = (unsigned char *)malloc(BUF_SIZE);
  memset(buf, 0, BUF_SIZE);
  size = fread(buf, 1, BUF_SIZE, file);
  mem_size = size;
  if(size > mem_size)
  {
    printf("Input file is too large!!!\n");
    return -1;
  }
  fclose(file);

  /* Write output file */
  for(i = 0; i < 4; ++i)
  {
    if (i == 0)
    {
      sprintf(out_filename + strlen(out_filename),"%lu", i);
    } else {
      sprintf(out_filename + strlen(out_filename) - strlen(out_ext) -1 ,"%lu", i);
    }
    strcat(out_filename, out_ext);

    file = fopen(out_filename, "wb");
    if(file == NULL)
    {
      printf("Can't open output file %s\n", out_filename);
      return -1;
    }

    for(j = 0; i + j * 4 * 16 < mem_size; ++j)
    {
      k = j * 16;
      fprintf(file, ":10%4.4x00", (int)k);
      sum = 0x10 + (k >> 8) + (k & 0xff);
      for(k = 0; k < 16; ++k)
      {
        fprintf(file, "%2.2x", buf[i + j * 4 * 16 + k * 4]);
        sum += buf[i + j * 4 * 16 + k * 4];
      }
      sum &= 0xff;
      sum = 0x100 - sum;
      sum &= 0xff;
      fprintf(file, "%2.2x\n", (int)sum);
    }
    fprintf(file, ":00000001ff\n");
    fclose(file);
  }
  free(buf);
  return 0;
}
