INSERT INTO materias VALUES('1',
                            'Núcleo Planck de Artes',
                            'Escultura 6-3',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            20,
                            8,
                            5,
                            2,
                            ARRAY['custo extra'],
                            null); 

INSERT INTO materias VALUES('2',
                            'Núcleo Planck de Artes',
                            'Pintura 6-3',
                            ARRAY[3],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            20,
                            8,
                            2,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('3',
                            'Núcleo Planck de Artes',
                            'Desenho 6-3',
                            ARRAY[4],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            8,
                            23,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('5',
                            'Núcleo Planck de Artes',
                            'Piano/Teclado B 6-3',
                            ARRAY[3],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            6,
                            2,
                            6,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('5.1',
                            'Núcleo Planck de Artes',
                            'Piano/Teclado A 6-3',
                            ARRAY[3],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            6,
                            2,
                            6,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('6',
                            'Núcleo Planck de Artes',
                            'Violão A 6-3',
                            ARRAY[4],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            10,
                            2,
                            8,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('6.1',
                            'Núcleo Planck de Artes',
                            'Violão B 6-3',
                            ARRAY[5],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            10,
                            2,
                            6,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('7',
                            'Núcleo Planck de Artes',
                            'Guitarra/Baixo A 6-3',
                            ARRAY[4],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            10,
                            2,
                            1,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('7.1',
                            'Núcleo Planck de Artes',
                            'Guitarra/Baixo B 6-3',
                            ARRAY[5],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            10,
                            2,
                            3,
                            2,
                            ARRAY['custo extra'],
                            null);  

INSERT INTO materias VALUES('9',
                            'Núcleo Planck de Artes',
                            'Teatro 9-3',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            8,
                            5,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[8, 9, 10, 11]);

INSERT INTO materias VALUES('10',
                            'Núcleo Planck de Artes',
                            'Teatro 6-8',
                            ARRAY[5],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            8,
                            11,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5, 6, 7]);

INSERT INTO materias VALUES('11',
                            'Núcleo Planck de Artes',
                            'Sapateado A 6-3',
                            ARRAY[3, 5],
                            ARRAY['16:40'::TIME, '16:40'::TIME],
                            ARRAY['17:40'::TIME, '17:40'::TIME],
                            28,
                            8,
                            7,
                            2,
                            ARRAY['custo extra'],
                            null);


INSERT INTO materias VALUES('13',
                            'Núcleo Planck de Artes',
                            'Bateria A 6-3',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            6,
                            2,
                            5,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('13.1',
                            'Núcleo Planck de Artes',
                            'Bateria B 6-3',
                            ARRAY[2],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            6,
                            2,
                            4,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('14',
                            'Núcleo Planck de Artes',
                            'Street Dance 6-3',
                            ARRAY[4, 6],
                            ARRAY['16:40'::TIME, '16:40'::TIME],
                            ARRAY['17:40'::TIME, '17:40'::TIME],
                            28,
                            8,
                            6,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('15.5',
                            'Núcleo Planck de Esportes',
                            'Volei 6-8',
                            ARRAY[4, 5],
                            ARRAY['15:30'::TIME, '17:50'::TIME],
                            ARRAY['16:30'::TIME, '18:50'::TIME],
                            20,
                            10,
                            8,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5, 6, 7]);

INSERT INTO materias VALUES('15.7',
                            'Núcleo Planck de Esportes',
                            'Handball 6-8',
                            ARRAY[5, 6],
                            ARRAY['16:40'::TIME, '16:40'::TIME],
                            ARRAY['17:40'::TIME, '17:40'::TIME],
                            30,
                            12,
                            8,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5, 6, 7]);

INSERT INTO materias VALUES('16',
                            'Núcleo Planck de Esportes',
                            'Volei 9-3',
                            ARRAY[2, 4],
                            ARRAY['15:30'::TIME, '14:20'::TIME],
                            ARRAY['16:30'::TIME, '15:20'::TIME],
                            20,
                            10,
                            9,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[8, 9, 10, 11]);

INSERT INTO materias VALUES('17',
                            'Núcleo Planck de Esportes',
                            'Futebol Masc. 9-3',
                            ARRAY[2, 4],
                            ARRAY['16:40'::TIME, '17:50'::TIME],
                            ARRAY['17:40'::TIME, '18:50'::TIME],
                            20,
                            10,
                            9,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[8, 9, 10, 11]);

INSERT INTO materias VALUES('19',
                            'Núcleo Planck de Esportes',
                            'Futebol Fem. 6-8',
                            ARRAY[3, 6],
                            ARRAY['14:20'::TIME, '14:20'::TIME],
                            ARRAY['15:20'::TIME, '15:20'::TIME],
                            20,
                            10,
                            1,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5,6, 7]);

INSERT INTO materias VALUES('20',
                            'Núcleo Planck de Esportes',
                            'Futebol Masc. 6-8',
                            ARRAY[3, 5],
                            ARRAY['15:30'::TIME, '14:20'::TIME],
                            ARRAY['16:30'::TIME, '15:20'::TIME],
                            20,
                            10,
                            4,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5, 6, 7]);

INSERT INTO materias VALUES('21',
                            'Núcleo Planck de Esportes',
                            'Handball 9-3',
                            ARRAY[3, 6],
                            ARRAY['17:50'::TIME, '17:50'::TIME],
                            ARRAY['18:50'::TIME, '18:50'::TIME],
                            30,
                            12,
                            11,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[8, 9, 10, 11]);

INSERT INTO materias VALUES('22',
                            'Núcleo Planck de Esportes',
                            'Basquete 3x3 6-8',
                            ARRAY[5, 6],
                            ARRAY['15:30'::TIME, '15:30'::TIME],
                            ARRAY['16:30'::TIME, '16:30'::TIME],
                            24,
                            8,
                            3,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5, 6, 7]);

INSERT INTO materias VALUES('22.2',
                            'Núcleo Planck de Esportes',
                            'Basquete 9-3',
                            ARRAY[2, 3],
                            ARRAY['14:20'::TIME, '16:40'::TIME],
                            ARRAY['15:20'::TIME, '17:40'::TIME],
                            20,
                            10,
                            9,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[8, 9, 10, 11]);

INSERT INTO materias VALUES('23',
                            'Núcleo Planck de Esportes',
                            'Judô 6-3',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:00'::TIME],
                            24,
                            6,
                            1,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5, 6, 7, 8, 9, 10, 11]);

INSERT INTO materias VALUES('26',
                            'Núcleo Planck de Esportes',
                            'T. Mesa 6-3',
                            ARRAY[2],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:40'::TIME],
                            16,
                            6,
                            4,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5,6,7]);
INSERT INTO materias VALUES('27',
                            'Núcleo Planck de Esportes',
                            'Yoga 6-8',
                            ARRAY[5],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            24,
                            6,
                            4,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5,6,7]);

INSERT INTO materias VALUES('28',
                            'Núcleo Planck de Esportes',
                            'Yoga 9-3',
                            ARRAY[3],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            24,
                            6,
                            10,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[8, 9, 10, 11]);


INSERT INTO materias VALUES('29',
                            'Núcleo Planck de Esportes',
                            'Xadrez A',
                            ARRAY[3],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            28,
                            4,
                            22,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            null);
INSERT INTO materias VALUES('30',
                            'Núcleo Planck de Esportes',
                            'Xadrez B',
                            ARRAY[6],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            28,
                            4,
                            9,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            null);

INSERT INTO materias VALUES('31',
                            'Núcleo Planck de Tecnologia',
                            'Programação 1-3',
                            ARRAY[4],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            15,
                            6,
                            10,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[9, 10, 11]);

INSERT INTO materias VALUES('32',
                            'Núcleo Planck de Tecnologia',
                            'Startup 9-3',
                            ARRAY[5],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            20,
                            6,
                            20,
                            2,
                            ARRAY['custo extra'],
                            null);
        
INSERT INTO materias VALUES('4',
                            'Núcleo Planck de Tecnologia',
                            'Mídias Soc 6-8',
                            ARRAY[5],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            20,
                            6,
                            9,
                            2,
                            ARRAY['custo extra'],
                             ARRAY[5, 6, 7]);

INSERT INTO materias VALUES('4.5',
                            'Núcleo Planck de Tecnologia',
                            'Mídias Soc 9-3',
                            ARRAY[6],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            20,
                            6,
                            2,
                            2,
                            ARRAY['custo extra'],
                             ARRAY[8, 9, 10, 11]);

INSERT INTO materias VALUES('33',
                            'Núcleo Planck de Tecnologia',
                            'Programação 6-7',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            15,
                            6,
                            0,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5, 6]);

INSERT INTO materias VALUES('37',
                            'Núcleo Planck de Tecnologia',
                            'Robótica 6-8',
                            ARRAY[4],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            28,
                            4,
                            28,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[5,6,7]);

INSERT INTO materias VALUES('38',
                            'Núcleo Planck de Tecnologia',
                            'Robótica 9-3',
                            ARRAY[3],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            28,
                            4,
                            12,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[8,9,10,11]);

INSERT INTO materias VALUES('39',
                            'Núcleo Planck de Tecnologia',
                            'Agência Júnior 9-3',
                            ARRAY[3],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            8,
                            12,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[8, 9,10,11]);

INSERT INTO materias VALUES('411',
                            'Planck Internacional',
                            'PEC - A2 - EM',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['17:40'::TIME],
                            25,
                            4,
                            15,
                            3,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);

INSERT INTO materias VALUES('412',
                            'Planck Internacional',
                            'PEC - B1 - EM',
                            ARRAY[4],
                            ARRAY['14:20'::TIME],
                            ARRAY['17:40'::TIME],
                            25,
                            4,
                            19,
                            3,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);

INSERT INTO materias VALUES('413',
                            'Planck Internacional',
                            'PEC - B2 - EM',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['17:40'::TIME],
                            25,
                            4,
                            25,
                            3,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);
INSERT INTO materias VALUES('414',
                            'Planck Internacional',
                            'PEC - B2 - EM',
                            ARRAY[4],
                            ARRAY['14:20'::TIME],
                            ARRAY['17:40'::TIME],
                            25,
                            4,
                            12,
                            3,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]); 
INSERT INTO materias VALUES('415',
                            'Planck Internacional',
                            'PEC - C1 - EM',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['17:40'::TIME],
                            25,
                            4,
                            25,
                            3,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);
INSERT INTO materias VALUES('416',
                            'Planck Internacional',
                            'PEC - C1 - EM',
                            ARRAY[4],
                            ARRAY['14:20'::TIME],
                            ARRAY['17:40'::TIME],
                            25,
                            4,
                            8,
                            3,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);

INSERT INTO materias VALUES('43',
                            'Planck Internacional',
                            'PlanckONU 9-3',
                            ARRAY[3],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            50,
                            10,
                            50,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[8, 9,10,11]);

INSERT INTO materias VALUES('44',
                            'Planck Internacional',
                            'Espanhol-I A - EM',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            25,
                            8,
                            12,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);

INSERT INTO materias VALUES('48',
                            'Planck Internacional',
                            'Francês - II EM',
                            ARRAY[3],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            25,
                            8,
                            4,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);

INSERT INTO materias VALUES('49',
                            'Planck Internacional',
                            'Francês-I A - EM',
                            ARRAY[2],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            25,
                            8,
                            25,
                            2,
                            ARRAY[]::VARCHAR(20)[], 
                            ARRAY[9,10,11]);

INSERT INTO materias VALUES('49.1',
                            'Planck Internacional',
                            'Francês 6-9',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            25,
                            8,
                            14,
                            2,
                            ARRAY['custo extra'], 
                            ARRAY[5,6,7,8]);

INSERT INTO materias VALUES('51',
                            'Planck Internacional',
                            'Espanhol - II - EM',
                            ARRAY[3],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            25,
                            8,
                            7,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);


INSERT INTO materias VALUES('53',
                            'Planck Internacional',
                            'Espanhol A 6-9',
                            ARRAY[2],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            25,
                            8,
                            9,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5,6,7,8]);

INSERT INTO materias VALUES('54.5',
                            'Planck Internacional',
                            'Libras 6-3',
                            ARRAY[4],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            40,
                            10,
                            4,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('55',
                            'Programa Planck de Preparação Olímpica',
                            'Física 9-1',
                            ARRAY[4],
                            ARRAY['14:20'::TIME],
                            ARRAY['15:20'::TIME],
                            30,
                            5,
                            20,
                            1,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[8, 9]);

INSERT INTO materias VALUES('56',
                            'Programa Planck de Preparação Olímpica',
                            'Física 2-3',
                            ARRAY[4],
                            ARRAY['15:30'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            5,
                            9,
                            1,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[10, 11]);

INSERT INTO materias VALUES('58',
                            'Programa Planck de Preparação Olímpica',
                            'Matemática 6-7',
                            ARRAY[6],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            5,
                            27,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[5, 6]);
INSERT INTO materias VALUES('59',
                            'Programa Planck de Preparação Olímpica',
                            'Matemática 8-9',
                            ARRAY[3],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            30,
                            5,
                            22,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[7, 8]);
INSERT INTO materias VALUES('60',
                            'Programa Planck de Preparação Olímpica',
                            'Matemática 1-3',
                            ARRAY[2],
                            ARRAY['15:30'::TIME],
                            ARRAY['18:50'::TIME],
                            30,
                            5,
                            30,
                            3,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);
INSERT INTO materias VALUES('61',
                            'Programa Planck de Preparação Olímpica',
                            'Filosofia 1-3',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['15:20'::TIME],
                            30,
                            5,
                            10,
                            1,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);
INSERT INTO materias VALUES('62',
                            'Programa Planck de Preparação Olímpica',
                            'BioQuímica 1-3',
                            ARRAY[3],
                            ARRAY['15:30'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            5,
                            30,
                            1,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);
INSERT INTO materias VALUES('35',
                            'Programa Planck de Preparação Olímpica',
                            'Astronomia 6-8',
                            ARRAY[3],
                            ARRAY['14:20'::TIME],
                            ARRAY['15:20'::TIME],
                            30,
                            4,
                            16,
                            1,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[5, 6, 7]);

INSERT INTO materias VALUES('36',
                            'Programa Planck de Preparação Olímpica',
                            'Astronomia 9-3',
                            ARRAY[3],
                            ARRAY['15:30'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            4,
                            19,
                            1,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[8,9,10,11]);