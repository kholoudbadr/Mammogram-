FileID = fopen('CALC_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
CALC_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('ASYM_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
ASYM_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('CIRC_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
CIRC_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('MISC_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
MISC_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('SPIC_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
SPIC_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('ARCH_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
ARCH_class_core_vector = complex(Features_real, Features_imag);

FileID = fopen('NORM_class_core_vector.bin');
Features_real = fread(FileID, [1, 700], 'double');
Features_imag = fread(FileID, [1, 700], 'double');
fclose(FileID);
NORM_class_core_vector = complex(Features_real, Features_imag);