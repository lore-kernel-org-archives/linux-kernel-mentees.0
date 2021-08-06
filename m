Return-Path: <SRS0=Fc4Z=M5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B778AC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 15:19:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 386846113C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Aug 2021 15:19:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 386846113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2CA781B25;
	Fri,  6 Aug 2021 15:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SgDj9Z8JSEah; Fri,  6 Aug 2021 15:19:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 20CFC8109C;
	Fri,  6 Aug 2021 15:19:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03250C0010;
	Fri,  6 Aug 2021 15:19:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B05D5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 15:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91A6A40109
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 15:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xwTLXBMyDikD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 15:19:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 136CE400D2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Aug 2021 15:19:08 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id e21so7522212pla.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Aug 2021 08:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HO6Q3XwwniKzS+2tsl0S9oaLZLhI1jJ6q0XjbW7gkwY=;
 b=MinM2s8DyAyZp33kZ8umcTf9NVozOQEiqQ3L+05Pw1ettbVv5s6k9t/IXXBsrfcD8T
 t9xic3mQ81QAuc1XfvEI7xCj8EOPVNUgVHXjSwsbQjkToIUW0sr592hhiHyBM3mUEgW8
 zwigkpEubEsfWmy7R2wZ3j5REmhRtvSjuOJHkM1fcdVVEzuRNC0j7vs4t9KgPTrwjma2
 A9b12utHMI0ipZD/sR26dzMzjJ49L/d1vLhUxNFCHESYKiZdg/KHSzTZnTYQvMcTDiik
 7r55GOGv0ZYBOkhD0YhFIcD0dwL5FxtPp4PnrfUNGxfnOTPLdmsr/tPYL4D4FL3i72RD
 49VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HO6Q3XwwniKzS+2tsl0S9oaLZLhI1jJ6q0XjbW7gkwY=;
 b=um9rFpNWIJ9P3mfQWFUPaZWgk0UFF9K2l93/CBKVMm1egqOsmXVIDL/wEg6ajg6cNQ
 3BKRAfF1/xDu8gNMeelX+jKftJGJzqnZ+RS5Aazd0e75WJG98e10m77YNREYZAFI3mrK
 rTeLvNRprzbtvqoH+psoDD3wKcMHqBizvueVolrIK2CUiFF5ms13iGc2XgT7PmampsKL
 /gh4v5Nb/gpExmnSfu957F14GUM4BuaqjNZA4/qWmNQ2V+Xf/xXiZXkJ83LZZ8fhreow
 qmigMX/WS3niCwu3lw254gwYAa7qQEbwzEHwRU2QIxeYiexNfe0XqjATCkt8nS7Mi9VX
 CWLg==
X-Gm-Message-State: AOAM531UTMFAmIUhfStoIGt/5RLeTHCQid7Lt04QNomn6mVx+Qy7m108
 j596m+jZcmlYhXGcymSOQYA=
X-Google-Smtp-Source: ABdhPJxvWKJbDhwj7AO8I3yXsXBEZmxBs+QDU5dz2GGzj9DR7Hl/cDq8ZPL256lx1MQusWTsOPPa7g==
X-Received: by 2002:a63:6d3:: with SMTP id 202mr1084764pgg.420.1628263148408; 
 Fri, 06 Aug 2021 08:19:08 -0700 (PDT)
Received: from localhost.localdomain ([2409:4042:4e12:2045:d99:6446:1967:c534])
 by smtp.gmail.com with ESMTPSA id c14sm12417731pgv.86.2021.08.06.08.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 08:19:08 -0700 (PDT)
From: Vinesh Raut <vineshraut2017@gmail.com>
To: lukas.bulwahn@gmail.com
Subject: [PATCH v2] Documentation: checkpatch: add UNNECESSARY_CASTS message.
Date: Fri,  6 Aug 2021 20:48:41 +0530
Message-Id: <20210806151841.13940-1-vineshraut2017@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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

Add verbose description for UNNECESSARY_CASTS message type.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Vinesh Raut <vineshraut2017@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index f0956e9ea2d8..9cb6b9059fc6 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -268,6 +268,15 @@ Allocation style
 
     See: https://www.kernel.org/doc/html/latest/core-api/memory-allocation.html
 
+   **UNNECESSAR_CASTS**
+   Cast should not be done to any alloc functions.
+   Appropriate type of pointer is pick by compiler at run time
+   Cast may hide bugs, as compiler suppress the warning after cast.
+
+   See:
+   1] https://lore.kernel.org/lkml/20070808024321.GA6316@redhat.com/
+   2] https://lore.kernel.org/lkml/a5e60a2b93e10baf84af063f6c8e56402273105d.camel@perches.com/
+
 
 API usage
 ---------
-- 
2.30.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
