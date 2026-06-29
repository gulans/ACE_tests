
#exciting=/home/andris/exciting-neon/ace/exciting-reference/bin/exciting_smp
#exciting=/home/andris/exciting-sodium/ace-merge/exciting/build/src/exciting_smp
exciting=/home/andris/exciting-neon/ace/atomiczora/exciting/bin/exciting_smp
pbe0dirlist=cbn-pbe0-fast cbn-pbe0-slow
hsedirlist=cbn-hse-pw-fast cbn-hse-pw-slow cbn-hse-yukawa-fast cbn-hse-yukawa-slow cbn-hse-tryukawa-fast cbn-hse-tryukawa-slow


test::pbe0 hse summary

clean::
	rm -f */*OUT */*dat */atoms.xml */info.xml */info.xml */output */eigval.xml */geometry.xml */evalcore.xml */report.xml

pbe0::$(pbe0dirlist)


cbn-pbe0-fast::
	cd cbn-pbe0-fast; rm -f eigval.xml; touch eigval.xml; $(exciting) 1> output; cd ../..
	cd cbn-pbe0-fast; xsltproc report.xsl report.xsl 1> report.xml 2>/dev/null; cd ../..

cbn-pbe0-slow::
	cd cbn-pbe0-slow; rm -f eigval.xml; $(exciting) 1> output; cd ../..
	cd cbn-pbe0-slow; xsltproc report.xsl report.xsl 1> report.xml 2>/dev/null; cd ../..


hse::$(hsedirlist)

cbn-hse-pw-fast::
	cd cbn-hse-pw-fast; rm -f eigval.xml; touch eigval.xml; $(exciting) 1> output; cd ../..
	cd cbn-hse-pw-fast; xsltproc report.xsl report.xsl 1> report.xml 2>/dev/null; cd ../..

cbn-hse-pw-slow::
	cd cbn-hse-pw-slow; rm -f eigval.xml; $(exciting) 1> output; cd ../..
	cd cbn-hse-pw-slow; xsltproc report.xsl report.xsl 1> report.xml 2>/dev/null; cd ../..

cbn-hse-yukawa-fast::
	cd cbn-hse-yukawa-fast; rm -f eigval.xml; touch eigval.xml; $(exciting) 1> output; cd ../..
	cd cbn-hse-yukawa-fast; xsltproc report.xsl report.xsl 1> report.xml 2>/dev/null; cd ../..

cbn-hse-yukawa-slow::
	cd cbn-hse-yukawa-slow; rm -f eigval.xml; $(exciting) 1> output; cd ../..
	cd cbn-hse-yukawa-slow; xsltproc report.xsl report.xsl 1> report.xml 2>/dev/null; cd ../..

cbn-hse-tryukawa-fast::
	cd cbn-hse-tryukawa-fast; rm -f eigval.xml; touch eigval.xml; $(exciting) 1> output; cd ../..
	cd cbn-hse-tryukawa-fast; xsltproc report.xsl report.xsl 1> report.xml 2>/dev/null; cd ../..

cbn-hse-tryukawa-slow::
	cd cbn-hse-tryukawa-slow; rm -f eigval.xml; $(exciting) 1> output; cd ../..
	cd cbn-hse-tryukawa-slow; xsltproc report.xsl report.xsl 1> report.xml 2>/dev/null; cd ../..


summary::
	rm reports.xml
	xsltproc collect.xsl dirlist.xml >reports.xml
	xsltproc summary.xsl reports.xml

