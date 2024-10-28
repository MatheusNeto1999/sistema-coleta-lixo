-- Criação das Tabelas (MER)

CREATE TABLE associa (
    t_recipiente_id_recipiente INTEGER NOT NULL,
    t_tp_residuo_id_residuo    INTEGER NOT NULL
);

CREATE TABLE t_caminhao (
    id_caminhao INTEGER NOT NULL,
    placa       VARCHAR2(10) NOT NULL,
    capacidade  NUMBER(5, 2) NOT NULL,
    loc_atual   VARCHAR2(50) NOT NULL
);

CREATE TABLE t_notificacao (
    id_notificacao INTEGER NOT NULL,
    dt_envio       DATE NOT NULL,
    tp_notificacao VARCHAR2(50) NOT NULL,
    t_rota_id_rota INTEGER NOT NULL
);

CREATE TABLE t_recipiente (
    id_recipiente  INTEGER NOT NULL,
    localizacao    VARCHAR2(100) NOT NULL,
    cap_total      NUMBER(5, 2) NOT NULL,
    cap_atual      NUMBER(5, 2) NOT NULL,
    t_rota_id_rota INTEGER NOT NULL
);

CREATE TABLE t_rota (
    id_rota                INTEGER NOT NULL,
    dt_coleta              DATE NOT NULL,
    status                 VARCHAR2(20) NOT NULL,
    t_caminhao_id_caminhao INTEGER NOT NULL
);

CREATE TABLE t_tp_residuo (
    id_residuo   INTEGER NOT NULL,
    ds_categoria VARCHAR2(40) NOT NULL,
    rg_separacao VARCHAR2(200) NOT NULL
);
