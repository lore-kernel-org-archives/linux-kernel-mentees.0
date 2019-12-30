Return-Path: <SRS0=vtN2=2U=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61C4FC2D0C3
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 04:56:44 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3707521744
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Dec 2019 04:56:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpBFtPSR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3707521744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1BC7A84514;
	Mon, 30 Dec 2019 04:56:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ch3vDOvh5x_r; Mon, 30 Dec 2019 04:56:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EC5EE81E5F;
	Mon, 30 Dec 2019 04:56:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBF36C18DC;
	Mon, 30 Dec 2019 04:56:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAABAC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A18CA84514
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pWBPCBc0q0Bs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4CC3D81E5F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Dec 2019 04:56:41 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id b22so14167551pls.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 29 Dec 2019 20:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S+dkYv5HLHzNOWTER7d+8BqEGnKLKwfpZv5Uz3xEK7E=;
 b=FpBFtPSR/VFNi54ZWQCOfOtfnCZ7Lq4cThBUGaFGz2aj0o58un9XRTJPqVntyYJQTv
 DBdQD7enbga6HkMWR7NGcpG6tYCjtUI3fYiOXnf2xwWugJtHFT5rYB2rY8zJu015Est8
 2gDgl5HCxD6wnqiQEd1m9aQjpLG+YXdzZUa2+oud00hehI6xDe0o6c7brJZVMoNeIAbz
 +4fuPw3Gzx6AdS4D57e/33IPhrRNIIEwkcVIcV9tenqD6Wl/M8Z/nzlhZeWzz3/qivy3
 5/OkOxulwcckMpkF2py8gpFDp7tD9bqdZrso5i9rr7v1DbQ+0iyv51OEubRhjM4zGiL+
 D1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S+dkYv5HLHzNOWTER7d+8BqEGnKLKwfpZv5Uz3xEK7E=;
 b=t9UebtSuqo6J4tOTa870VYqooPWh5b5w6fWHT5Boc97vGrR8sfVml8JrVbZ+rEB7pp
 ftz+UWmzAOrIlnKAcoNrlGAgHNeraA4A2A5RP2ig/UlQpVvlfkbE7ZHB51GgW+Qb+D2d
 EGW0jZxi3ZjeyVk3Ql+nMvY+/0HtQMaFvNoDcLZRiQBuUX+AMJsEWbejQkmYSEsnY4GW
 N+xvpx3rv7zTPpm+xqvqaeRv7STMr+4byWKyEVE5rADg0tQ0SvAiSPZQz8+KzIxfpuQ8
 Hwzqf0hDtSOa/0Iq79mTsixZxfrj27/kLTtl0zQOhE4JLey+9fRCpD91xNLhxIQZGAdD
 luEg==
X-Gm-Message-State: APjAAAUH4SIudAMkhwYKZGHyYbLsYi/yZcmHTjMYI3QKYzi+bUmCK9EJ
 pYdWjBtIb5jDtn+igsODJZcOxEL7cAvpEA==
X-Google-Smtp-Source: APXvYqy5K+A3JJmlnzqidIX9DfQfH66PTegyY0zEBqREVyRLdeuShuyQDCN0cOLurGYKwjqI8RJ81Q==
X-Received: by 2002:a17:90a:8d84:: with SMTP id
 d4mr44311044pjo.114.1577681800868; 
 Sun, 29 Dec 2019 20:56:40 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:da15:c0bd:33c1:e2ad])
 by smtp.gmail.com with ESMTPSA id b1sm22373189pjw.4.2019.12.29.20.56.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Dec 2019 20:56:40 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: corbet@lwn.net,
	mchehab+samsung@kernel.org
Date: Mon, 30 Dec 2019 01:56:01 -0300
Message-Id: <1d7bdd6e00d4d0192763ba830900a8f3b1a58d09.1577681164.git.dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1577681164.git.dwlsalmeida@gmail.com>
References: <cover.1577681164.git.dwlsalmeida@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 7/8] Documentation: nfs:
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
