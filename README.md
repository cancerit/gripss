#  GRIPSS Dockerfile

Container for the GRIPSS filtering tool for filtering GRIDSS resutls

See https://github.com/hartwigmedical/hmftools/tree/master/gripss

```
Usage :

docker run -v /path/to:/path/to DOCKER-IMAGE \
   java -Xms4G -Xmx16G com.hartwig.hmftools.gripss.GripssApplicationKt \
   -tumor SAMPLE_T \
   -reference SAMPLE_N \
   -ref_genome /path/to/Homo_sapiens_assembly.fasta \
   -breakend_pon /path/to/gridss_pon_single_breakend.bed \
   -breakpoint_pon /path/to/gridss_pon_breakpoint.bedpe \
   -breakpoint_hotspot /path/to/KnownFusionPairs.bedpe \
   -input_vcf /path/to/SAMPLE_T.gridss.unfiltered.vcf.gz \
   -output_vcf /path/to/SAMPLE_T.gridss.somatic.vcf.gz 
   
  
docker run -v /path/to:/path/to DOCKER-IMAGE \
   java -Xms4G -Xmx16G com.hartwig.hmftools.gripss.GripssHardFilterApplicationKt \
   -input_vcf /path/to/SAMPLE_T.gridss.somatic.vcf.gz \
   -output_vcf /path/to/SAMPLE_T.gridss.somatic.filtered.vcf.gz
```
Notes: breakend_pon, breakpoint_pon and breakpoint_hotspot can be dowloaded from 
https://resources.hartwigmedicalfoundation.nl/  (HMFTools-Resources > GRIDSS & HMFTools-Resources > Known-Fusions)

reference requires 3 files : fasta, index (.fai) and SAM header contigs (.dict)
