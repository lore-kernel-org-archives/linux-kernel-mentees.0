Return-Path: <SRS0=B4mk=H4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8BE6C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 06:40:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CCA3601FA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 26 Feb 2021 06:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CCA3601FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E1054EF74;
	Fri, 26 Feb 2021 06:40:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5lbkSw8ICZ29; Fri, 26 Feb 2021 06:40:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 757934EF6B;
	Fri, 26 Feb 2021 06:40:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E79BC000A;
	Fri, 26 Feb 2021 06:40:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0F13C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 06:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78C758426E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 06:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ex38wv9C4rHK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 06:40:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7ABA68426D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Feb 2021 06:40:39 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id x16so6501171wmk.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Feb 2021 22:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=qBv4V4EmN8qA0cU5ivOCn36uSWbsf+UfWEMpu3Xsvg0=;
 b=u0HvfMPQE6pgcPWA3xteryuDihSM8934hE5IHWnPWPUtjWK/vGj+L1Wo0s/0YqsQB8
 mmW8iareV9clEPA2G0t0P3KrdessD2h8zGt3dU0/v2hoQA31XQnWn6rndiL+j0E/KDiH
 0sd8OA8566yoKpvZojRGS3DGW3usPrHj5gQcQpKVyGDs8Ng9SPdeUmDjrnYu64y2iA5M
 3haiRUgQNXKZaIoC47EMaqfkvz4PYqWC3UGouNmH65kUiBYcnxu5qLMOXrKkZOIO1RpR
 hmOqd57ufYWZRsB1oTOX5DsStg0xz99eTiwGwobAp2oWxPP9uZEQnd7ygq+AzyCpAi1b
 6GDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qBv4V4EmN8qA0cU5ivOCn36uSWbsf+UfWEMpu3Xsvg0=;
 b=Epcx/23xGuHQiMMh+wnxeHsLH5Ehvi812pI4eRzD+mln7YeS4GPUIA2ncLODTgU4UJ
 qrhwCr9Bhp+Y/4uUb9XO++gjOXCl5zTL4I43Agn82imr01x1l0pM9/gkNaHRgzv7s84r
 XRxnvokVFA9//hdN0O1MT+HycvRgPTpIf/DgRqa3m3j79HuI2IScT9QtJwij/cGI28XJ
 vUFgKZ2XMYWp4C9+cgVohN1jtwPSWVCV53kQP8w8A8WdflVBvWaPGqB6u/nBuZNJLuzH
 r8Fa2aI6+10aTSxTog0zATwvJJMbQoLxjgL6JrMLaEfyiWRp0uSw14DheAvRg6Z9MIQH
 lpiQ==
X-Gm-Message-State: AOAM5312LEaEr8QZXWG4COuXRXdplei7YwVPEBbXSZs+0siPH5OJV83t
 gil+jwTjYH9tEtb/PJ8fUIk=
X-Google-Smtp-Source: ABdhPJwwamyIgSijLzbYxxqyCfR/axISib20Qfp6SAN1d2ny0CIzlWWodzGRYHoYobaPdAY/SNRRkA==
X-Received: by 2002:a1c:a5c7:: with SMTP id o190mr1221496wme.172.1614321637313; 
 Thu, 25 Feb 2021 22:40:37 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2d82:8b00:f574:4738:807d:ed97])
 by smtp.gmail.com with ESMTPSA id 4sm11512687wma.0.2021.02.25.22.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 22:40:36 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH for Dwaipayan] MAINTAINERS: clarify responsibility for
 checkpatch documentation
Date: Fri, 26 Feb 2021 07:40:29 +0100
Message-Id: <20210226064029.1143-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
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

As discussed, Dwaipayan and Lukas take the responsibility for maintaining
the checkpatch documentation that is currently being built up.

To be sure that the checkpatch maintainers and the corresponding
documentation maintainers can keep the content synchronized, add them as
reviewers to the counterpart.

Link: https://lore.kernel.org/lkml/bcee822d1934772f47702ee257bc735c8f467088.camel@perches.com/
Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on next-20210226

Dwaipayan, you probably want to add this patch to your patch series for checkpatch
documentation.

Feel free to add your Signed-off-by tag just following mine. 

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 16ada1a4b751..6b48b79ba284 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4181,9 +4181,18 @@ X:	drivers/char/tpm/
 CHECKPATCH
 M:	Andy Whitcroft <apw@canonical.com>
 M:	Joe Perches <joe@perches.com>
+R:	Dwaipayan Ray <dwaipayanray1@gmail.com>
+R:	Lukas Bulwahn <lukas.bulwahn@gmail.com>
 S:	Maintained
 F:	scripts/checkpatch.pl
 
+CHECKPATCH DOCUMENTATION
+M:	Dwaipayan Ray <dwaipayanray1@gmail.com>
+M:	Lukas Bulwahn <lukas.bulwahn@gmail.com>
+R:	Joe Perches <joe@perches.com>
+S:	Maintained
+F:	Documentation/dev-tools/checkpatch.rst
+
 CHINESE DOCUMENTATION
 M:	Harry Wei <harryxiyou@gmail.com>
 M:	Alex Shi <alex.shi@linux.alibaba.com>
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
