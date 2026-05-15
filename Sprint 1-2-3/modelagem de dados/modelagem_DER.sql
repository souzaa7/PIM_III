Table usuario {
  id_usuario int [pk, increment]
  cpf varchar(14) [not null, unique]
  nome varchar(100) [not null]
  email varchar(100) [not null, unique]
  senha varchar(255) [not null]
  ativo boolean [default: true]
  data_cadastro datetime
}

Table aluno {
  id_aluno int [pk, increment]
  id_usuario int [not null, unique]
}

Table admin {
  id_admin int [pk, increment]
  id_usuario int [not null, unique]
}

Table secretaria {
  id_secretaria int [pk, increment]
  id_usuario int [not null, unique]
}

Table conteudo {
  id_conteudo int [pk, increment]
  titulo varchar(150) [not null]
  descricao text
  ativo boolean [default: true]
  data_criacao datetime
  id_secretaria int [not null]
}

Table atividade {
  id_atividade int [pk, increment]
  titulo varchar(150) [not null]
  descricao text
  data_entrega datetime
  nota_maxima decimal(5,2)
  id_conteudo int [not null]
}

Table resposta {
  id_resposta int [pk, increment]
  texto_resposta text
  data_envio datetime
  id_atividade int [not null]
  id_aluno int [not null]
}

Table nota {
  id_nota int [pk, increment]
  valor decimal(5,2)
  feedback text
  data_avaliacao datetime
  id_resposta int [not null, unique]
}

Ref: aluno.id_usuario > usuario.id_usuario
Ref: admin.id_usuario > usuario.id_usuario
Ref: secretaria.id_usuario > usuario.id_usuario

Ref: conteudo.id_secretaria > secretaria.id_secretaria

Ref: atividade.id_conteudo > conteudo.id_conteudo

Ref: resposta.id_atividade > atividade.id_atividade
Ref: resposta.id_aluno > aluno.id_aluno

Ref: nota.id_resposta > resposta.id_resposta