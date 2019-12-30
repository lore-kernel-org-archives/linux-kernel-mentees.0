Return-Path: <SRS0=vtN2=2U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D0F4C2D0C3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 05:05:12 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D830620748
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 05:05:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a4NIpEw5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D830620748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 99C6485EF2;
	Mon, 30 Dec 2019 05:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MTz4aWCOs7Ki; Mon, 30 Dec 2019 05:05:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9041886038;
	Mon, 30 Dec 2019 05:05:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6E4F3C18DC;
	Mon, 30 Dec 2019 05:05:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F8B6C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 220218464C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mgWIVRXqpTWK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:05:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7A2F0845DF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 05:05:06 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g6so11232535plp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Dec 2019 21:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dv0gPEJpw1DwGP6Ytsqpfok/vsNxEo1QlHlYHyDkSVE=;
 b=a4NIpEw5OUkiOZHEJ2p94OEkLOazuVzl39soh04GBzQn5THlohfN7fkk45af3qNk1E
 GaqMGmZSqpcPrkOx568+/BdoxnELySHHMjqyu/W0ADc0UtsA/UrGQfna62ZmRaQii1Ml
 g6IvebMp2ypmJpDIlyN4w6uXsFpxFO+Bq8f/BV3Pzrr1Afwt1iOCRm9G8eGDNlzKTTc7
 yRabqQA2YqswNFs1TAVcVizHlF5yzz9NtigY9ciVjV+wK+o6LkmBRvKTGslDZX/RaWCe
 /02p3gJVf7Wtf+/Ub7eBEjbbMawyjeoopDaLBJvOmJ6EG/WUdLkWWrM6YJdB/KVK0GHw
 480A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dv0gPEJpw1DwGP6Ytsqpfok/vsNxEo1QlHlYHyDkSVE=;
 b=fUSdk/OsD+aOUWUhwzrO/I7qWq7Z8MkpiC48IU4XSiobr9IehedJeBdLfhXg1v+91A
 pp2++o2qNz8sAKtdeaDoU00HgSZ7/GvD1dIGw7UO/sokO++llTlE/peBZaOKQe4ukvzR
 DXdsuX9wl4ISxoRCAz2qmIJHBMMxld7uGa93jnEbmVb3uvRItn2Yicy9A/WhJkRNQa64
 /bzO3WgUOIppfyPEN/i/rcvToASjWL6rzsm2P0tzr2oVwCt9hRw1iVDE93ZWJvSihNBx
 RgXm3Xi+o2TJSmq/ivA9W9MFLrrSq/Vi6Z0jVNqKpPB1J2Hoc8Z1ke7YxWBPsStjvkrx
 UCHA==
X-Gm-Message-State: APjAAAXsp6ua5f+SvZY+zUeydJVappVss8zSfFAZCgbtYubzGj55WV/J
 cGnFkgEm8wh7OkTkIKx7Bgo=
X-Google-Smtp-Source: APXvYqz2rR8K/u96NeXzLEGMjpcOl1Btke0JiXlwnlhxQvDuGm/X2pL990jkWRFSNwU0qnLnNB7NWw==
X-Received: by 2002:a17:902:d694:: with SMTP id
 v20mr26699724ply.127.1577682305975; 
 Sun, 29 Dec 2019 21:05:05 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id r2sm45054727pgv.16.2019.12.29.21.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 21:05:05 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Mon, 30 Dec 2019 02:04:45 -0300
Message-Id: <a86269bc495edfc827e7c80ffe038f410315f028.1577681894.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577681894.git.dwlsalmeida@gmail.com>
References: <cover.1577681894.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 3/5] Documentation: nfs:
	rpc-server-gss: convert to ReST
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

Convert rpc-server-gss.txt to ReST. Content remains mostly unchanged.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/filesystems/nfs/index.rst       |  1 +
 ...{rpc-server-gss.txt => rpc-server-gss.rst} | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 8 deletions(-)
 rename Documentation/filesystems/nfs/{rpc-server-gss.txt => rpc-server-gss.rst} (92%)

diff --git a/Documentation/filesystems/nfs/index.rst b/Documentation/filesystems/nfs/index.rst
index 52f4956e7770..9d5365cbe2c3 100644
--- a/Documentation/filesystems/nfs/index.rst
+++ b/Documentation/filesystems/nfs/index.rst
@@ -8,3 +8,4 @@ NFS
 
    pnfs
    rpc-cache
+   rpc-server-gss
diff --git a/Documentation/filesystems/nfs/rpc-server-gss.txt b/Documentation/filesystems/nfs/rpc-server-gss.rst
similarity index 92%
rename from Documentation/filesystems/nfs/rpc-server-gss.txt
rename to Documentation/filesystems/nfs/rpc-server-gss.rst
index 310bbbaf9080..812754576845 100644
--- a/Documentation/filesystems/nfs/rpc-server-gss.txt
+++ b/Documentation/filesystems/nfs/rpc-server-gss.rst
@@ -1,4 +1,4 @@
-
+=========================================
 rpcsec_gss support for kernel RPC servers
 =========================================
 
@@ -9,14 +9,17 @@ NFSv4.1 and higher don't require the client to act as a server for the
 purposes of authentication.)
 
 RPCGSS is specified in a few IETF documents:
+
  - RFC2203 v1: http://tools.ietf.org/rfc/rfc2203.txt
  - RFC5403 v2: http://tools.ietf.org/rfc/rfc5403.txt
+
 and there is a 3rd version  being proposed:
+
  - http://tools.ietf.org/id/draft-williams-rpcsecgssv3.txt
    (At draft n. 02 at the time of writing)
 
 Background
-----------
+==========
 
 The RPCGSS Authentication method describes a way to perform GSSAPI
 Authentication for NFS.  Although GSSAPI is itself completely mechanism
@@ -29,6 +32,7 @@ depends on GSSAPI extensions that are KRB5 specific.
 GSSAPI is a complex library, and implementing it completely in kernel is
 unwarranted. However GSSAPI operations are fundementally separable in 2
 parts:
+
 - initial context establishment
 - integrity/privacy protection (signing and encrypting of individual
   packets)
@@ -41,7 +45,7 @@ kernel, but leave the initial context establishment to userspace.  We
 need upcalls to request userspace to perform context establishment.
 
 NFS Server Legacy Upcall Mechanism
-----------------------------------
+==================================
 
 The classic upcall mechanism uses a custom text based upcall mechanism
 to talk to a custom daemon called rpc.svcgssd that is provide by the
@@ -62,21 +66,20 @@ groups) due to limitation on the size of the buffer that can be send
 back to the kernel (4KiB).
 
 NFS Server New RPC Upcall Mechanism
------------------------------------
+===================================
 
 The newer upcall mechanism uses RPC over a unix socket to a daemon
 called gss-proxy, implemented by a userspace program called Gssproxy.
 
-The gss_proxy RPC protocol is currently documented here:
-
-	https://fedorahosted.org/gss-proxy/wiki/ProtocolDocumentation
+The gss_proxy RPC protocol is currently documented `here
+<https://fedorahosted.org/gss-proxy/wiki/ProtocolDocumentation>`_.
 
 This upcall mechanism uses the kernel rpc client and connects to the gssproxy
 userspace program over a regular unix socket. The gssproxy protocol does not
 suffer from the size limitations of the legacy protocol.
 
 Negotiating Upcall Mechanisms
------------------------------
+=============================
 
 To provide backward compatibility, the kernel defaults to using the
 legacy mechanism.  To switch to the new mechanism, gss-proxy must bind
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
