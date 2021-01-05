Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37753C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 08:23:17 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8FE522257
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 08:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8FE522257
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 39CA8867D7;
	Tue,  5 Jan 2021 08:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PRlkmqdreJLc; Tue,  5 Jan 2021 08:23:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CC418867D2;
	Tue,  5 Jan 2021 08:23:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6783C088B;
	Tue,  5 Jan 2021 08:23:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1173FC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E339D867D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:23:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EMj7pIgGBOMS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:23:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5250F867D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 08:23:13 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id 15so20813467pgx.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 00:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q2Ns+KjaRZiIsqBfJstvkjNabzsP3wbjh23QJIKvTaQ=;
 b=YQfcpfCfGzqCAiKiaiQkLNI531wW1pkJsiHVjANA2REPooMz624jcPhFLj+xsTSX6I
 6Fs6Ob1Ln6xEUBFPsKz6Kdwjp7RaBAK0xW+/4x/C7lAwmf9v71kUH6fwvH0TlNjqjPIi
 MPWOgLuteyXYrYA5SRc5es/ddD4SwdqZ4cBY6FBEpNksw9BB8te7ZlHWZPYecCOnPJXi
 xF+deoCGbPEgTrvka+YjCP5OrR/8H5/YHBhoobcc4rQLPZrDME61AxzT7syZk68K2K6i
 pjhaRcqWn2Y07kF2J339XBC7ekmETb4SwZyDoN+fwCCDxhj0LDvjri30Vcy7pzdzWqmI
 0NCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q2Ns+KjaRZiIsqBfJstvkjNabzsP3wbjh23QJIKvTaQ=;
 b=jr9bOJfXfkmnE2HKNJ6AQuNoR9BrPLkqAZc/vvD/HICf7oDwnFhLaVVMMwoz3Gcg2H
 jvUCU+qjRqSRdwSdsJ/+igmUo+FuKaPekbC9rJbGU/iZPo1LMSANh9w8kHhCpDLj072p
 545+YrVmgxa3s542mMxk3oG00wIYi/z4cz/o72BGCa1/NuGi5RRYkoboT59hN/ZyRIRv
 TYgsZbjR+yq/YYMSYRKKeg2sCe7CCi6aCmBXKNpungV9YWRdnVbzICs+evhWcJ5v/0qw
 wTPjMPjIa2GPqbUoASA3LpRFEnbWtJjQ6FHGcVKqhvaKtinvPZq34KUQ7GmfDsinw1Ic
 vqjA==
X-Gm-Message-State: AOAM532G6yl19kUD7Iy+jTULwiLzCPtNt11ftTYgXXscpEP82NuX8PJc
 XROkQnQMgvjX9fL8X6D/pTA=
X-Google-Smtp-Source: ABdhPJw1hnzLD8RleGkOsv9x9hjymBlVqEzMqd9nHE1T6RaM0f1Sq0LkD/2kqPyd2rYL7d9uohcQJw==
X-Received: by 2002:a63:b05:: with SMTP id 5mr75795965pgl.163.1609834992702;
 Tue, 05 Jan 2021 00:23:12 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6064:97d:44da:5ae4:7c76])
 by smtp.gmail.com with ESMTPSA id
 q26sm58584699pfl.219.2021.01.05.00.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 00:23:12 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Tue,  5 Jan 2021 13:53:03 +0530
Message-Id: <20210105082303.15310-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add a new check for
	strcpy/strlcpy uses
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

strcpy() performs no bounds checking on the destination buffer.
This could result in linear overflows beyond the end of the buffer.

strlcpy() reads the entire source buffer first. This read
may exceed the destination size limit. This can be both inefficient
and lead to linear read overflows.

The safe replacement to both of these is to use strscpy() instead.
Add a new checkpatch warning which alerts the user on finding usage of
strcpy() or strlcpy().

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index d6a4d25b0972..0003fd9de62c 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6604,6 +6604,13 @@ sub process {
 			}
 		}
 
+# Check for strcpy/strlcpy uses
+		if (defined($stat) &&
+		    $stat =~ /^\+(?:.*?)\b(str[l]?cpy)\s*\(/) {
+			WARN("PREFER_STRSCPY",
+			     "Prefer strscpy() over $1()\n" . "$here\n$stat\n");
+		}
+
 # Check for memcpy(foo, bar, ETH_ALEN) that could be ether_addr_copy(foo, bar)
 #		if ($perl_version_ok &&
 #		    defined $stat &&
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
