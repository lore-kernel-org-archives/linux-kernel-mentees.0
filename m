Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E00C33CA4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 23:24:54 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7373020842
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 23:24:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tnsf3rM5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7373020842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5673488547;
	Fri, 10 Jan 2020 23:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LaHli4R13+tk; Fri, 10 Jan 2020 23:24:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 405E387E43;
	Fri, 10 Jan 2020 23:24:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29D17C1D7D;
	Fri, 10 Jan 2020 23:24:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5DA9C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E1D4085D21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:24:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id htWWG11AD8bt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:24:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 05FA585455
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:24:51 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id z76so3606217qka.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 15:24:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B/Bs5y9skVn7qhFr7vaQO82VK/Esx1PJZf7s2++9gUs=;
 b=tnsf3rM5zBYx1iWYjOE9yk6jJs8bY6kwgY8fkYIy4NaA5Db/Mn/PgaoJSCs3OsE+6E
 DDJLH2vTOWW2WiDxTQJlmROWXBebuFe9AbWaVU1c273K8X1L8SsINzlejOmEdqo3JEGR
 vblEsdpSZJf14iot/LiX1kVYkjPFPKQ5dLMIez/LjtW1fvbTylPR2nU8IzvjXSV9EhkJ
 iF4qrcHzZo9moAcGqTPo0q3F0DGn0+sOp4xLwONcfPBOLNh485zGCYY3g2N/gvi0Xg+U
 zH69h0fnjwB6DJPIBLUxfjN+EbL4OUNy/qFCZiRvzoIXGOuj988R97hpiNsu6tZ++Dyd
 23Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B/Bs5y9skVn7qhFr7vaQO82VK/Esx1PJZf7s2++9gUs=;
 b=D88h7ZiidGQGeUTk/nrUGZMNtHik3gvTeCXM+bv+qE5m4w7wmhO9zrqA+ndWegVgB7
 kaPunhv1h8+ExOQ6i6kVk5xG3kSELs2d0RC2pZfOQtZr3ZM9lXVAofK6VPoDcxsp5rdy
 TYWJ/MiAb7ekTdArrGAEDSnyZFt1qfswQq6ZDr3IVJptsEc5BYMG2A44KT3M5qWv6vS4
 dpY6AOv+K33BIOrBaaI20IQOdDwlDjnv8+foUyKh7MBhufHWCznH/B3MXhlOgftJzS+N
 t7Y3xOyl1a3cDCRtQjkhGrupsqS9z/AGW08tHqGW4LgdGokGN7h3HEYp9wDdq3JYcW4L
 YsHQ==
X-Gm-Message-State: APjAAAWAyV+/MgeahyiWib/R+RrAIuEr/tia9afHsuEBvmCJ4NGnV94G
 FvTRN4+tPtrG4ePYYQ4VqSQ=
X-Google-Smtp-Source: APXvYqxYZ3yBTe5JgfCUIsndf8VXehqQN5AI3u2abx3tqbRfrSLHhHDIBHXW0hyfYS9oWjt47gCyog==
X-Received: by 2002:a05:620a:1183:: with SMTP id
 b3mr5522668qkk.316.1578698689960; 
 Fri, 10 Jan 2020 15:24:49 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id i2sm1774752qte.87.2020.01.10.15.24.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 15:24:49 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+samsung@kernel.org,
	corbet@lwn.net
Date: Fri, 10 Jan 2020 20:24:23 -0300
Message-Id: <cb9f2da2f2f6dd432b4cf9e05f79f74f4d54b6ab.1578697871.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578697871.git.dwlsalmeida@gmail.com>
References: <cover.1578697871.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v4 1/9] Documentation: convert
	nfs.txt to ReST
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
 Documentation/admin-guide/nfs/index.rst       |  8 ++
 .../nfs/nfs-client.rst}                       | 85 ++++++++++---------
 3 files changed, 54 insertions(+), 40 deletions(-)
 create mode 100644 Documentation/admin-guide/nfs/index.rst
 rename Documentation/{filesystems/nfs/nfs.txt => admin-guide/nfs/nfs-client.rst} (75%)

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
index 000000000000..2fe77091c25c
--- /dev/null
+++ b/Documentation/admin-guide/nfs/index.rst
@@ -0,0 +1,8 @@
+=============
+NFS
+=============
+
+.. toctree::
+    :maxdepth: 1
+
+    nfs-client
diff --git a/Documentation/filesystems/nfs/nfs.txt b/Documentation/admin-guide/nfs/nfs-client.rst
similarity index 75%
rename from Documentation/filesystems/nfs/nfs.txt
rename to Documentation/admin-guide/nfs/nfs-client.rst
index f2571c8bef74..c4b777c7584b 100644
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
@@ -78,8 +82,8 @@ Assuming that the user has the 'rpc_pipefs' filesystem mounted in the usual
    (2) If no valid entry exists, the helper script '/sbin/nfs_cache_getent'
        (may be changed using the 'nfs.cache_getent' kernel boot parameter)
        is run, with two arguments:
-		- the cache name, "dns_resolve"
-		- the hostname to resolve
+       - the cache name, "dns_resolve"
+       - the hostname to resolve
 
    (3) After looking up the corresponding ip address, the helper script
        writes the result into the rpc_pipefs pseudo-file
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
