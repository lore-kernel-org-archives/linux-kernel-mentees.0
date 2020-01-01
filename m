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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E13C2D0DE
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jan 2020 22:26:51 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0758B2073D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Jan 2020 22:26:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ia/fc+sU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0758B2073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DEDF22047A;
	Wed,  1 Jan 2020 22:26:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X75LPvwwfvaD; Wed,  1 Jan 2020 22:26:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4F0F420003;
	Wed,  1 Jan 2020 22:26:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F03CC18DC;
	Wed,  1 Jan 2020 22:26:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8D51C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B4874855D9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Awzc6IA6C9s
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 47CB381AEF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Jan 2020 22:26:48 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id x6so20109211pfo.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 01 Jan 2020 14:26:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S+dkYv5HLHzNOWTER7d+8BqEGnKLKwfpZv5Uz3xEK7E=;
 b=ia/fc+sUcStdQiY1tRyj3gBK8XL+cN/P7Afp7l/5pUEUexWwwzTPk0TtNNLa9RJ9Zl
 10fSpovx1pR8Gv3QwyEFQ9gri0PJ2TpQNqmlbFPpe4xTxpbqbCR8Yn0n19zY7s5UvtiT
 thrF/RYf9JvJM8lxEdW3m2KS+Kv6k4mCo5s2K0uaB/PuXmPbiRh/DaxPaPJWRJTVQDVX
 NGiWj9S9LsK/CWxXYnrxMBgpiMiNm7td5XN8VaKOo5J5pNwRLRxnFKWauJ1KzVBOiCyD
 WIV4htAlm2N4oAL1BGzyV6H7FIaErK9SFKG++xLYxoUU7UOAHcU8+dluvso0PNehgI+B
 Ew2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S+dkYv5HLHzNOWTER7d+8BqEGnKLKwfpZv5Uz3xEK7E=;
 b=ZS2SEih1WetR+6QTZcbQRqot4aKackf9RknImwN52hiD2fFa9fmjwVnlxY1iGgdsNr
 pQ6Dr1/8+2JX2M3lpPfY1rUq6aswy5UPtaxSQZfoDBH3XsAUsA6qerd4SOIE45P2Tn9D
 0ZLaC9hYUYwq/zW4e0Zwb2LEPeCy9fW+y1K74cyhZpw8jmTSAScEjyKksyy9GPt/Q9xR
 1EmF4PAx8kGh19NBgxs/6i9yfzby25nSbKks7sO/OnJ6VTyWcRlN0PTC9e1aYUZaYMX8
 0FaWLqZZZ/kqXxeEStWPmk+UPOoh9PutQTpU8zrX6IZ9pIHsosZVgwIf06IWm2+q5IuF
 HmTQ==
X-Gm-Message-State: APjAAAWyOFkX1oeiA9DCPFvQZiORLU2KD9SMwJO7WU9nJYji3Suc4TqY
 SC587+JYGSyI7akvi5EEzGGFaItBLsU=
X-Google-Smtp-Source: APXvYqzst1YW5MTfyOVJ9oyIhHWFUBIalWaKhBwd2RW0ubsenUzXdgCWymwZV1GrDQLlZmlb0/3lhg==
X-Received: by 2002:aa7:870d:: with SMTP id b13mr65507563pfo.212.1577917607944; 
 Wed, 01 Jan 2020 14:26:47 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id o2sm8601008pjo.26.2020.01.01.14.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 14:26:47 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab+samsung@kernel.org,
	corbet@lwn.net
Date: Wed,  1 Jan 2020 19:26:14 -0300
Message-Id: <adbb8abe0f8bd4f58c79fd503822604bdd2b9bd4.1577917076.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577917076.git.dwlsalmeida@gmail.com>
References: <cover.1577917076.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3 7/8] Documentation: nfs:
	pnfs-scsi-server: convert to ReST
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

Convert pnfs-scsi-server to ReST and move it to admin-guide. Content
remains mostly unchanged.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/admin-guide/nfs/index.rst                          | 1 +
 .../nfs/pnfs-scsi-server.rst}                                    | 1 +
 2 files changed, 2 insertions(+)
 rename Documentation/{filesystems/nfs/pnfs-scsi-server.txt => admin-guide/nfs/pnfs-scsi-server.rst} (97%)

diff --git a/Documentation/admin-guide/nfs/index.rst b/Documentation/admin-guide/nfs/index.rst
index f3bfd0f5a362..c96e93b61744 100644
--- a/Documentation/admin-guide/nfs/index.rst
+++ b/Documentation/admin-guide/nfs/index.rst
@@ -11,4 +11,5 @@ NFS
     nfsd-admin-interfaces
     nfs-idmapper
     pnfs-block-server
+    pnfs-scsi-server
 
diff --git a/Documentation/filesystems/nfs/pnfs-scsi-server.txt b/Documentation/admin-guide/nfs/pnfs-scsi-server.rst
similarity index 97%
rename from Documentation/filesystems/nfs/pnfs-scsi-server.txt
rename to Documentation/admin-guide/nfs/pnfs-scsi-server.rst
index 5bef7268bd9f..d2f6ee558071 100644
--- a/Documentation/filesystems/nfs/pnfs-scsi-server.txt
+++ b/Documentation/admin-guide/nfs/pnfs-scsi-server.rst
@@ -1,4 +1,5 @@
 
+==================================
 pNFS SCSI layout server user guide
 ==================================
 
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
