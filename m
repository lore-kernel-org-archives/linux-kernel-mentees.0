Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7A7EE49A3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Aug 2023 19:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B273C405F1;
	Sat, 19 Aug 2023 19:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B273C405F1
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=L4w33MvZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3uMjY6jChfN; Sat, 19 Aug 2023 19:50:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9F2D14000B;
	Sat, 19 Aug 2023 19:50:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F2D14000B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7E4E7C0039;
	Sat, 19 Aug 2023 19:50:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E71A7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 19:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0DDC41BAB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 19:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0DDC41BAB
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=L4w33MvZ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GV00t5jC2CHM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 19:50:38 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BEECE41730
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 19:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEECE41730
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-319e93a1594so1827621f8f.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Aug 2023 12:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692474636; x=1693079436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=syjYuYouKG6x9vMzQTgaYE6bMGQKoGTf55WJXqWNgfk=;
 b=L4w33MvZDt+bejgB59yoSFPXfvYoa7sF0Bzw4eS6/jas4uM7W/XKooWVqYB1iRy66l
 gnFpFknuahxpz1L1cGsQ6oMiUQrIN2a3l1jDwWQNtZbHhtdQl6O/VjLLAx7qk99jnpv3
 Zv3aWmfvwcdLG2b0uajwFiA0OarHIjj4XXSVJOGvSSOygt+bVKObZYDWvJNwj8tlN1DU
 j/+qVeaUN0i2XnKHVcEiSS5xkFL/aY75kBqJ5bEwkDgE2Z/txDZK7XV6wkQSNJFuh1Z5
 lJR9HtrlCfBAicwNDH2PwXY9kS7kNVpncpDdMB4DpS7SyqHnAYXfpgLfgjnrsPtNKJMA
 CkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692474636; x=1693079436;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=syjYuYouKG6x9vMzQTgaYE6bMGQKoGTf55WJXqWNgfk=;
 b=l4sRu4P/YSJPyBEfYSSqI/hhVkZW9vfeaTuwCcHLe3+JxnE79Rmdf1AHu4BqsL7uxT
 UwznSDprkq0d3URcRpJcjpAhiwwUu2E1AmU2rVtKLxKjTmWpbjffDDmVNOWiIlC06spO
 SNv/4uM5920BnEOfgd8icAtNvzwvHnwJ4y2rlTPF6TVap+mOS4sYn6FxHcqss9q/JltR
 48cAUxWViTfwPFZx9750ryKs+HpnS+oH1py3Vr88yr1fT1hsEFzdzg+OOdZsUpNRChVY
 4ew1+mZWIExiBd3EsYBBQhv5SoeQXWmiaKM140DZyLkTUEaHjJSOUfKlVSWkhGr9af5Q
 1TKw==
X-Gm-Message-State: AOJu0YywhUm8mePLc0EDs/KDbFa13NsZgZwnPwdxUo7bl9NuNuDdpD2C
 eoXCZ2wmr4AUjPSBT2xl1iY=
X-Google-Smtp-Source: AGHT+IHwz9i9RZEGQSJnV0omevwRbtNhcOM2kfj2XUSJk9HKoTKu5AgwgZFEvFvjQFf7QVMhzBYynA==
X-Received: by 2002:adf:e802:0:b0:313:f45f:74a1 with SMTP id
 o2-20020adfe802000000b00313f45f74a1mr2071265wrm.51.1692474635765; 
 Sat, 19 Aug 2023 12:50:35 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx.. ([5.194.84.172])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a1c7913000000b003fe26bf65e7sm6861382wme.13.2023.08.19.12.50.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Aug 2023 12:50:35 -0700 (PDT)
From: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
To: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, willemdebruijn.kernel@gmail.com,
 davem@davemloft.net, pabeni@redhat.com, edumazet@google.com,
 shuah@kernel.org
Subject: [PATCH 1/2] selftests: Provide local define of min() and max()
Date: Sat, 19 Aug 2023 23:50:04 +0400
Message-Id: <20230819195005.99387-2-mahmoudmatook.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230819195005.99387-1-mahmoudmatook.mm@gmail.com>
References: <20230819195005.99387-1-mahmoudmatook.mm@gmail.com>
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
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

to avoid manual calculation of min and max values
and fix coccinelle warnings such WARNING opportunity for min()/max()
adding one common definition that could be used in multiple files
under selftests.
there are also some defines for min/max scattered locally inside sources
under selftests.
this also prepares for cleaning up those redundant defines and include
kselftest.h instead.

Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
---
 tools/testing/selftests/kselftest.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tools/testing/selftests/kselftest.h b/tools/testing/selftests/kselftest.h
index 829be379545a..e8eb7e9afbc6 100644
--- a/tools/testing/selftests/kselftest.h
+++ b/tools/testing/selftests/kselftest.h
@@ -55,6 +55,13 @@
 #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
 #endif
 
+#ifndef min
+# define min(x, y) ((x) < (y) ? (x) : (y))
+#endif
+#ifndef max
+# define max(x, y) ((x) < (y) ? (y) : (x))
+#endif
+
 /*
  * gcc cpuid.h provides __cpuid_count() since v4.4.
  * Clang/LLVM cpuid.h provides  __cpuid_count() since v3.4.0.
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
