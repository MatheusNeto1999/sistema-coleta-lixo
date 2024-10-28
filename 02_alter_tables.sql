-- Definição das Chaves Primárias e Relacionamentos (MER)

ALTER TABLE associa ADD CONSTRAINT relation_9_pk PRIMARY KEY ( t_recipiente_id_recipiente, t_tp_residuo_id_residuo );

ALTER TABLE t_caminhao ADD CONSTRAINT t_caminhao_pk PRIMARY KEY ( id_caminhao );

ALTER TABLE t_notificacao ADD CONSTRAINT t_notificacao_pk PRIMARY KEY ( id_notificacao );

ALTER TABLE t_recipiente ADD CONSTRAINT t_recipiente_pk PRIMARY KEY ( id_recipiente );

ALTER TABLE t_rota ADD CONSTRAINT t_rota_pk PRIMARY KEY ( id_rota );

ALTER TABLE t_tp_residuo ADD CONSTRAINT t_tp_residuo_pk PRIMARY KEY ( id_residuo );


-- Criação de Chaves Estrangeiras

ALTER TABLE associa
    ADD CONSTRAINT relation_9_t_recipiente_fk FOREIGN KEY ( t_recipiente_id_recipiente )
        REFERENCES t_recipiente ( id_recipiente );

ALTER TABLE associa
    ADD CONSTRAINT relation_9_t_tp_residuo_fk FOREIGN KEY ( t_tp_residuo_id_residuo )
        REFERENCES t_tp_residuo ( id_residuo );

ALTER TABLE t_notificacao
    ADD CONSTRAINT t_notificacao_t_rota_fk FOREIGN KEY ( t_rota_id_rota )
        REFERENCES t_rota ( id_rota );

ALTER TABLE t_recipiente
    ADD CONSTRAINT t_recipiente_t_rota_fk FOREIGN KEY ( t_rota_id_rota )
        REFERENCES t_rota ( id_rota );

ALTER TABLE t_rota
    ADD CONSTRAINT t_rota_t_caminhao_fk FOREIGN KEY ( t_caminhao_id_caminhao )
        REFERENCES t_caminhao ( id_caminhao );
