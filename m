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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D9CC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 15:32:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC3246024A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Aug 2021 15:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC3246024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B649E83CAF;
	Wed,  4 Aug 2021 15:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T6pKcXhyRwxz; Wed,  4 Aug 2021 15:32:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E6DA783A95;
	Wed,  4 Aug 2021 15:32:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C565EC0010;
	Wed,  4 Aug 2021 15:32:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 811C2C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C5674023A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:32:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 093KwOi1y5Vr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:32:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8261340169
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Aug 2021 15:32:14 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id i10so3414965pla.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Aug 2021 08:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ggSrpmQKfW4Td+pW1t+J5U0kVzR7wR99s+s3Td6kBDs=;
 b=WFJo48dgxW7ZUNqho8SyzLI5zRnCHwneDRHWSVRbYzFg8hY6QBF0cU10XqCpIi1f+k
 TnR6SrtmyTpan9iY2gDHBplTGdQRIqxkFygqICwXdkCdlvF38tJ1kzthQQO5hF0xfEhi
 NXyoKPz09o9LsddFB+vg7/U6ut8BVMZfChr0yGYTG7OLFwrWndzPJBYl5t+SV5yhO0SG
 qMlVSLSmMNLRhS1dWZ3+V4Zy/Mj6DbHYgjFlD23RAJSQ55dsL2QC+Jxtp5rmhbOe2JCa
 2aZFvZONFUh7VW4571HRT5WmtEolAaXblC44TJYSsJa7z/NrL1uCCBArQhwTrDl/IjOW
 VGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ggSrpmQKfW4Td+pW1t+J5U0kVzR7wR99s+s3Td6kBDs=;
 b=QsyoCANZtMk91Wsv546NbUVBYhQMHaBzJYG+aQNAv2T/E6BJADou6mWajVA3Ij28kI
 3ONAuA1OZHXAqMqguyVGDehgJ/SHIcE89CUjrd0Bl7U+ImgyUNq3OIj9idmoJgHp1Iu1
 97J3ktJpzwtACDOSVjNvhoekqEZ7ZiZI6bh/5uFPYiVzWnm2FmODeHC4gRjeKP3imZKi
 dYst0G3vGaSDFrMF8lbukwAZKH7JZuRz7JBxRty2qFLGdFQX1MObX5zrqggzOnAOxoy4
 qjeCsS6q+H0VRhLapzqFAer1cVaXHQ8+6c65xfG6g315iTYrdO6iZ5RAxlR0jY24oRd9
 Nb9w==
X-Gm-Message-State: AOAM5322CooIM6dOq9isGL4wYw/dSgwajo1aROYrerjlmFs+CjNOtXpb
 Lj4cN83FdjfBmytSs/uOu9Y=
X-Google-Smtp-Source: ABdhPJwd9PKaLoYV1Umh2L6yRerGFreO2RybYcrKodbechNRNKiBkeCCuKqNih1fa1zaf0yE449RlQ==
X-Received: by 2002:a63:cc0e:: with SMTP id x14mr619645pgf.352.1628091133790; 
 Wed, 04 Aug 2021 08:32:13 -0700 (PDT)
Received: from localhost.localdomain ([49.36.211.165])
 by smtp.googlemail.com with ESMTPSA id c136sm3263434pfc.53.2021.08.04.08.32.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 08:32:13 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v3] Documentation: checkpatch: Add SYMBOLIC_PERMS message
Date: Wed,  4 Aug 2021 21:01:34 +0530
Message-Id: <20210804153134.2794-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CABJPP5Ba4D40OKVDk4RopcX5zx3SFWvOBKLOCfhc1gjw4-4JMA@mail.gmail.com>
References: <CABJPP5Ba4D40OKVDk4RopcX5zx3SFWvOBKLOCfhc1gjw4-4JMA@mail.gmail.com>
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

Add a new message type SYMBOLIC_PERMS under the 'Permissions'
subsection. Checkpatch documentation that recommends the user to use
the octal permission bits instead of their symbolic macro names.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index f0956e9ea..009957cda 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -957,6 +957,12 @@ Permissions
     Permission bits should use 4 digit octal permissions (like 0700 or 0444).
     Avoid using any other base like decimal.
 
+  **SYMBOLIC_PERMS**
+    Permission bits in the octal form are more readable and easier to
+    understand than their symbolic counterparts.
+
+    See: https://lore.kernel.org/lkml/CA+55aFw5v23T-zvDZp-MmD_EYxF8WbafwwB59934FV7g21uMGQ@mail.gmail.com/
+
 
 Spacing and Brackets
 --------------------
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
