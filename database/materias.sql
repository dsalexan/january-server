INSERT INTO materias VALUES('1',
                            'Núcleo Planck de Artes',
                            'Escultura',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            20,
                            8,
                            2,
                            ARRAY['custo extra'],
                            null); 

INSERT INTO materias VALUES('2',
                            'Núcleo Planck de Artes',
                            'Pintura',
                            ARRAY[3],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            20,
                            8,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('3',
                            'Núcleo Planck de Artes',
                            'Desenho',
                            ARRAY[4],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            8,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('5',
                            'Núcleo Planck de Artes',
                            'Piano/Teclado B',
                            ARRAY[3],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            6,
                            2,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('5.1',
                            'Núcleo Planck de Artes',
                            'Piano/Teclado A',
                            ARRAY[3],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            6,
                            2,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('6',
                            'Núcleo Planck de Artes',
                            'Violão A',
                            ARRAY[4],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            10,
                            2,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('6.1',
                            'Núcleo Planck de Artes',
                            'Violão B',
                            ARRAY[5],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            10,
                            2,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('7',
                            'Núcleo Planck de Artes',
                            'Guitarra/Baixo A',
                            ARRAY[4],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            10,
                            2,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('7.1',
                            'Núcleo Planck de Artes',
                            'Guitarra/Baixo B',
                            ARRAY[5],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            10,
                            2,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('9',
                            'Núcleo Planck de Artes',
                            'Teatro',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            8,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[8, 9, 10, 11]);

INSERT INTO materias VALUES('10',
                            'Núcleo Planck de Artes',
                            'Teatro',
                            ARRAY[5],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            8,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5, 6, 7]);

INSERT INTO materias VALUES('11',
                            'Núcleo Planck de Artes',
                            'Sapateado 1',
                            ARRAY[3, 5],
                            ARRAY['16:40'::TIME, '16:40'::TIME],
                            ARRAY['17:40'::TIME, '17:40'::TIME],
                            28,
                            8,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('12',
                            'Núcleo Planck de Artes',
                            'Sapateado 2',
                            ARRAY[3, 5],
                            ARRAY['17:50'::TIME, '17:50'::TIME],
                            ARRAY['18:50'::TIME, '18:50'::TIME],
                            28,
                            8,
                            2,
                            ARRAY['custo extra'],
                            null);
INSERT INTO materias VALUES('13',
                            'Núcleo Planck de Artes',
                            'Bateria A',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            6,
                            2,
                            2,
                            ARRAY['custo extra'],
                            null);
INSERT INTO materias VALUES('13.1',
                            'Núcleo Planck de Artes',
                            'Bateria B',
                            ARRAY[2],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            6,
                            2,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('14',
                            'Núcleo Planck de Artes',
                            'Street Dance',
                            ARRAY[4, 6],
                            ARRAY['16:40'::TIME, '16:40'::TIME],
                            ARRAY['17:40'::TIME, '17:40'::TIME],
                            28,
                            8,
                            2,
                            ARRAY['custo extra'],
                            null);

INSERT INTO materias VALUES('15.5',
                            'Núcleo Planck de Esportes',
                            'Volei',
                            ARRAY[4, 5],
                            ARRAY['15:30'::TIME, '17:50'::TIME],
                            ARRAY['16:30'::TIME, '18:50'::TIME],
                            20,
                            10,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5, 6, 7]);

INSERT INTO materias VALUES('15.7',
                            'Núcleo Planck de Esportes',
                            'Handball',
                            ARRAY[5, 6],
                            ARRAY['16:40'::TIME, '16:40'::TIME],
                            ARRAY['17:40'::TIME, '17:40'::TIME],
                            30,
                            12,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5, 6, 7]);

INSERT INTO materias VALUES('16',
                            'Núcleo Planck de Esportes',
                            'Volei',
                            ARRAY[2, 4],
                            ARRAY['15:30'::TIME, '14:20'::TIME],
                            ARRAY['16:30'::TIME, '15:20'::TIME],
                            20,
                            10,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[8, 9, 10, 11]);

INSERT INTO materias VALUES('17',
                            'Núcleo Planck de Esportes',
                            'Futebol Masc.',
                            ARRAY[2, 4],
                            ARRAY['16:40'::TIME, '17:50'::TIME],
                            ARRAY['17:40'::TIME, '18:50'::TIME],
                            20,
                            10,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[8, 9, 10, 11]);

INSERT INTO materias VALUES('18',
                            'Núcleo Planck de Esportes',
                            'Futebol Fem.',
                            ARRAY[2, 4],
                            ARRAY['17:50'::TIME, '16:40'::TIME],
                            ARRAY['18:50'::TIME, '17:40'::TIME],
                            20,
                            10,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[8, 9, 10, 11]);

INSERT INTO materias VALUES('19',
                            'Núcleo Planck de Esportes',
                            'Futebol Fem.',
                            ARRAY[3, 6],
                            ARRAY['14:20'::TIME, '14:20'::TIME],
                            ARRAY['15:20'::TIME, '15:20'::TIME],
                            20,
                            10,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5,6, 7]);

INSERT INTO materias VALUES('20',
                            'Núcleo Planck de Esportes',
                            'Futebol Masc.',
                            ARRAY[3, 5],
                            ARRAY['15:30'::TIME, '14:20'::TIME],
                            ARRAY['16:30'::TIME, '15:20'::TIME],
                            20,
                            10,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5, 6, 7]);

INSERT INTO materias VALUES('21',
                            'Núcleo Planck de Esportes',
                            'Handball',
                            ARRAY[3, 6],
                            ARRAY['17:50'::TIME, '17:50'::TIME],
                            ARRAY['18:50'::TIME, '18:50'::TIME],
                            30,
                            12,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[8, 9, 10, 11]);

INSERT INTO materias VALUES('22',
                            'Núcleo Planck de Esportes',
                            'Basquete 3x3',
                            ARRAY[5, 6],
                            ARRAY['15:30'::TIME, '15:30'::TIME],
                            ARRAY['16:30'::TIME, '16:30'::TIME],
                            24,
                            8,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5, 6, 7]);

INSERT INTO materias VALUES('22.2',
                            'Núcleo Planck de Esportes',
                            'Basquete',
                            ARRAY[2, 3],
                            ARRAY['14:20'::TIME, '16:40'::TIME],
                            ARRAY['15:20'::TIME, '17:40'::TIME],
                            20,
                            10,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[8, 9, 10, 11]);

INSERT INTO materias VALUES('23',
                            'Núcleo Planck de Esportes',
                            'Judo',
                            ARRAY[2, 4],
                            ARRAY['14:20'::TIME, '14:20'::TIME],
                            ARRAY['15:20'::TIME, '15:20'::TIME],
                            24,
                            6,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5, 6, 7]);

INSERT INTO materias VALUES('24',
                            'Núcleo Planck de Esportes',
                            'Judo',
                            ARRAY[2, 4],
                            ARRAY['15:30'::TIME, '15:30'::TIME],
                            ARRAY['16:30'::TIME, '16:30'::TIME],
                            24,
                            6,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[8, 9, 10, 11]);

INSERT INTO materias VALUES('25',
                            'Núcleo Planck de Esportes',
                            'Tenis de Mesa',
                            ARRAY[2, 6],
                            ARRAY['17:50'::TIME, '15:30'::TIME],
                            ARRAY['18:50'::TIME, '16:30'::TIME],
                            16,
                            6,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[8, 9, 10, 11]);
INSERT INTO materias VALUES('26',
                            'Núcleo Planck de Esportes',
                            'Tenis de Mesa',
                            ARRAY[2, 6],
                            ARRAY['16:40'::TIME, '14:20'::TIME],
                            ARRAY['17:40'::TIME, '15:20'::TIME],
                            16,
                            6,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5,6,7]);
INSERT INTO materias VALUES('27',
                            'Núcleo Planck de Esportes',
                            'Yoga',
                            ARRAY[5],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            24,
                            6,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5,6,7]);

INSERT INTO materias VALUES('28',
                            'Núcleo Planck de Esportes',
                            'Yoga',
                            ARRAY[3],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            24,
                            6,
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
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            null);

INSERT INTO materias VALUES('31',
                            'Núcleo Planck de Tecnologia',
                            'Programação',
                            ARRAY[4],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            15,
                            6,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[9, 10, 11]);

INSERT INTO materias VALUES('32',
                            'Núcleo Planck de Tecnologia',
                            'Startup',
                            ARRAY[5],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            20,
                            6,
                            2,
                            ARRAY['custo extra'],
                            null);
        
INSERT INTO materias VALUES('4',
                            'Núcleo Planck de Artes',
                            'Mídias Sociais',
                            ARRAY[5],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            20,
                            6,
                            2,
                            ARRAY['custo extra'],
                             ARRAY[5, 6, 7]);

INSERT INTO materias VALUES('4.5',
                            'Núcleo Planck de Artes',
                            'Mídias Sociais',
                            ARRAY[6],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            20,
                            6,
                            2,
                            ARRAY['custo extra'],
                             ARRAY[8, 9, 10, 11]);

INSERT INTO materias VALUES('33',
                            'Núcleo Planck de Tecnologia',
                            'Programação',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            15,
                            6,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5, 6]);

INSERT INTO materias VALUES('34',
                            'Núcleo Planck de Tecnologia',
                            'Programação',
                            ARRAY[2],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            15,
                            6,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[7, 8]);


INSERT INTO materias VALUES('37',
                            'Núcleo Planck de Tecnologia',
                            'Robótica',
                            ARRAY[4],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            28,
                            4,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[5,6,7]);

INSERT INTO materias VALUES('38',
                            'Núcleo Planck de Tecnologia',
                            'Robótica',
                            ARRAY[3],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            28,
                            4,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[8,9,10,11]);

INSERT INTO materias VALUES('39',
                            'Núcleo Planck de Tecnologia',
                            'Agência Júnior',
                            ARRAY[3],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            8,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[8, 9,10,11]);

INSERT INTO materias VALUES('411',
                            'Planck Internacional',
                            'PEC Nível A2',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['17:40'::TIME],
                            25,
                            4,
                            3,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);

INSERT INTO materias VALUES('412',
                            'Planck Internacional',
                            'PEC Nível B1',
                            ARRAY[4],
                            ARRAY['14:20'::TIME],
                            ARRAY['17:40'::TIME],
                            25,
                            4,
                            3,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);

INSERT INTO materias VALUES('413',
                            'Planck Internacional',
                            'PEC Nível B2',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['17:40'::TIME],
                            25,
                            4,
                            3,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);
INSERT INTO materias VALUES('414',
                            'Planck Internacional',
                            'PEC Nível B2',
                            ARRAY[4],
                            ARRAY['14:20'::TIME],
                            ARRAY['17:40'::TIME],
                            25,
                            4,
                            3,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]); 
INSERT INTO materias VALUES('415',
                            'Planck Internacional',
                            'PEC Nível C1',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['17:40'::TIME],
                            25,
                            4,
                            3,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);
INSERT INTO materias VALUES('416',
                            'Planck Internacional',
                            'PEC Nível C1',
                            ARRAY[4],
                            ARRAY['14:20'::TIME],
                            ARRAY['17:40'::TIME],
                            25,
                            4,
                            3,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);

INSERT INTO materias VALUES('43',
                            'Planck Internacional',
                            'Planck ONU',
                            ARRAY[3],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            50,
                            10,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[8, 9,10,11]);

INSERT INTO materias VALUES('44',
                            'Planck Internacional',
                            'Espanhol 1',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            25,
                            8,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);
INSERT INTO materias VALUES('45',
                            'Planck Internacional',
                            'Espanhol 1',
                            ARRAY[4],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            25,
                            8,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);

INSERT INTO materias VALUES('46',
                            'Planck Internacional',
                            'Francês 1',
                            ARRAY[3],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            25,
                            8,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);


INSERT INTO materias VALUES('48',
                            'Planck Internacional',
                            'Francês 2',
                            ARRAY[3],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            25,
                            8,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);

INSERT INTO materias VALUES('49',
                            'Planck Internacional',
                            'Francês 1',
                            ARRAY[2],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            25,
                            8,
                            2,
                            ARRAY[]::VARCHAR(20)[], 
                            ARRAY[9,10,11]);

INSERT INTO materias VALUES('49.1',
                            'Planck Internacional',
                            'Francês',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            25,
                            8,
                            2,
                            ARRAY['custo extra'], 
                            ARRAY[5,6,7,8]);

INSERT INTO materias VALUES('51',
                            'Planck Internacional',
                            'Espanhol 2',
                            ARRAY[3],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            25,
                            8,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);


INSERT INTO materias VALUES('53',
                            'Planck Internacional',
                            'Espanhol',
                            ARRAY[2],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            25,
                            8,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5,6,7,8]);
INSERT INTO materias VALUES('54',
                            'Planck Internacional',
                            'Espanhol',
                            ARRAY[4],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            25,
                            8,
                            2,
                            ARRAY['custo extra'],
                            ARRAY[5,6,7,8]);

INSERT INTO materias VALUES('54.5',
                            'Planck Internacional',
                            'Libras',
                            ARRAY[4],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            40,
                            8,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            null);

INSERT INTO materias VALUES('55',
                            'Programa Planck de Preparação Olímpica',
                            'Física',
                            ARRAY[4],
                            ARRAY['14:20'::TIME],
                            ARRAY['15:20'::TIME],
                            30,
                            0,
                            1,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[8, 9]);

INSERT INTO materias VALUES('56',
                            'Programa Planck de Preparação Olímpica',
                            'Física',
                            ARRAY[4],
                            ARRAY['15:30'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            0,
                            1,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[10, 11]);

INSERT INTO materias VALUES('58',
                            'Programa Planck de Preparação Olímpica',
                            'Matemática',
                            ARRAY[6],
                            ARRAY['14:20'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            0,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[5, 6]);
INSERT INTO materias VALUES('59',
                            'Programa Planck de Preparação Olímpica',
                            'Matemática',
                            ARRAY[3],
                            ARRAY['16:40'::TIME],
                            ARRAY['18:50'::TIME],
                            30,
                            0,
                            2,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[7, 8]);
INSERT INTO materias VALUES('60',
                            'Programa Planck de Preparação Olímpica',
                            'Matemática',
                            ARRAY[2],
                            ARRAY['15:30'::TIME],
                            ARRAY['18:50'::TIME],
                            30,
                            0,
                            3,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);
INSERT INTO materias VALUES('61',
                            'Programa Planck de Preparação Olímpica',
                            'Filosofia',
                            ARRAY[2],
                            ARRAY['14:20'::TIME],
                            ARRAY['15:20'::TIME],
                            30,
                            0,
                            1,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);
INSERT INTO materias VALUES('62',
                            'Programa Planck de Preparação Olímpica',
                            'Bioquímica',
                            ARRAY[3],
                            ARRAY['15:30'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            0,
                            1,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[9,10,11]);
INSERT INTO materias VALUES('35',
                            'Programa Planck de Preparação Olímpica',
                            'Astronomia',
                            ARRAY[3],
                            ARRAY['14:20'::TIME],
                            ARRAY['15:20'::TIME],
                            30,
                            4,
                            1,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[5, 6, 7]);

INSERT INTO materias VALUES('36',
                            'Programa Planck de Preparação Olímpica',
                            'Astronomia',
                            ARRAY[3],
                            ARRAY['15:30'::TIME],
                            ARRAY['16:30'::TIME],
                            30,
                            4,
                            1,
                            ARRAY[]::VARCHAR(20)[],
                            ARRAY[8,9,10,11]);