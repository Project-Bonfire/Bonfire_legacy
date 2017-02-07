#!/usr/bin/perl -w
use strict;
use warnings;

# revision history
# 05/2014  AS  1.0    initial

#################################################################################
use Fatal qw( open );
use Switch;

#################################################################################
#  _____ ____  _   _  _____ _______       _   _ _______ _____ 
# / ____/ __ \| \ | |/ ____|__   __|/\   | \ | |__   __/ ____|
#| |   | |  | |  \| | (___    | |  /  \  |  \| |  | | | (___  
#| |   | |  | | . ` |\___ \   | | / /\ \ | . ` |  | |  \___ \ 
#| |___| |__| | |\  |____) |  | |/ ____ \| |\  |  | |  ____) |
# \_____\____/|_| \_|_____/   |_/_/    \_\_| \_|  |_| |_____/ 
#################################################################################
#
# command line parameter
#
my $input             = "";                       # input file
my $output            = "";                       # output file

my $txt_format        = "'4/1 \"%02X\"\"\\n\"'";  # default output .txt format


#my $length            = shift;                    # length of the output file entries
#my $start             = shift;                    # start address

#
# line configurations
#
my $LINE_LIMIT        = 32;                       # line address limit

#
# DRAM
#
my $DRAM_BANKS        = 4;                        # number of DRAM banks
my $DRAM_ZERO_WORD    = "00000000";               # for zero padding

my $DRAM_3D_BANKS     = 8;                        # number of 3D DRAM banks
my $DRAM_3D_WORD      = 4;                        # 4 * 32 bit = 3D DRAM word
my $DRAM_ND_WORD      = 32;                       # 32 * 32 bit = 1024 No Delay DRAM word

#################################################################################
#__      __     _____  _____          ____  _      ______  _____ 
#\ \    / /\   |  __ \|_   _|   /\   |  _ \| |    |  ____|/ ____|
# \ \  / /  \  | |__) | | |    /  \  | |_) | |    | |__  | (___  
#  \ \/ / /\ \ |  _  /  | |   / /\ \ |  _ <| |    |  __|  \___ \ 
#   \  / ____ \| | \ \ _| |_ / ____ \| |_) | |____| |____ ____) |
#    \/_/    \_\_|  \_\_____/_/    \_\____/|______|______|_____/ 
#################################################################################
#
# command line options
#
my %par_arguments     =(  
                        -hex        => 4,         # .bin -> .txt
                        -mem        => 5,         # .txt -> .mem
                        -txt        => 5,         # .mem -> .txt
                        -bin        => 3          # .txt -> .bin
    );
my $parameter         = "";
my %parameters        = ();

#
# parsing
#
my $line              = "";                       # current line
my @bytes             = ();                       # current bytes
my @bytes_rest        = ();                       # rest from previous extraction
my $start_flag        = 0;                        # no start option
my $length_flag       = 0;                        # length limit indication


#
# address
#
my $addr              = 0;                        # current address
my $hex_addr          = "";                       # hex string of address
my $cur_length        = 0;                        # current length
my $line_addr         = 0;                        # line address

#
# parsing
#
my @chars             = ();                       # hex chars from input line
my $idx               = 0;                        # index of char array
my $i                 = 0;                        # index of first char
my $j                 = 0;                        # index of second char

#
# length
#
my $filelength        = 0;                        # file length -> does not work inside switch
my $hex_length        = "";                       # file length in hex format


#################################################################################
# ____  ______ _____ _____ _   _ 
#|  _ \|  ____/ ____|_   _| \ | |
#| |_) | |__ | |  __  | | |  \| |
#|  _ <|  __|| | |_ | | | | . ` |
#| |_) | |___| |__| |_| |_| |\  |
#|____/|______\_____|_____|_| \_|
#################################################################################
# ____ ____ _  _ _  _ ____ _  _ ___     _    _ _  _ ____    ___  ____ ____ ____ _  _ ____ ___ ____ ____ 
# |    |  | |\/| |\/| |__| |\ | |  \    |    | |\ | |___    |__] |__| |__/ |__| |\/| |___  |  |___ |__/ 
# |___ |__| |  | |  | |  | | \| |__/    |___ | | \| |___    |    |  | |  \ |  | |  | |___  |  |___ |  \ 
#
# first parameter = direction
#
$parameter  = shift;

if( exists($par_arguments{$parameter}) ){                                       # check for valid parameter

  # ############# DIRECTORY ############################
  $parameters{DIR} = $parameter;    $parameters{IDX} = 1;                       # set directory and start index

  # ############# OPTIONS ##############################
  $parameter = shift;                                                           # get next parameter
  while(defined $parameter){                                                    # if exists
    $parameters{$parameters{IDX}} = $parameter;                                 # store it with current index
    $parameters{IDX}++;                                                         # update index
    $parameter = shift;                                                         # get next parameter
  }

  # ############# SANITY CHECK #########################
  if( $parameters{IDX} < 2 ){                                                   # at least directory and input file are expected                        
    print "WARNING: Incorrect number of arguments, exit!\n";
    print_help();
    exit 1;
  }

  # ############### INPUT FILE #########################
  $parameters{INPUT}  = $parameters{1};                                         # set input file
  $filelength         = -s $parameters{INPUT};                                  # get file length
  
}else{                                                                          # parameter invalid
  print "WARNING: No parameter \"$parameter\" defined, exit!\n";                
  print_help();
  exit 1;
}


# ___  _ ____ ____ ____ ___ ____ ____ _   _    ____ _ _ _ _ ___ ____ _  _ 
# |  \ | |__/ |___ |     |  |  | |__/  \_/     [__  | | | |  |  |    |__| 
# |__/ | |  \ |___ |___  |  |__| |  \   |      ___] |_|_| |  |  |___ |  | 
#
# different routines depending on directory
#
switch( $parameters{DIR} ){
  # ############################# FROM BIN TO .TXT ##########################################
  # ___  _ _  _          ___ _  _ ___ 
  # |__] | |\ |    __     |   \/   |  
  # |__] | | \|           |  _/\_  |    
  case "-hex" { 

    if( $parameters{IDX} == 4 ){ $parameters{FORMAT} = $parameters{3};                      # check for format option
    }else{                       $parameters{FORMAT} = $txt_format;}                        # else default

    # write file length at first 4 bytes
    # print -s $parameters{INPUT};
    #$bank_idx = -s $parameters{INPUT};
    #print "$filelength\n";
    $hex_length = sprintf( '%08x', $filelength );
    print "$hex_length\n";

    system( "hexdump -v -e $parameters{FORMAT} $parameters{INPUT}" );                       # call extern function

  }

  # ############################# FROM .TXT TO .MEM #########################################
  case "-mem" {

    if( $parameters{IDX} == 3 ){ $addr = $parameters{2}; $start_flag = 4;}                  # check for start address
    if( $parameters{IDX} == 4 ){ $addr = $parameters{2}; $start_flag = 4;                   # check for length content
                                                         $length_flag = $parameters{3};}

    # open input file                                                     
    open IN_FILE, "< $parameters{INPUT}"
      or die "ERROR: cannot open $parameters{INPUT}! $!\n";

    # ########## INPUT FILE READ #########################
    while(<IN_FILE>){

      #if( $start_flag ){                                                                    # start address is set
        $hex_addr = sprintf( '@%x', $addr );                                                # format output address string
      #}

      $line = $_;                                                                           # get current line
      $line =~ s/(.{2})/$1 /g;                                                              # insert space every 2 characters = 1 byte
      print "$hex_addr $line";                                                              # print it out with given address string

      $cur_length += 4;                                                                     # update length
      #$addr       += $start_flag;                                                           # update address
      $addr += 4;

      if( $length_flag ){                                                                   # check length
        if( $cur_length >= $length_flag ){ last; }                                          # cancel if reached
      }
    }

    close IN_FILE;

    # ########### LENGTH ZERO PADDING ####################
    if( $length_flag ){                                                                     # only for given length

      if( $cur_length < $length_flag ){ print "\n"; }                                       # add newline

      while( $cur_length < $length_flag ){                                                  # and not arrived length

        if( $start_flag ){                                                                  # if address should also be printed out
          $hex_addr = sprintf( '@%x', $addr );                                              # format address string
        }

        $line = "00 00 00 00\n";                                                            # output line ist constant
        print "$hex_addr $line";                                                            # print it out

        $cur_length += 4;                                                                   # update length
        $addr       += $start_flag;                                                         # update address

      } # while
    } # length_flag
  } # -hex

  # ############################## FROM .MEM TO .TXT #########################################
  case "-txt"  {

    if( $parameters{IDX} == 3 ){ $addr = $parameters{2}; $start_flag = 4;}                  # check for start address option
    if( $parameters{IDX} == 4 ){ $addr = $parameters{2}; $start_flag = 4;                   # check for length options
                                                         $length_flag = $parameters{3};}

    $filelength = 0;                                                                        # reset file length information

    # open input file
    open IN_FILE, "< $parameters{INPUT}"
      or die "ERROR: cannot open $parameters{INPUT}! $!\n";

    # ############ INPUT FILE READ ######################
LINE: while(<IN_FILE>){

      @bytes = split( /\s+/, $_ );                                                          # extract bytes

      if( $bytes[0] =~ /^\@(\d+)/ ){                                                        # line contains address information = valid data

        unless( $filelength ){                                                              # file length is not extracted
          $filelength = hex( "$bytes[1]$bytes[2]$bytes[3]$bytes[4]" );                      # read file length
          splice( @bytes, 1, 4 );                                                           # remove this information from output
          $length_flag = $filelength + 1;                                                   # set length flag
        }

        splice( @bytes, 0, 1, @bytes_rest );                                                # replace addres field with reset of previous extraction
        @bytes_rest = ();                                                                   # clear this array

        while( (scalar @bytes) > 3 ){                                                       # there are more than 3 bytes in the working array

          print "$bytes[0]$bytes[1]$bytes[2]$bytes[3]\n";                                   # print word
          splice( @bytes, 0, 4 );                                                           # cut it

          $cur_length += 4;                                                                 # update length

          if( $length_flag ){                                                               # if length is set
            if( $cur_length > $length_flag ){ last LINE; }                                  # examine and exit if reached
          }
        }

        splice( @bytes_rest, 0, 0, @bytes );                                                # update rest
      }

    }

    close IN_FILE;

    # ############# LENGTH ZERO PADDING #################
    if( $length_flag ){                                                                     # length is given
      while( $cur_length < $length_flag ){                                                  # and not already reached
        print "00000000\n";                                                                 # print zero out
        $cur_length += 4;                                                                   # update length
      }
    }

  }

  # ################################# FROM .TXT TO .BIN #####################################
  case "-bin"  {

    if( $parameters{IDX} == 3){                                                             # check for output file name
      $parameters{OUTPUT} = $parameters{2};                                                 # set output file name
    }else{                                                                                  # output file name is mandatory
      print "ERROR: Output file should be specivied on bin mode!\n";
      print_help();
      exit 1;
    }

    # open input file
    open IN_FILE, "< $parameters{INPUT}"
      or die "ERROR: cannot open $parameters{INPUT}! $!\n";
    #open output file
    open OUT_FILE, "> $parameters{OUTPUT}"
      or die "ERROR: cannot open $parameters{OUTPUT}! $!\n";

    print "$parameters{INPUT} -> $parameters{OUTPUT}\n";                                    # print user information

    binmode(OUT_FILE);                                                                      # set mode

    # ############# INPUT FILE READ ###################
    while(<IN_FILE>){
      $line   = $_;                                                                         # get current line
      $line   =~ s/(.{2})/$1 /g;                                                            # insert space every 2 characters = 1 byte
      @bytes  = split( /\s/, $line );                                                       # extract bytes
      foreach( @bytes ){ print OUT_FILE pack( 'C1', hex($_) ); }                            # write these bytes to output file
    }

    close OUT_FILE;
    close IN_FILE;    

  }

  # ################################ UNKNOWN DIRECTORY ######################################
  else          { 
    print "WARNING: Undefined direction $parameters{DIR}, nothing to do!\n";
    print_help();
    exit 0;
  }
}

exit 0;
#################################################################################
#   _____ _    _ ____  ______ _    _ _   _  _____ _______ _____ ____  _   _  _____ 
#  / ____| |  | |  _ \|  ____| |  | | \ | |/ ____|__   __|_   _/ __ \| \ | |/ ____|
# | (___ | |  | | |_) | |__  | |  | |  \| | |       | |    | || |  | |  \| | (___  
#  \___ \| |  | |  _ <|  __| | |  | | . ` | |       | |    | || |  | | . ` |\___ \ 
#  ____) | |__| | |_) | |    | |__| | |\  | |____   | |   _| || |__| | |\  |____) |
# |_____/ \____/|____/|_|     \____/|_| \_|\_____|  |_|  |_____\____/|_| \_|_____/ 
#################################################################################
#
# help string
#

sub print_help{
  print STDERR "usage: file2out.pl DIR INPUT [OUTPUT]
creates formatted data depending on DIR

Examples: 
  file2out.pl -hex test.bmp   > data.txt
  file2out.pl -mem memory.txt > memory_in.mem
  file2out.pl -txt memory_ou.mem > memory_out.txt
  file2out.pl -bin memory_out.txt test_out.jp2
  
DIR can be:
  -hex  .bin -> .txt
  -mem  .txt -> .mem
  -txt  .mem -> .txt
  -bin  .txt -> .bin OUTPUT is mandatory here
";
}