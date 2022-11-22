.PHONY: all main p7 pfa clean clean_main clean_p7 clean_pfa dev

HUGO_ENV:=production

all: main p7 pfa

main p7 pfa:
	hugo --minify --environment=$(HUGO_ENV) --source=$@

clean: clean_main clean_p7 clean_pfa

clean_main clean_p7 clean_pfa:
	rm -rf $(subst clean_,,$@)/public

dev:
	npx run-pty % \
		npx netlify-cms-proxy-server % \
		hugo server --port=1313 --source=main % \
		hugo server --port=1314 --source=p7 % \
		hugo server --port=1315 --source=pfa
