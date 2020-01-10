Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE55EC33CA4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 23:25:07 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93FCC20842
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 23:25:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1a9qXEt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93FCC20842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7796D86C4B;
	Fri, 10 Jan 2020 23:25:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BBCAhtGa4_C9; Fri, 10 Jan 2020 23:25:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F29D686B51;
	Fri, 10 Jan 2020 23:25:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EFE81C1D7D;
	Fri, 10 Jan 2020 23:25:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4411AC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 326E620430
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3ssF44OXraEC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by silver.osuosl.org (Postfix) with ESMTPS id 45621228CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 23:25:05 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id x1so1593890qvr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 15:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H+ZY7mgwtaDq8KuNs5XppAH1no6Df53vnlu2/x+Z9PQ=;
 b=G1a9qXEtwVi0udBWdjEfIDOV+7+LYNi0HI0nlET9Jda6nxu0OPAgHaKpT8IGNYRMRp
 DaZBguNfKF0TzKGDD0xJSFxWX4yYtde/CqbTidE4nRuZClnxdOE4+J5gTkRSdLJMpgsi
 YGmtcO08AW5JJDzB2ixBmrWl30pQ3FeuzJuBmtiVxgbKrh0w+P6IKx0+a2wWNc7/117d
 ti3dU73JBXdXQnOMqpvwojeUXRJgjgzNIhpbxUfxYpiy/1wlc0RG45WvnwOteEdHEwhk
 K/10fv2BtfBmvuPFAOcXO3cjAYmWImsFsPlZedkOGIz4qKtQJjmkqe7iAUw3QdQOz2Wq
 aylA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H+ZY7mgwtaDq8KuNs5XppAH1no6Df53vnlu2/x+Z9PQ=;
 b=VmLE2XJS06Y7CeB9TwR1DStqnfzvpAx3gOSp0ft/a3GOCiUxkEZNTjb7KjNM2/Hkg6
 jaDk3OXTynKC6ts6ivSlqY8oHAzFndG3kiodm2arXCAZCH2A/xFoUheGTfij0so2EEP/
 eVA4JsybReU/SEPcZsVv4oJSmPCfn8Ty0pQdrZ/rUjW7fi9NbeT4HFxaC6/Zp8gy/3C/
 AeGhIK3mpuxd/LRi6oaigzKirkIBhxuHlkQ6hz+npUHmLfTG/4h+JOWWQm7kFh9C8Dba
 3rKRu56J6BODu5UtgX9UniK+K2wO+FzN768VXEMAdDRiH/kT+RPKyy/9+BXp+jGBcpzC
 Gq3Q==
X-Gm-Message-State: APjAAAUDG9eyeF502jn9H5f4uYkxF1vQ0nwTgozpdXaU7Q4MDJEZGejP
 x3EkWT3ZOAAikT7MMhLTNrY=
X-Google-Smtp-Source: APXvYqywaxv/4W61MsXR0lXk/r/G7UGTH2VvMTlVbJLSlyaH9W7LZanEPioETxq8v7L7Q7M6jDGsYg==
X-Received: by 2002:a0c:a998:: with SMTP id a24mr1145404qvb.11.1578698704116; 
 Fri, 10 Jan 2020 15:25:04 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id i2sm1774752qte.87.2020.01.10.15.25.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 15:25:03 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+samsung@kernel.org,
	corbet@lwn.net
Date: Fri, 10 Jan 2020 20:24:28 -0300
Message-Id: <069e40cd551ea778538f8fe9ad15ee26e45fc748.1578697871.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1578697871.git.dwlsalmeida@gmail.com>
References: <cover.1578697871.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v4 6/9] Documentation: nfs: idmapper:
	convert to ReST
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

Convert idmapper.txt to ReST and move it to admin-guide.
Content remains mostly unchanged otherwise.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/admin-guide/nfs/index.rst       |  1 +
 .../nfs/nfs-idmapper.rst}                     | 31 ++++++++++---------
 2 files changed, 18 insertions(+), 14 deletions(-)
 rename Documentation/{filesystems/nfs/idmapper.txt => admin-guide/nfs/nfs-idmapper.rst} (81%)

diff --git a/Documentation/admin-guide/nfs/index.rst b/Documentation/admin-guide/nfs/index.rst
index e0b2f4260ad7..8376d5225fc2 100644
--- a/Documentation/admin-guide/nfs/index.rst
+++ b/Documentation/admin-guide/nfs/index.rst
@@ -9,3 +9,4 @@ NFS
     nfsroot
     nfs-rdma
     nfsd-admin-interfaces
+    nfs-idmapper
diff --git a/Documentation/filesystems/nfs/idmapper.txt b/Documentation/admin-guide/nfs/nfs-idmapper.rst
similarity index 81%
rename from Documentation/filesystems/nfs/idmapper.txt
rename to Documentation/admin-guide/nfs/nfs-idmapper.rst
index b86831acd583..58b8e63412d5 100644
--- a/Documentation/filesystems/nfs/idmapper.txt
+++ b/Documentation/admin-guide/nfs/nfs-idmapper.rst
@@ -1,7 +1,7 @@
+=============
+NFS ID Mapper
+=============
 
-=========
-ID Mapper
-=========
 Id mapper is used by NFS to translate user and group ids into names, and to
 translate user and group names into ids.  Part of this translation involves
 performing an upcall to userspace to request the information.  There are two
@@ -20,22 +20,24 @@ legacy rpc.idmap daemon for the id mapping.  This result will be stored
 in a custom NFS idmap cache.
 
 
-===========
 Configuring
 ===========
+
 The file /etc/request-key.conf will need to be modified so /sbin/request-key can
 direct the upcall.  The following line should be added:
 
-#OP	TYPE	DESCRIPTION	CALLOUT INFO	PROGRAM ARG1 ARG2 ARG3 ...
-#======	=======	===============	===============	===============================
-create	id_resolver	*	*		/usr/sbin/nfs.idmap %k %d 600
+``#OP	TYPE	DESCRIPTION	CALLOUT INFO	PROGRAM ARG1 ARG2 ARG3 ...``
+``#======	=======	===============	===============	===============================``
+``create	id_resolver	*	*		/usr/sbin/nfs.idmap %k %d 600``
+
 
 This will direct all id_resolver requests to the program /usr/sbin/nfs.idmap.
 The last parameter, 600, defines how many seconds into the future the key will
 expire.  This parameter is optional for /usr/sbin/nfs.idmap.  When the timeout
 is not specified, nfs.idmap will default to 600 seconds.
 
-id mapper uses for key descriptions:
+id mapper uses for key descriptions::
+
 	  uid:  Find the UID for the given user
 	  gid:  Find the GID for the given group
 	 user:  Find the user  name for the given UID
@@ -45,23 +47,24 @@ You can handle any of these individually, rather than using the generic upcall
 program.  If you would like to use your own program for a uid lookup then you
 would edit your request-key.conf so it look similar to this:
 
-#OP	TYPE	DESCRIPTION	CALLOUT INFO	PROGRAM ARG1 ARG2 ARG3 ...
-#======	=======	===============	===============	===============================
-create	id_resolver	uid:*	*		/some/other/program %k %d 600
-create	id_resolver	*	*		/usr/sbin/nfs.idmap %k %d 600
+``#OP	TYPE	DESCRIPTION	CALLOUT INFO	PROGRAM ARG1 ARG2 ARG3 ...``
+``#======	=======	===============	===============	===============================``
+``create	id_resolver	uid:*	*		/some/other/program %k %d 600``
+``create	id_resolver	*	*		/usr/sbin/nfs.idmap %k %d 600``
+
 
 Notice that the new line was added above the line for the generic program.
 request-key will find the first matching line and corresponding program.  In
 this case, /some/other/program will handle all uid lookups and
 /usr/sbin/nfs.idmap will handle gid, user, and group lookups.
 
-See <file:Documentation/security/keys/request-key.rst> for more information
+See Documentation/security/keys/request-key.rst for more information
 about the request-key function.
 
 
-=========
 nfs.idmap
 =========
+
 nfs.idmap is designed to be called by request-key, and should not be run "by
 hand".  This program takes two arguments, a serialized key and a key
 description.  The serialized key is first converted into a key_serial_t, and
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
