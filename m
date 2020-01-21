Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A16DFC2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 08:05:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71E1A22522
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 08:05:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+7JaGCj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71E1A22522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 51F7D86489;
	Tue, 21 Jan 2020 08:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wo0E7AhsRvmF; Tue, 21 Jan 2020 08:05:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D04268639B;
	Tue, 21 Jan 2020 08:05:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE3B9C0176;
	Tue, 21 Jan 2020 08:05:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13A14C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EFE4485EAC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rG1D5R1zWdj1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 479D985EAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 08:05:31 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y8so979530pll.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 00:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SiAOjSQQBJyQRmqiwiRWCNQp66CEeV/KpK/nhQbCexA=;
 b=I+7JaGCj9wVBADAlwc38iJULpgvxoy6fbNyYOxIpgGlcUkVvjMO/If1Y9autpRGTWF
 3Z22P+rQhruktxtqQEZgfUzOwI09MuEj+UbpjtdPVSSNAGE4ajWmwrolZQrJT7rZn72w
 FEDl8jKyVPXh8ObSHCwlXMYzv+NhWO8T9zEBwMDCYgWls6LG3cAsRORhqnNQSBez4ejm
 Zljl3HyyMvEbAMWKtvAkPf1u+jfDZIJRQuaBiZVax34oNPAUcu/4qCS2GtrcYaJpKNpS
 5wHnijvpXxMF0/FEPdkx51IhA5arSNRStcB1GkPjw9wmxlD36FSTkF2E2LOlxo3+J4hb
 vkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SiAOjSQQBJyQRmqiwiRWCNQp66CEeV/KpK/nhQbCexA=;
 b=T00fX8+zPir9So6DyO4q8HCeputr4Ilo5oVi9HU3YuMyHHkw3XU0jf/HEYQr3I3cLS
 GZ2FF+h0DR+iwK4qMQ/uNXtCpnFKGMPWzCTm6PZ3Vm1mHabbTdLuMuLq0dHDn6aarEcl
 z6bJVLm64QrBjXRVYu5SQSNsuOxfdkw78KU+h5uYu0/CnORDWGJTlU2pyF2EAOYPOpxD
 js/afCS80PG+uC+MLkLbtSqpLbP+gqqljPoMHyWTImUkrgr/76Xbkz3lJN16C49jn2Gf
 d3sYEh5d+yhcmy58mkT3hjbwnVDFF35aqyVRjxUWaVj3hhQNTQfkV3UzBBJwBXZtUAUy
 s3bA==
X-Gm-Message-State: APjAAAUy0ZRZK7+N7qc4Kl+ufARFLpLd3T80PcSt7HCumekYsz0PHBWa
 w61P0IBmaRfb0SGD1LSKmGc=
X-Google-Smtp-Source: APXvYqxtN6INbGZdFPyIBPJJKijDHVSIyBfFB77Uwmd1tHGWM6g0liiSakFzhcqN98IenRDP6M0qvQ==
X-Received: by 2002:a17:90a:23ad:: with SMTP id
 g42mr3819252pje.105.1579593930908; 
 Tue, 21 Jan 2020 00:05:30 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:167e:da7:fcf8:ab67:c0bb:e29])
 by smtp.gmail.com with ESMTPSA id
 k23sm39229604pgg.7.2020.01.21.00.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 00:05:30 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 21 Jan 2020 13:34:54 +0530
Message-Id: <20200121080455.24748-3-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200121080455.24748-1-jaskaransingh7654321@gmail.com>
References: <20200121080455.24748-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, jaskaransingh7654321@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 2/3] parsing_hacks: Add bool to
	list of known typedefs
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

The increase in passed tokens is due to functions in
kernel/trace/trace_kprobe.c using nokprobe_inline. For instances of
nokprobe_inline bool, nokprobe_inline is labeled as a CppMacro.

Examples of this in the --parse-c diff are as follows:

Before:
  passed:bool
  passed:bool
  passed:bool
  passed:bool
  passed:bool

After:
  passed:nokprobe_inline
  passed:nokprobe_inline
  passed:nokprobe_inline
  passed:nokprobe_inline
  passed:nokprobe_inline
  passed:nokprobe_inline
  passed:nokprobe_inline

Signed-off-by: Jaskaran Singh <jaskaransingh7654321@gmail.com>
---
 parsing_c/parsing_hacks.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/parsing_c/parsing_hacks.ml b/parsing_c/parsing_hacks.ml
index 23d675cf..42ad9ccc 100644
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
