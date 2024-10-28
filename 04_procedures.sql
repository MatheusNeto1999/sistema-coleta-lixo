-- Notificação dos Moradores

CREATE OR REPLACE PROCEDURE envia_notificacao_moradores
IS
    CURSOR c1 IS 
        SELECT r.localizacao, c.loc_atual, r.cap_atual
        FROM T_RECIPIENTE r, T_CAMINHAO c
        WHERE r.id_rota = c.id_rota
        AND c.loc_atual = r.localizacao;
BEGIN
    FOR v_rec IN c1 LOOP
        IF v_rec.cap_atual > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Caminhão de coleta está próximo do recipiente na localização: ' || v_rec.localizacao);
        END IF;
    END LOOP;
END;


-- Monitoramento da Quantidade de Lixo

CREATE OR REPLACE PROCEDURE gerar_relatorio_quantidade_lixo
IS
    CURSOR c1 IS 
        SELECT c.placa, SUM(r.cap_atual) AS total_lixo, r.dt_coleta
        FROM T_CAMINHAO c, T_RECIPIENTE r, T_ROTA rota
        WHERE c.id_caminhao = rota.id_caminhao
        AND rota.id_rota = r.id_rota
        GROUP BY c.placa, r.dt_coleta;
BEGIN
    FOR v_coleta IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE('Caminhão: ' || v_coleta.placa || ' coletou ' || v_coleta.total_lixo || ' toneladas de lixo na data: ' || v_coleta.dt_coleta);
    END LOOP;
END;
