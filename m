Return-Path: <SRS0=To5p=2Q=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E289C2D0C0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Dec 2019 21:20:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 442092080D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 26 Dec 2019 21:20:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e62A4buC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 442092080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F401086F88;
	Thu, 26 Dec 2019 21:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MS7Y7zslb6d4; Thu, 26 Dec 2019 21:20:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8684286EB1;
	Thu, 26 Dec 2019 21:20:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79843C1797;
	Thu, 26 Dec 2019 21:20:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C085AC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Dec 2019 21:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A079286EB1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Dec 2019 21:20:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XgfwSmeKw1Hv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Dec 2019 21:20:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9333286D51
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Dec 2019 21:20:01 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id z16so13763303pfk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Dec 2019 13:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dY9unxVIr1tFCym7yEPAegK01Wyg01REeRtJSgLyB00=;
 b=e62A4buCJwDHSPVeiCSxDlpKyfiiED9P87mPFxNntgvFW7UAX/wkYEkGSOSDXq5CYM
 nlHyReskbdm/Ky5tuM7JfWK9mmR/ux863AZobyvpsQ7K4v/K/SDl0YOYXeix1SHq3Mpz
 0Bf7NpLKggNvBXVqlvBsM4I36W9y2+DrBs/OZ2/b8wjCcs6p/y4F2/zXs4jQJFLiku0m
 ueXq1flKOPw3CNZUiHWwS9azyYbLvw3lDJ8r2eA9gEC+tq5O9yuj0DlPe6F/l0VMupdt
 4H7BB+JRDksC9ZUGv9nUrgOaBEYsD3ROYN1UTv+pyE1mPKk99k5Y8J0/T1dLAr1ayJvu
 pzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dY9unxVIr1tFCym7yEPAegK01Wyg01REeRtJSgLyB00=;
 b=s4VHkYTonSj9+TcnB7leMu91BBFiVwvFScIcmwU0k+7ICfrppOyilrSxh3v8DNaNKB
 VoBOxGJjDWyBB6xV4J+AGpfPCnPGf+SpbiIZNHJB6p5GillET/7ooM+dslPNOdOjPOI7
 LntBvl/HfibtPWnrBH2NZcNok6O2crJVQVnyl70hLZqVV0NyWQzi4cvK1oNIuYr2Huyn
 10tpGTLS3V6PTX2LhYXk77nuiOFZzfoLvpQxYepBXF6aECSNMv+zNPmq58X+elA1Vb3B
 DpG9fuqXeYIc8xkzamycezVOWel4b/sdk8ILmRVtIeCnN4WhR1B1aNMUgAGXnSRDig0+
 si/A==
X-Gm-Message-State: APjAAAXy13cPcW2nYGlq6RLR3bDhOABxFzOa7Y921GmBsQLTGLF1X/3n
 Wag0wLN9O9B4yC4VbvA1fbc=
X-Google-Smtp-Source: APXvYqw2R+rwkvIyso94ZmcED55KP1/KUKsBv96avH2fhB1Pdu8PT26eTzifpdiF6MmgHWXBCCnfNw==
X-Received: by 2002:a63:1c64:: with SMTP id c36mr45435120pgm.302.1577395200912; 
 Thu, 26 Dec 2019 13:20:00 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id b22sm35114380pft.110.2019.12.26.13.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Dec 2019 13:20:00 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Thu, 26 Dec 2019 18:19:43 -0300
Message-Id: <ddeb8a98f4c5c24df2f36e1ce1cc5ab4da6442a1.1577394517.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577394517.git.dwlsalmeida@gmail.com>
References: <cover.1577394517.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 1/5] Documentation: convert nfs.txt
	to ReST
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

This patch converts nfs.txt to RST. It also moves it to admin-guide.
The reason for moving it is because this document contains information
useful for system administrators, as noted on the following paragraph:

'The purpose of this document is to provide information on some of the
special features of the NFS client that can be configured by system
administrators'.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/admin-guide/index.rst           |  1 +
 Documentation/admin-guide/nfs/index.rst       |  9 ++
 .../nfs/nfs-client.rst}                       | 91 ++++++++++---------
 3 files changed, 58 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/admin-guide/nfs/index.rst
 rename Documentation/{filesystems/nfs/nfs.txt => admin-guide/nfs/nfs-client.rst} (72%)

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index 4405b7485312..4433f3929481 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -76,6 +76,7 @@ configure specific aspects of kernel behavior to your liking.
    device-mapper/index
    efi-stub
    ext4
+   nfs/index
    gpio/index
    highuid
    hw_random
diff --git a/Documentation/admin-guide/nfs/index.rst b/Documentation/admin-guide/nfs/index.rst
new file mode 100644
index 000000000000..f5c0180f4e5e
--- /dev/null
+++ b/Documentation/admin-guide/nfs/index.rst
@@ -0,0 +1,9 @@
+=============
+NFS
+=============
+
+.. toctree::
+    :maxdepth: 1
+
+    nfs-client
+
diff --git a/Documentation/filesystems/nfs/nfs.txt b/Documentation/admin-guide/nfs/nfs-client.rst
similarity index 72%
rename from Documentation/filesystems/nfs/nfs.txt
rename to Documentation/admin-guide/nfs/nfs-client.rst
index f2571c8bef74..f01bf6a6c207 100644
--- a/Documentation/filesystems/nfs/nfs.txt
+++ b/Documentation/admin-guide/nfs/nfs-client.rst
@@ -1,3 +1,6 @@
+==========
+NFS Client
+==========
 
 The NFS client
 ==============
@@ -59,10 +62,11 @@ The DNS resolver
 
 NFSv4 allows for one server to refer the NFS client to data that has been
 migrated onto another server by means of the special "fs_locations"
-attribute. See
-	http://tools.ietf.org/html/rfc3530#section-6
-and
-	http://tools.ietf.org/html/draft-ietf-nfsv4-referrals-00
+attribute. See `RFC3530 Section 6: Filesystem Migration and Replication`_ and
+`Implementation Guide for Referrals in NFSv4`_.
+
+.. _RFC3530 Section 6\: Filesystem Migration and Replication: http://tools.ietf.org/html/rfc3530#section-6
+.. _Implementation Guide for Referrals in NFSv4: http://tools.ietf.org/html/draft-ietf-nfsv4-referrals-00
 
 The fs_locations information can take the form of either an ip address and
 a path, or a DNS hostname and a path. The latter requires the NFS client to
@@ -72,16 +76,16 @@ upcall to allow userland to provide this service.
 Assuming that the user has the 'rpc_pipefs' filesystem mounted in the usual
 /var/lib/nfs/rpc_pipefs, the upcall consists of the following steps:
 
-   (1) The process checks the dns_resolve cache to see if it contains a
+   #.  The process checks the dns_resolve cache to see if it contains a
        valid entry. If so, it returns that entry and exits.
 
-   (2) If no valid entry exists, the helper script '/sbin/nfs_cache_getent'
+   #.  If no valid entry exists, the helper script '/sbin/nfs_cache_getent'
        (may be changed using the 'nfs.cache_getent' kernel boot parameter)
        is run, with two arguments:
-		- the cache name, "dns_resolve"
-		- the hostname to resolve
+       - the cache name, "dns_resolve"
+       - the hostname to resolve
 
-   (3) After looking up the corresponding ip address, the helper script
+   #.  After looking up the corresponding ip address, the helper script
        writes the result into the rpc_pipefs pseudo-file
        '/var/lib/nfs/rpc_pipefs/cache/dns_resolve/channel'
        in the following (text) format:
@@ -94,43 +98,44 @@ Assuming that the user has the 'rpc_pipefs' filesystem mounted in the usual
        script, and <ttl> is the 'time to live' of this cache entry (in
        units of seconds).
 
-       Note: If <ip address> is invalid, say the string "0", then a negative
-       entry is created, which will cause the kernel to treat the hostname
-       as having no valid DNS translation.
+       .. note::
+            If <ip address> is invalid, say the string "0", then a negative
+            entry is created, which will cause the kernel to treat the hostname
+            as having no valid DNS translation.
 
 
 
 
 A basic sample /sbin/nfs_cache_getent
 =====================================
-
-#!/bin/bash
-#
-ttl=600
-#
-cut=/usr/bin/cut
-getent=/usr/bin/getent
-rpc_pipefs=/var/lib/nfs/rpc_pipefs
-#
-die()
-{
-	echo "Usage: $0 cache_name entry_name"
-	exit 1
-}
-
-[ $# -lt 2 ] && die
-cachename="$1"
-cache_path=${rpc_pipefs}/cache/${cachename}/channel
-
-case "${cachename}" in
-	dns_resolve)
-		name="$2"
-		result="$(${getent} hosts ${name} | ${cut} -f1 -d\ )"
-		[ -z "${result}" ] && result="0"
-		;;
-	*)
-		die
-		;;
-esac
-echo "${result} ${name} ${ttl}" >${cache_path}
-
+.. code-block:: sh
+
+    #!/bin/bash
+    #
+    ttl=600
+    #
+    cut=/usr/bin/cut
+    getent=/usr/bin/getent
+    rpc_pipefs=/var/lib/nfs/rpc_pipefs
+    #
+    die()
+    {
+        echo "Usage: $0 cache_name entry_name"
+        exit 1
+    }
+
+    [ $# -lt 2 ] && die
+    cachename="$1"
+    cache_path=${rpc_pipefs}/cache/${cachename}/channel
+
+    case "${cachename}" in
+        dns_resolve)
+            name="$2"
+            result="$(${getent} hosts ${name} | ${cut} -f1 -d\ )"
+            [ -z "${result}" ] && result="0"
+            ;;
+        *)
+            die
+            ;;
+    esac
+    echo "${result} ${name} ${ttl}" >${cache_path}
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
