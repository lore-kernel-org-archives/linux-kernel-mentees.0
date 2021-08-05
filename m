Return-Path: <SRS0=ZEDA=M4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75847C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 10:51:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EA0A6105A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 10:51:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1EA0A6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E331E403A0;
	Thu,  5 Aug 2021 10:51:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oH3UhtRCAMhe; Thu,  5 Aug 2021 10:51:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 294204028F;
	Thu,  5 Aug 2021 10:51:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BA83C0010;
	Thu,  5 Aug 2021 10:51:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B0BEC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 10:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 777188385D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 10:51:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2JPhK6c5nZ-6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 10:51:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EADB836D5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 10:51:32 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so8317468pjh.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Aug 2021 03:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/TClTW1n0eBYwEnCwpx9dNw2Ul4t4Jboa8+WknRx0dk=;
 b=dD0SAyTU09QXAjLFUtrsK8JVcZvstQmPHgcvqsuwG/GNHiLEfFiArg6Y0qjeSQbp+J
 A7NfDZUKOqBZEfyOR71RcRK5bSAbX9M+wSj6wyz9kU3q3fp1Ax+0QYRpb1hiciF/YOVp
 Xq/2iruPIF4FT7OC+MvDZZSZH25G7ypg+rrcpdXwO8zRgepQnj1AXK3VVTsLMrFC7/MD
 Q2tKXX0kekmvq05etVYkqbwlt0r50dTqyMuHx9pCcp+M54bGyIZTi0Q7fvI2J/SQJYLu
 pCyfi03YItTv8UXT3EcPyi0rGNVln0y7HGKpwA9QESkUt2jhV47Aw1RfW7/x6K0U6e3W
 iuKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/TClTW1n0eBYwEnCwpx9dNw2Ul4t4Jboa8+WknRx0dk=;
 b=eSp4cZBxh43etHk2vedSPiBElDI/EUTIokMhIYzWfofVn4ExBzJNe+Bq8kaOjzrD+M
 Iu1MQZbntn34fIkYlftZhip5mAkZzKUFXtgOsEbdQIP+MEG3VJHnh3okRixQ9M87FQiu
 TIj3pfsTHbS6PEqKdBbaz8cUvw5AR1yIdLw1cGr4OgWqzphjb41aYmOC9GxGNJv54nT8
 8ApzUgTzcD0Q+X3lDvT1ZUB+dtmidh/8ZRsDU8XOPO2U8/Wu7D0GudfciHpmiKixSHn7
 t6pW0sDs9cvctplt7kl464O7vI8hSG9mQQBynOhUENLwqeCT8y8u4a1byc7e5c+YtdTC
 IARg==
X-Gm-Message-State: AOAM531QzCgzn/MjEV61sCPpvuDU6437H1ABAVSE0Z7czVLOObE2aIbs
 M8WJA9qu/yBVNAileme7K2Y=
X-Google-Smtp-Source: ABdhPJw6Jdsi8JSNJYegyoI+9pCv4fXGEktz99rPhCC2KPZhWO+xuED/b6yO+uKL3fnX0ARLV5GkcA==
X-Received: by 2002:a63:e350:: with SMTP id o16mr1180656pgj.98.1628160692063; 
 Thu, 05 Aug 2021 03:51:32 -0700 (PDT)
Received: from localhost.localdomain
 ([2409:4042:4d9c:8a47:be19:7920:caae:af62])
 by smtp.gmail.com with ESMTPSA id u2sm9152535pjy.7.2021.08.05.03.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 03:51:31 -0700 (PDT)
From: Vinesh Raut <vineshraut2017@gmail.com>
To: lukas.bulwahn@gmail.com
Subject: [PATCH] Documentation: Checkpatch.rst: Doc added UNNECESSARY_CAST
Date: Thu,  5 Aug 2021 16:19:45 +0530
Message-Id: <20210805104946.17500-1-vineshraut2017@gmail.com>
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

Documentation was missing for UNNECESSARY_CAST Warning.
Added it to checkpatch.rst with refers from https://lore.kernel.org
Also, pointers been mentioned in Documentation

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Vinesh Raut <vineshraut2017@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index f0956e9ea2d8..72c2f32b1515 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -268,6 +268,16 @@ Allocation style
 
     See: https://www.kernel.org/doc/html/latest/core-api/memory-allocation.html
 
+   **UNNECESSARY_CASTS**
+      Any alloc functions should not be cast. Because they usually returns the
+      void pointer, which compiler then implicitly picks the type of pointer at
+      run time. Hence, casting is not prefer on any alloc functions. cast may
+      hide bugs if any exist, as compiler supresses the warnings after casting.
+
+      See:
+      http://c-faq.com/malloc/mallocnocast.html
+      https://lore.kernel.org/lkml/20070808024321.GA6316@redhat.com/
+      https://lore.kernel.org/lkml/a5e60a2b93e10baf84af063f6c8e56402273105d.camel@perches.com/
 
 API usage
 ---------
-- 
2.30.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
