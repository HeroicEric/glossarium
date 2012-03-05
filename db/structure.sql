CREATE TABLE "definitions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "text" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "glossaries" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "terms" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "glossary_id" integer, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "definition_id" integer);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20120213235835');

INSERT INTO schema_migrations (version) VALUES ('20120214174541');

INSERT INTO schema_migrations (version) VALUES ('20120221215316');