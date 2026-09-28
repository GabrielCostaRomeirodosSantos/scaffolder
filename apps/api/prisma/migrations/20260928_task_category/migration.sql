-- Migration: 20260928_task_category
-- Description: Adiciona categoria (classificação livre por domínio) às tarefas do módulo de referência

-- Consulta 001: Criação do tipo enum de categoria
CREATE TYPE "TaskCategory" AS ENUM ('PERSONAL', 'WORK', 'STUDY', 'SHOPPING', 'HEALTH', 'OTHER');

-- Consulta 002: Adição da coluna category com valor padrão OTHER para linhas existentes
ALTER TABLE "tasks" ADD COLUMN "category" "TaskCategory" NOT NULL DEFAULT 'OTHER';

-- Consulta 003: Índice para consultas filtradas por categoria
CREATE INDEX "tasks_category_idx" ON "tasks"("category");
