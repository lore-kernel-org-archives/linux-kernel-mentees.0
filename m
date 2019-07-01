From: sanjana99reddy99 at gmail.com (Sanjana Sanikommu)
Date: Mon,  1 Jul 2019 20:29:14 +0530
Subject: [Linux-kernel-mentees] [PATCH v2] Documentation: networking: Fix
	the title underline
Message-ID: <20190701145914.7731-1-sanjana99reddy99@gmail.com>
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>

WARNING: Title underline too short.

Signed-off-by: Sanjana Sanikommu <sanjana99reddy99 at gmail.com>
---
Changes in v2:
Fix the patch number 
Documentation/networking/snmp_counter.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/snmp_counter.rst b/Documentation/networking/snmp_counter.rst
index 52b026be028f..679b1a7654b0 100644
--- a/Documentation/networking/snmp_counter.rst
+++ b/Documentation/networking/snmp_counter.rst
@@ -719,7 +719,7 @@ will be updated. If the undo_marker is set, TcpExtTCPDSACKIgnoredOld
 will be updated. As implied in its name, it might be an old packet.
 
 SACK shift
-=========
+==========
 The linux networking stack stores data in sk_buff struct (skb for
 short). If a SACK block acrosses multiple skb, the TCP stack will try
 to re-arrange data in these skb. E.g. if a SACK block acknowledges seq
-- 
2.17.1
