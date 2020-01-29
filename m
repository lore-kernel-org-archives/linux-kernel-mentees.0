Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74962C35240
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF4B214D8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAyozUZj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BF4B214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 08C0386BDE;
	Wed, 29 Jan 2020 04:49:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZ+HBJl+ZZPe; Wed, 29 Jan 2020 04:49:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C121F861A7;
	Wed, 29 Jan 2020 04:49:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B0AF3C0178;
	Wed, 29 Jan 2020 04:49:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01E60C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 04:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F2DE62041C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 04:49:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PmhoJx7ognqJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 04:49:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by silver.osuosl.org (Postfix) with ESMTPS id DC0D220357
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 04:49:34 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id t204so14980347qke.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jan 2020 20:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fjtPyGHczMSaELCapHNSE16Wg2ojQqmt1c/4u/9C08Y=;
 b=hAyozUZjnlikYz2njE3YtjtbQGy7ezhVoK0paMq9ZP1n2hERqO70RECmM0918c2e3I
 CMYFVNR1aIRYy7qZ17YSzpQu15ZJ3nqxFC+SlWXRBvq7hnracyCHPEMAq5LYF2oAnAmp
 JGC7/tMKrrFrkPpHFdoGkjA3PWjvWkZIFmz3g9qHzni2MGqgkB3lid4VroNPKkztD3hk
 7K765G4p2DXtHHX9jNvge3sEahGpMA1mJdroKQA8ysvBF2nrVNfBtDNPbqsiudatp7EF
 CODjIy3gIfmZpcsrDCEAuNUBQLQb1HFVreLtmcgyk1l0EQ7BAsFsggGSvt5AQjHqRmJM
 lp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fjtPyGHczMSaELCapHNSE16Wg2ojQqmt1c/4u/9C08Y=;
 b=KnH1hY9m2zu6bPz18E64M7UcPuBPERGFgGUUwVg+biaAQAciYZT3e8Hmt2zduDlj0b
 Fl66aYE3MaJ6LV0xUuETwzVo9WJmS+95ZcafJrgCCDqUAFIh+XlxESgwdTW8eAwjIzl9
 s+9rjYSQGpLunwUJUWv0eE3E/l2QviZ82QmUVhBakEjcdYx9YAfCFTTxbfPQDvfGXkZF
 9AderGikU9P5AaCjRxuB5c3l4Vdlw1aUf+gu1aI7ZcuWooSSnHI8vM0O86WbROukTzj8
 gY/tYDmdDFjNttyCyVpFHh999lS+1mSIgTcdtU34gVO57hmfB/DHiFtk2aLtbsnOBV7b
 lQaA==
X-Gm-Message-State: APjAAAViqIHs92QnFuZc+4xbinJ+y2hcxcYj/bOJTupGJIbp3qgcDpaz
 IsWfolKGPWbLllTcGKzQg6o=
X-Google-Smtp-Source: APXvYqzCDhm4htgYhRBqje4amg/HaEET/32U5ASBXMoF9kEMEeMeNZWcdvjsv/KZUyPjDV5yTpP9ng==
X-Received: by 2002:a37:9e12:: with SMTP id h18mr25278681qke.420.1580273373759; 
 Tue, 28 Jan 2020 20:49:33 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
 by smtp.gmail.com with ESMTPSA id a22sm487320qtd.48.2020.01.28.20.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2020 20:49:33 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Wed, 29 Jan 2020 01:49:15 -0300
Message-Id: <20200129044917.566906-4-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129044917.566906-1-dwlsalmeida@gmail.com>
References: <20200129044917.566906-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 3/5] Documentation: nfs:
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
2.25.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
