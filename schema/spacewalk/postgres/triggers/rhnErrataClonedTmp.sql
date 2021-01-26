
create or replace function rhn_eclonedtmp_mod_trig_fun() returns trigger as
$$
begin
	new.modified := current_timestamp;
	return new;
end;
$$ language plpgsql;

create trigger
rhn_eclonedtmp_mod_trig
before insert or update on rhnErrataClonedTmp
for each row
execute procedure rhn_eclonedtmp_mod_trig_fun();