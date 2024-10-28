-- Rastreamento de Caminhões em Tempo Real

CREATE OR REPLACE TRIGGER atualiza_localizacao_caminhao
AFTER UPDATE ON T_CAMINHAO
FOR EACH ROW
DECLARE
    v_id_rota INTEGER;
BEGIN
    -- Buscar a rota associada ao caminhão atualizado
    SELECT id_rota
    INTO v_id_rota
    FROM T_ROTA
    WHERE t_caminhao_id_caminhao = :NEW.id_caminhao;
    
    -- Verifica se a localização foi alterada
    IF :NEW.loc_atual != :OLD.loc_atual THEN
        -- Atualiza o status da rota para "Em andamento"
        UPDATE T_ROTA
        SET status = 'Em andamento'
        WHERE id_rota = v_id_rota;
        
        -- Emitir alerta se o caminhão estiver fora da rota
        IF :NEW.loc_atual = 'Desvio' THEN
            DBMS_OUTPUT.PUT_LINE('Alerta: Caminhão com placa ' || :NEW.placa || ' está fora da rota!');
        END IF;
        
        -- Imprime a nova localização
        DBMS_OUTPUT.PUT_LINE('Localização atualizada: ' || :NEW.loc_atual);
    END IF;
END;


-- Gestão de Inventário de Recipientes

CREATE OR REPLACE TRIGGER atualiza_inventario_recipientes
AFTER UPDATE ON T_RECIPIENTE
FOR EACH ROW
BEGIN
    IF :NEW.cap_atual >= :NEW.cap_total THEN
        DBMS_OUTPUT.PUT_LINE('Recipiente em ' || :NEW.localizacao || ' está cheio. Considerar reposição.');
    ELSIF :NEW.cap_atual <= :NEW.cap_total * 0.1 THEN
        DBMS_OUTPUT.PUT_LINE('Recipiente em ' || :NEW.localizacao || ' precisa de manutenção ou reposição.');
    END IF;
END;
