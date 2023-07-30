Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DACEB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 30 Jul 2023 23:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B17B40948;
	Sun, 30 Jul 2023 23:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B17B40948
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=I9YTzw1m
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CaSD6X1ZGgFu; Sun, 30 Jul 2023 23:15:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E2F58403B4;
	Sun, 30 Jul 2023 23:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2F58403B4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5163C0072;
	Sun, 30 Jul 2023 23:15:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 389DAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 23:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 075994048F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 23:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 075994048F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e_Ba83xqVjnv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 23:15:01 +0000 (UTC)
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E83084031F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 23:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E83084031F
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-1bb571ea965so2883812fac.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 30 Jul 2023 16:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690758900; x=1691363700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vQqHt2uxSiFtz5bvMHZ0lEIjoZsbVYU5ay8C1vE7uws=;
 b=I9YTzw1mLNgntSZUV8B1BAha2qtbMMvmRl65nC+Sy6n9PTk+HZ9u05IGG0C3v+Q/PS
 tO7bAFEcXhyEO76eJCkMoLUiTrs25DC/1pYzw4h15vhQ7lTrQ459+flWzmA70QeRLBu4
 iIrU3bU7eFWfm5X7o4jfkTubFZ/mn4AMn2ZuZ75C8ekoSy5Q4FN+0QhIBvYHbweoPhqg
 nir4CEqXqdvNbPPwlbMvtfkQYQeqvwW/Llb2SV7b8Qi4aWgh448pRUQOlXzoK6fBRdNF
 y5TPF/w5Ummrki4JYFNn4VdDHJ72dKtmGVk0OFsaOqgzQGqJ51aB0LSIIrLOcwzJnxIm
 6VGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690758900; x=1691363700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vQqHt2uxSiFtz5bvMHZ0lEIjoZsbVYU5ay8C1vE7uws=;
 b=Ej3ydvfPXQz8LoCjEJPx/+v38JEzZNbAFgcKi5Zu4iffDgpUUbqWYyEjFC5ob/jp9u
 EOFXbEitjPALchhcM0CMLdMsA2JjQDm/vzjielNgGhMUF9TKt3v18oQlzpdbf79LIs8K
 xmG1N6FyiJcATDfEGugUM8RehGGjf5wmZaffrcpCz9sU8RmoGtQVnfM7unFGKDG7SUx/
 FqzSuAm06LoCT2xSBlWsHFoq1rvTPW822HSRQNscepvffMsmUAoo9l6mCsbHbfmZwkjb
 waFoKcgqalz5PH2jOZq2gs5ClIxk2bVa/JasOoouCWN7Mn/ek/jHmaaPHJ0M8ZUDNeMg
 /n+g==
X-Gm-Message-State: ABy/qLZl/b/0b6YlQuSVQBsxyMREucq+TfVKKeOr3fQheadirGug9JfD
 R1ANVjUhpI4GpqbF9HV4dLQ=
X-Google-Smtp-Source: APBJJlFvXrPhfGB6V8m/F6oHt5/sxi7GjM+YN0/fVNHwFOFmb8Cyv1Wdzr3HOP1BVPMZvniCsJP+6w==
X-Received: by 2002:a05:6870:f589:b0:1ba:dbbd:31cf with SMTP id
 eh9-20020a056870f58900b001badbbd31cfmr8759888oab.7.1690758899652; 
 Sun, 30 Jul 2023 16:14:59 -0700 (PDT)
Received: from rajgad.hsd1.ca.comcast.net
 ([2601:204:df00:9cd0:f50b:8f24:acc4:e5c])
 by smtp.gmail.com with ESMTPSA id
 y15-20020aa7804f000000b0066a4e561beesm6560867pfm.173.2023.07.30.16.14.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jul 2023 16:14:59 -0700 (PDT)
From: Atul Raut <rauji.raut@gmail.com>
To: avem@davemloft.net
Subject: [PATCH] net/macmace: Replace zero-length array with
 DECLARE_FLEX_ARRAY() helper
Date: Sun, 30 Jul 2023 16:14:42 -0700
Message-Id: <20230730231442.15003-1-rauji.raut@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: rafal@milecki.pl, netdev@vger.kernel.org, pabeni@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org, kuba@kernel.org
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

Since zero-length arrays are deprecated, we are replacing
them with C99 flexible-array members. As a result, instead
of declaring a zero-length array, use the new
DECLARE_FLEX_ARRAY() helper macro.

This fixes warnings such as:
./drivers/net/ethernet/apple/macmace.c:80:4-8: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

Signed-off-by: Atul Raut <rauji.raut@gmail.com>
---
 drivers/net/ethernet/apple/macmace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/apple/macmace.c b/drivers/net/ethernet/apple/macmace.c
index 8fcaf1639920..8775c3234e91 100644
--- a/drivers/net/ethernet/apple/macmace.c
+++ b/drivers/net/ethernet/apple/macmace.c
@@ -77,7 +77,7 @@ struct mace_frame {
 	u8	pad4;
 	u32	pad5;
 	u32	pad6;
-	u8	data[1];
+	DECLARE_FLEX_ARRAY(u8, data);
 	/* And frame continues.. */
 };
 
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
