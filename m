Return-Path: <SRS0=0ztn=2W=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A5D4C2D0DE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jan 2020 22:26:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE3E820842
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jan 2020 22:26:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CU2NII8F"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE3E820842
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A2FC88573E;
	Wed,  1 Jan 2020 22:26:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XBzDNTWdDAHa; Wed,  1 Jan 2020 22:26:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0882581AEF;
	Wed,  1 Jan 2020 22:26:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC800C18DC;
	Wed,  1 Jan 2020 22:26:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3FBB9C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2E7EC204E6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sEeH5Bh-iqFW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by silver.osuosl.org (Postfix) with ESMTPS id 4D42B204DD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:42 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id x17so17125043pln.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jan 2020 14:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uR3f0Y5+qpw7GzuSpDtOazUC6VJQJeKwTwbFDTwTBCA=;
 b=CU2NII8FZa30KDpLnt4mEcuPIpi6mpwLeoCKYIBiXi3+iSRhIei0bSqwbxV2qYZfed
 sc41uaPx22YpIt0MXVb6aK3b6qAIZfGojA4YfXCs3BgYffpDkz2kmqgUe0UqezAOHkHg
 MU1JwErrD1K7so4R11sRKdfDO4ZGk3XH1HLONH33gt/fRagYhkiPI9toEJ3HMb59ne56
 AFeGX0D8lDfgFY/x6LabxN6rdoUERq4w97MBYmUn5Sl4F0V5JgCLfpzCg0+6YGwDIXyT
 b2Dfl8ADA1G/nQtR0arOzR1QRTWAt514tmhNLPqjCMwUbhyOdbaklG0GpWZt8znPOMLQ
 O69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uR3f0Y5+qpw7GzuSpDtOazUC6VJQJeKwTwbFDTwTBCA=;
 b=I+8jP94K08t+Yih0y63aoPFr8YyFhrMwGxlVm8S2VD/ijXk6+o3UjebLm68C6jF8+M
 RTJ5qdtc6cJYuo172yZtAqiscljUNhexDG9DaYjdnms5PmHOwbZmaWH2TQ3bOj9Kwy5K
 1yDgH5bw0RAqrTOaPUZKVMB4Zj0uIv1nCef3452YqPHAQnpeVJnQI3V19UmNDo/uqGHq
 xdupzjPfTTWI8yzlgjazALfYIjEH0p652bovdzX1GSDzwAZS4ohQ2snF+c/eHyZU5x1I
 oD5ZM76Ml8FO/rgoeLuJZcK33eTybXNruogs1/kqkwb169uLCcaxqa3qeQbGEGsR0PaU
 eHKQ==
X-Gm-Message-State: APjAAAVXctQv+sW5em+BqKKFRSJ+jpPHLXLonViaZ9jBoFdIdsN5DbhU
 RrxIMm/JUmKD0A991GXnODo=
X-Google-Smtp-Source: APXvYqzFV5/vapp2l/MuTd3YII852BC68hlAN9vrJVp1+3M/ConLSkSObBsC6TtqYoyx7U9b049mRw==
X-Received: by 2002:a17:90a:1992:: with SMTP id
 18mr16205859pji.46.1577917601778; 
 Wed, 01 Jan 2020 14:26:41 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id o2sm8601008pjo.26.2020.01.01.14.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 14:26:40 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+samsung@kernel.org,
	corbet@lwn.net
Date: Wed,  1 Jan 2020 19:26:12 -0300
Message-Id: <0173f92fceb3648b1840d4a8d29d29191bf473a3.1577917076.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577917076.git.dwlsalmeida@gmail.com>
References: <cover.1577917076.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3 5/8] Documentation: nfs: idmapper:
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
index c73ba9c16b77..c90fd5ebc640 100644
--- a/Documentation/admin-guide/nfs/index.rst
+++ b/Documentation/admin-guide/nfs/index.rst
@@ -9,4 +9,5 @@ NFS
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
