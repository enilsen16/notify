# Notifier

This repo is an example of Postgres's NOTIFY/LISTEN API


## Example Notify SQL Query
```
CREATE FUNCTION table_update_notify() RETURNS trigger AS $$
DECLARE
  id bigint;
BEGIN
  IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
    id = NEW.id;
  ELSE
    id = OLD.id;
  END IF;
  PERFORM pg_notify('virtual', row_to_json(NEW)::text);
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP FUNCTION table_update_notify();

DROP TRIGGER notifier_notify_update ON name;
CREATE TRIGGER notifier_notify_update AFTER UPDATE ON name FOR EACH ROW EXECUTE PROCEDURE table_update_notify();

DROP TRIGGER notifier_notify_insert ON name;
CREATE TRIGGER notifier_notify_insert AFTER INSERT ON name FOR EACH ROW EXECUTE PROCEDURE table_update_notify();
```

## TODO
- [X] Create Schema
- [X] Generate migration
- [X] Seed Fake Data
- [X] Automatically delete all content in table and seed agian
- [X] Set up Genserver for randomly seeding data
- [X] Add Notify Query to table
- [X] Use the Postgres Listen repo to track changes
- [X] When data is saved print to console

