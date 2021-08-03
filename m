Return-Path: <SRS0=/NdJ=M2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17ED2C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:19:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B220B6054F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B220B6054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 806EA402CD;
	Tue,  3 Aug 2021 14:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1V3Fp81sqyv; Tue,  3 Aug 2021 14:19:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 693B8400F2;
	Tue,  3 Aug 2021 14:19:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 538AFC0010;
	Tue,  3 Aug 2021 14:19:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E7544C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D761B8385D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:19:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5oKPsCssXu_t
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:19:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7C7483857
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:19:09 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso4864721pjf.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HFB8qlqB/+bGDH0fL5xcc5znvyzMuaTWh7CZO361rms=;
 b=kBTEjf2+co5TnAgUITuBsVKzbp4j83F8M1VbeOBgefbJTosocUIU7menZs9+3xeP6p
 X1UnLMTdw2rpzlq9hxjHwuAcMPLQN83r1v6cMBPiH1vqNlG+jDPI5TVaaKNYXWmVSr3f
 ADhGRYUBP1MEw+m0rTi4sT4O9knp8TNRq15ztBHauGSU5T85T/cuNsvaLNn+po+39iKw
 6tULR4g4PylTZCWeUJUNbVck8Y1M6QiWK1YRwqiuGCEU2r8tP+IHtsFaFSLs/O8h4yZU
 iYtruqGXL81Zs6xvSU4R9XdLywYoJMdtoJ0E7mo8lJzPPccpbwEPfyKWOnpI0/UNoV3r
 W50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HFB8qlqB/+bGDH0fL5xcc5znvyzMuaTWh7CZO361rms=;
 b=Uwtu4bbVYTnYRV4nsLz1nA6DwKqgIv2KX7dBAbmQZzLlEId+PdbCtuDneuobmrecab
 6AohHk+K+FhwrI7vnX08R+2es4InADa21XLk977dk6iBZylOB7F9zA+dTIhLoIcqPKKJ
 eoPuJXNXf03zQy5arXWOv4+C6wem612JtDOA93ueYT4l3Sx8lz3GGwTSkt3Fi1mm/L4/
 AJW9kX/Iu/GXHjhn7NEgACnNbVjKu3+g3vcUMCfBD13tKxiLl4L9CbYnzlfovgPOC0Ga
 kud3XaHHzjiDy2FgXry03gypFiuvISeItG0gIa/TH6Gsp9PYnLv8gcm0Sn3h3VYdR5Ws
 QIgg==
X-Gm-Message-State: AOAM532MFC+rAYu5JmfT/3+Y69Z9tsCq1hCdUNV6ZDzjLqFZu1koxOJB
 I0hZCy1gS4aw6XpTqaNzQN0=
X-Google-Smtp-Source: ABdhPJwK4ScWJMTnODFhEVUfRA2OyI7C/yGrLEv22PePGM/ukVF5ByW++2rcMEZiQnncwG02+V26Vw==
X-Received: by 2002:a17:90a:28a6:: with SMTP id
 f35mr4685566pjd.223.1628000349101; 
 Tue, 03 Aug 2021 07:19:09 -0700 (PDT)
Received: from localhost.localdomain ([47.9.137.220])
 by smtp.googlemail.com with ESMTPSA id z2sm16548291pgz.43.2021.08.03.07.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:19:08 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] Documentation: checkpatch: Add SPLIT_STRING message
Date: Tue,  3 Aug 2021 19:47:51 +0530
Message-Id: <20210803141751.16893-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
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

Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index f0956e9ea..32a26a800 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -710,6 +710,10 @@ Indentation and Line Breaks
 
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#breaking-long-lines-and-strings
 
+  **SPLIT_STRING**
+    Quoted strings that appear as messages in userspace and can be
+    grepped, should not be split across multiple lines.
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
