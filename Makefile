# WTF, you can process templates in an GNU Makefile!

# USED for ###DIR### substitutions
TEMPLATE_DIR_FOR_SED=$(subst /,\/,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

# USED for ###USER### substitutions
TEMPLATE_USER_FOR_SED=$(shell id -un)

TARGETS=setup.sh run.sh named.conf

all: $(TARGETS)

named.conf: named.conf.template
	cp $< $@ 
	sed -i 's/###DIR###/$(TEMPLATE_DIR_FOR_SED)/g;s/###USER###/$(TEMPLATE_USER_FOR_SED)/g' $@

setup.sh: setup.sh.template
	cp $< $@ 
	sed -i 's/###DIR###/$(TEMPLATE_DIR_FOR_SED)/g;s/###USER###/$(TEMPLATE_USER_FOR_SED)/g' $@
	chmod +x $@

run.sh: run.sh.template
	cp $< $@ 
	sed -i 's/###DIR###/$(TEMPLATE_DIR_FOR_SED)/g;s/###USER###/$(TEMPLATE_USER_FOR_SED)/g' $@
	chmod +x $@

.PHONY: clean
clean:
	rm $(TARGETS)
