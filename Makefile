# push to web site

SRC = $(wildcard *.htm* *.css *.jpg *.gif *.png)

IP := 107.180.118.108
# old host 107.180.41.145, changed on jul 19 2024

USER := madnordski

WEBDIR := public_html

# implicit
%.html.get: %.html
	scp $(USER)@$(IP):$(WEBDIR)/$? .

%.html.put: %.html
	scp $? $(USER)@$(IP):$(WEBDIR)/

# explicit

lastupdate.txt: $(SRC)
	scp $? $(USER)@$(IP):$(WEBDIR)/
	touch $@
