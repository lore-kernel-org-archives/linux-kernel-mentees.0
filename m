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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF28C2D0CE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 12:27:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F40FC20882
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 12:27:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxML+TD/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F40FC20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C07E4855EA;
	Tue, 21 Jan 2020 12:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5zEn3OtaFnAG; Tue, 21 Jan 2020 12:27:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3338687263;
	Tue, 21 Jan 2020 12:27:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22B22C0176;
	Tue, 21 Jan 2020 12:27:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6719FC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 6432D86406
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:27:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4FnJLsbfGcV
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:27:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CC9AF86294
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:27:34 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x6so1420444pfo.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 04:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SiAOjSQQBJyQRmqiwiRWCNQp66CEeV/KpK/nhQbCexA=;
 b=oxML+TD/495qHyzW7RphcwpXChEevCQ/gBgePpFlwcjMT+t+82QOxq6AovfTzIU4No
 QqwJiDXuw1yU+JERB2Pkoi4zlJLnFN93YlZSLaJeqNLC5G15w7rEqjc3BAgtxuXjzsN/
 OcUhuDzDgvz2R40xYNf/AvpquQbHVS+GjoNqY613P0oSGHRQh8ZsOVbzax+zO4MId7d5
 srvi+cQRBEJXoEHv9QnPMuhqJMv6glLQdNUrpqmKRPlZSiZfKbMGd2qdbFGZ0ZrLHaJa
 k28ObQ9M2T/vjbSlo+m7MVjCq+3vWv6tgybgr8QGGr67Kfrn7xXeXo2MJzF02gzZWfXk
 Ms0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SiAOjSQQBJyQRmqiwiRWCNQp66CEeV/KpK/nhQbCexA=;
 b=qfxIqKVQn++qr3AbtLpXuqXfxyATmEMBFzVNdNf2hv5850xqiqoOUanfSeCKS4Zz+m
 qHjafs2UbQMX87nfMJ2p+EpKuq5wPV0r/xZ9lf1DtRWiX/R/5sNZnuM5sJJUB9U7xW0/
 RngRYhdbgqbXuVB/ehgnMK/VU3P7NSRnbmS+eDDsQn/vjWyWy/PAfZLlUQogZ1z39yii
 La/RHQMKGkInte7FVA9jy1JGo4rjdsSeOJH87RNmI6k8I6+h/C4jbA3CXHxg+k9qqAUj
 ilqWBmkCJ+BApcR/iqBu5A2J4qlDZbbN8pXmSyh6/huU+3aiejhztFRhLc01u0s+2Oh7
 mE7A==
X-Gm-Message-State: APjAAAVnPVHQjgARpmP2/s4b6lz8GaUWMtyRIUHxUQ8ufD/ykr6fH3R3
 X4r/bHNy8a5wb7bTHE/iYO4=
X-Google-Smtp-Source: APXvYqzfDSvbgzV12uL8hxblEU0M4i0xc1CjJaroQALU5vEyKnXhETG1kuUUAhvu2ChDi/ZqYXIR1A==
X-Received: by 2002:a63:5920:: with SMTP id n32mr5014104pgb.443.1579609654408; 
 Tue, 21 Jan 2020 04:27:34 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:167e:da7:fcf8:ab67:c0bb:e29])
 by smtp.gmail.com with ESMTPSA id
 i9sm44381347pfk.24.2020.01.21.04.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 04:27:34 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 21 Jan 2020 17:57:18 +0530
Message-Id: <20200121122719.24226-2-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200121122719.24226-1-jaskaransingh7654321@gmail.com>
References: <20200121080455.24748-1-jaskaransingh7654321@gmail.com>
 <20200121122719.24226-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 2/3] parsing_hacks: Add bool to
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
