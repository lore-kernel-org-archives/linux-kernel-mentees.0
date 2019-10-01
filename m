From: dwlsalmeida at gmail.com (Daniel W. S. Almeida)
Date: Mon, 30 Sep 2019 22:03:44 -0300
Subject: [Linux-kernel-mentees] [PATCH] Documentation: perf: fix kernel-doc
	warnings in imx-ddr.rst
Message-ID: <20191001010344.278234-1-dwlsalmeida@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

From: "Daniel W. S. Almeida" <dwlsalmeida at gmail.com>

Unexpected indentation errors were reported due to missing blank lines.
Now fixed. No change in content otherwise.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida at gmail.com>
---
 Documentation/admin-guide/perf/imx-ddr.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/perf/imx-ddr.rst b/Documentation/admin-guide/perf/imx-ddr.rst
index 517a205abad6..75c8b46ba6f9 100644
--- a/Documentation/admin-guide/perf/imx-ddr.rst
+++ b/Documentation/admin-guide/perf/imx-ddr.rst
@@ -18,6 +18,7 @@ The "format" directory describes format of the config (event ID) and config1
 devices/imx8_ddr0/format/. The "events" directory describes the events types
 hardware supported that can be used with perf tool, see /sys/bus/event_source/
 devices/imx8_ddr0/events/.
+
   e.g.::
         perf stat -a -e imx8_ddr0/cycles/ cmd
         perf stat -a -e imx8_ddr0/read/,imx8_ddr0/write/ cmd
@@ -31,16 +32,19 @@ in the driver.
   Filter is defined with two configuration parts:
   --AXI_ID defines AxID matching value.
   --AXI_MASKING defines which bits of AxID are meaningful for the matching.
+
         0?corresponding bit is masked.
         1: corresponding bit is not masked, i.e. used to do the matching.
 
   AXI_ID and AXI_MASKING are mapped on DPCR1 register in performance counter.
   When non-masked bits are matching corresponding AXI_ID bits then counter is
   incremented. Perf counter is incremented if
+
           AxID && AXI_MASKING == AXI_ID && AXI_MASKING
 
   This filter doesn't support filter different AXI ID for axid-read and axid-write
   event at the same time as this filter is shared between counters.
+
   e.g.::
         perf stat -a -e imx8_ddr0/axid-read,axi_mask=0xMMMM,axi_id=0xDDDD/ cmd
         perf stat -a -e imx8_ddr0/axid-write,axi_mask=0xMMMM,axi_id=0xDDDD/ cmd
@@ -48,5 +52,6 @@ in the driver.
   NOTE: axi_mask is inverted in userspace(i.e. set bits are bits to mask), and
   it will be reverted in driver automatically. so that the user can just specify
   axi_id to monitor a specific id, rather than having to specify axi_mask.
+
   e.g.::
         perf stat -a -e imx8_ddr0/axid-read,axi_id=0x12/ cmd, which will monitor ARID=0x12
-- 
2.23.0
