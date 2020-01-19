Return-Path: <SRS0=OzsJ=3I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C656C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jan 2020 13:48:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F79F2073A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 19 Jan 2020 13:48:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfXTmHCa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F79F2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1D0CD86FAF;
	Sun, 19 Jan 2020 13:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 36lQqaK6n1hS; Sun, 19 Jan 2020 13:48:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8973D86F88;
	Sun, 19 Jan 2020 13:48:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6FA6FC0177;
	Sun, 19 Jan 2020 13:48:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01E45C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 13:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EC9F1203C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 13:48:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NPJ2QAz8iidc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 13:48:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 5CC5020023
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 13:48:19 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id m13so5757347pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 19 Jan 2020 05:48:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KFHaW7MANPO1iW2XlXlYVMWARibm82NfIaz0X5hu9ko=;
 b=UfXTmHCapRCZVqnEyrWLhDG8Gz+30Cetg5aLpo1OU2tSNhT3VMFAsZXY8M0otHEWuE
 TkX1Nyyk/zSAoDNLveAjIl6MdzrLJo+DiwFqB0tA8XRFT1lAze82PHIRfoyzuV5RrEBe
 90fcUmI8L2Opwq6vmxXj4iLf5xIbQrJZnBQsTiL+ev2bjIckAgVjMlW/9tRmQa5nM4pX
 ZYVxKnPh43hgxr3yr0MYf91VWOJFn/9aeHOVpk4F7bLuqugJL1pHZDQ4iCkrjuj+mo9C
 G6cPQD/jufcAW+35SHr1pkIbtgIjroz2cTQEH8DPK5BQVJbpaFZZW5nVALehKxOW0Ev3
 7/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KFHaW7MANPO1iW2XlXlYVMWARibm82NfIaz0X5hu9ko=;
 b=UjDWE4Saylcnmrx2PHBtBce7taC8tf1qDPu1Xi0hmR8cI0UFDoL5zUxhSPSH7deyT9
 kaTfSz1kUWffSMoWPkezP4t2j48jK5L16u0ajTJn2hIugrVGn4FgrncCExVU3BKcGkv/
 GZ4NJXVSuNHXmuHFQD9+MT7Ust8LTsoJOZhkFH/l3DYuC4H6yOuZaeyjwkVwX3O+Qs4Q
 XFOpYUHNBkvBGwKP/bIm7ttlXfC9RHk+tu2B/HSyrJopwt/cItFRF8ATbAK7XWNw5fNY
 y0C6MPzfKPZ5UE6f3xIqmMxaf2DoxiXNtofoJkOWB+6XkSOezB0fsHVFFRgYuPwFSxTN
 ln4w==
X-Gm-Message-State: APjAAAXWkybIiyKvSwtr2ZA6q3KPQ3EywXNdR18s9YsmBTAqcS6e1udT
 PiczaKwkVuOangAHv6uQe7w=
X-Google-Smtp-Source: APXvYqyABcNzkeGKQkH7M1VcF4h+O2QCtjA+cokYpzSlGAOmiD/9wvxTiYhgLnVQvXabAnGugM7zDQ==
X-Received: by 2002:a17:90b:8c6:: with SMTP id
 ds6mr17248562pjb.111.1579441698963; 
 Sun, 19 Jan 2020 05:48:18 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:166b:5b82:8890:55cc:899c:7e19])
 by smtp.gmail.com with ESMTPSA id q63sm36625740pfb.149.2020.01.19.05.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jan 2020 05:48:18 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Sun, 19 Jan 2020 19:18:12 +0530
Message-Id: <20200119134812.32748-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] parsing_hacks: Add bool to list of
	known typedefs
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

bool is widely used in the Linux kernel. Certain cases of
parsing_hacks.ml would mislabel bool.

Add bool to the list of known typedefs.

Stats of --parse-c on Linux v5.5-rc4 are as follows:

Before:

  nb good = 18956150,  nb passed = 134062 =========> 0.70% passed

After:

  nb good = 18956150,  nb passed = 134073 =========> 0.70% passed

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
The above diff has been obtained after applying
https://www.mail-archive.com/cocci@systeme.lip6.fr/msg06706.html

 parsing_c/parsing_hacks.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_c/parsing_hacks.ml b/parsing_c/parsing_hacks.ml
index 685a4908..5e3301a0 100644
--- a/parsing_c/parsing_hacks.ml
+++ b/parsing_c/parsing_hacks.ml
@@ -61,7 +61,7 @@ let is_known_typdef =
       | "u_char"   | "u_short"  | "u_int"  | "u_long"
       | "u8" | "u16" | "u32" | "u64"
       | "s8"  | "s16" | "s32" | "s64"
-      | "__u8" | "__u16" | "__u32"  | "__u64"
+      | "__u8" | "__u16" | "__u32"  | "__u64" | "bool"
         -> true
 
       | "acpi_handle"
-- 
2.21.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
