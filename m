Return-Path: <SRS0=2i/r=M3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4736FC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 18:10:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E759060C3E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 18:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E759060C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB28B60A8F;
	Wed,  4 Aug 2021 18:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d4IHhG4FcMzK; Wed,  4 Aug 2021 18:10:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 2CFB860A71;
	Wed,  4 Aug 2021 18:10:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19F05C001A;
	Wed,  4 Aug 2021 18:10:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B1FE1C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 18:10:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1C0860A71
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 18:10:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BpivqTkdpcPW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 18:10:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC9A260A63
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 18:10:16 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id d17so3861798plr.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Aug 2021 11:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ggdFFc+oqKVKgzFuejDnIdmQz8ebxzYo9Tpan1lBacw=;
 b=Mkmtt3Hpe8NnPktiwRMKPmeqyGXkPx5/idkqj93cYgLxQ2nHQAsco4dpIUPgMyFSu1
 xFdPjT/TmKEMKx0p6E2/Etxif1DsZAgkomRbwwduAwciROHqlYzo5AfPmqeoL4/WQfJi
 nXohnAgq8R995gF7P5absEWDnua98ap9pl78hnxEaeEP2wqDE6iOZY/xDKrMiziLC2+y
 xlo+JLJ5mmFSIl717TIZtIylSbAPz3nBqfwuoxFuBRhBLnsEIVvo6BRMum8A2ZuJnEyc
 AW67f1kncDP24y47iPO48Wcdyyea/oQbf5ZawPv0QPwBzyGGkh1Pl8iLGz2ucwHNS11R
 FoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ggdFFc+oqKVKgzFuejDnIdmQz8ebxzYo9Tpan1lBacw=;
 b=UXwlify6dAl1JJqjNRUGsuuvyMIsb1Sy+FbG24+m6Pe0RVeihZzy9WGNPUURMPkB+R
 j0rVeBtBvU7DTPogMRPJU+MRRno/omIwsIFtHBFpUby5EHKwGmrafle6DeodFvtTxmBP
 /TZB6B+ZFZXrrp49vwGPxf9UDf2U0LSPlYslGk4HeHXNO+ZROk84raSJFi1TR90y1BX2
 Pmb+jqYAGNbxywpP0q56C1FfpXQ57qVX9SoMbYoXcMiviTHbY8/S1HJzk5lzBkwQEjv5
 B+eF9Q9eUYvNI2robwTVD489g6qUeRJi43x26f40XxzgfnWq/fI0XljXaEdB8+8ktxoT
 x4JQ==
X-Gm-Message-State: AOAM532wxQ8SFcZ0iHixz8rX2mp6eYAOzYLb8dJSQ0+rPZCMh81VBTDA
 45dTD7ohE99I9TScpv5GcVM=
X-Google-Smtp-Source: ABdhPJwI70uamgs0UyZajlVpGbpjxX2Kyg1MqfmF/zkKBeOTgnalLw0+nyu5B9OCJSCYuhucEpFIBg==
X-Received: by 2002:a62:5c6:0:b029:341:e0b1:a72c with SMTP id
 189-20020a6205c60000b0290341e0b1a72cmr793409pff.71.1628100616157; 
 Wed, 04 Aug 2021 11:10:16 -0700 (PDT)
Received: from localhost.localdomain ([49.36.211.165])
 by smtp.googlemail.com with ESMTPSA id r18sm4724461pgk.54.2021.08.04.11.10.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 11:10:15 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2] Documentation: checkpatch: Add SPLIT_STRING message
Date: Wed,  4 Aug 2021 23:39:15 +0530
Message-Id: <20210804180915.3234-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMwp+mNPcZNUjNqShY_9my_iBp=oojy7EGpgbu6OpE-bMQ@mail.gmail.com>
References: <CAKXUXMwp+mNPcZNUjNqShY_9my_iBp=oojy7EGpgbu6OpE-bMQ@mail.gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Add a new message type SPLIT_STRING under the 'Indentation and Line
Breaks' subsection. Checkpatch documentation for the splitting of
quoted strings that appear in userspace, across multiple lines.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index f0956e9ea..b7a1288e9 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -710,6 +710,12 @@ Indentation and Line Breaks
 
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#breaking-long-lines-and-strings
 
+  **SPLIT_STRING**
+    Quoted strings that appear as messages in userspace and can be
+    grepped, should not be split across multiple lines.
+
+    See: https://lore.kernel.org/lkml/20120203052727.GA15035@leaf/
+
   **TRAILING_STATEMENTS**
     Trailing statements (for example after any conditional) should be
     on the next line.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
