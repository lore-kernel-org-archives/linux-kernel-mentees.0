Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E73C3DA58
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Aug 2023 17:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0545341922;
	Thu, 17 Aug 2023 17:08:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0545341922
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XafT0oWT
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bLauGSlbN_g6; Thu, 17 Aug 2023 17:08:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0E4C040347;
	Thu, 17 Aug 2023 17:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E4C040347
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D54DAC0039;
	Thu, 17 Aug 2023 17:08:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B6200C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 17:08:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90B1C41922
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 17:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90B1C41922
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XPHCRnNiWgSC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 17:08:29 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CC6B40347
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 17:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CC6B40347
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1bdc19b782aso295675ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Aug 2023 10:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692292108; x=1692896908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7NWIyxKHGTcZUh3pE/+j1hXTU1RElUSlh9m4J1oVdP0=;
 b=XafT0oWTXXtxTncl5MhBhEkug2jSN3luOh8Zhq8IcL5f3RHZNwfr2Tb4nv1AkbTGak
 QXfYnvUvTgxlGEDIt5WUBlHBu9ZXIixLc0w4Ljj5w7fOgoUAjyoVjimM3CQ8B4yO2QNJ
 zUp8d15eizIQ4yewsaBmNwz2NmU2uUvqG1oIltLtbrAn6d8IMjw7py6qk6kyziFFqpIk
 u2OZT4Shx4cond5guUG8TFA1RWgwfzhvCfxYF7eXdJKtZFMLW16k3GknxJm2JmCNa70g
 bJrI3URMs/q9XSxVVhgrPNMdvnPfdDaT0Co0X3GTBgwJOB5+YsM5UAAX6MRDJXpuZQ0o
 zl6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692292108; x=1692896908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7NWIyxKHGTcZUh3pE/+j1hXTU1RElUSlh9m4J1oVdP0=;
 b=jC716IpEbPyYfVtGe5ab56bfcl9vZKxsIOfvz2pWVOs/c1+27/XUVf/cuMYc+BbJ66
 PcdDkXVmDNVTIbe40cJrqfnd6TEsV0t6aFRl8cVDa7PXv+ym4vKGJ0SSrIWef76C+Ntq
 UMYzpyUoqefIOBKDI2zoqfKNC2C3eUhR2mLVHyLIEn1+Mru4CRtIipkSgw+Rj3PHBBy2
 z0WHpOvoMqHx8Euh2v/dLDC+/8KpwbMy0u+bq7kKLPNevGWqXttvxat3UcvvxEW+KfD1
 Y5OZykAMehO/CohEuyJYetHEhIZ9NEAzIUqnn6KILfvkU++sXlcD1lnX+6TVDImpVBxw
 GEbA==
X-Gm-Message-State: AOJu0YyCjMULaZvxxjGQGrHhgzPgbiUaYTuWbU0mKP8gadE4b1EHkPBs
 SZVeNz+T5SGQ89z7xB2HiOw=
X-Google-Smtp-Source: AGHT+IFr+3gG7MMJKJLLVSDApdX7jk8TogII4+aNPg9CqA42X0ljIhGCtwyPlK1gzyJ5sARF+JiFPQ==
X-Received: by 2002:a17:902:ea02:b0:1b7:e86f:7631 with SMTP id
 s2-20020a170902ea0200b001b7e86f7631mr14797plg.19.1692292108334; 
 Thu, 17 Aug 2023 10:08:28 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c009:58e9:c155:d912:d62a:88e5])
 by smtp.gmail.com with ESMTPSA id
 jw4-20020a170903278400b001bf20c806adsm19106plb.50.2023.08.17.10.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Aug 2023 10:08:27 -0700 (PDT)
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: naveen.n.rao@linux.ibm.com, anil.s.keshavamurthy@intel.com,
 davem@davemloft.net, mhiramat@kernel.org
Subject: [PATCH v1] samples: kprobes: Fixes a typo
Date: Thu, 17 Aug 2023 22:38:19 +0530
Message-Id: <20230817170819.77857-1-atulpant.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org,
 Atul Kumar Pant <atulpant.linux@gmail.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
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

Fixes typo in a function name.

Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
---
 samples/kprobes/kretprobe_example.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/kprobes/kretprobe_example.c b/samples/kprobes/kretprobe_example.c
index cbf16542d84e..ed79fd3d48fb 100644
--- a/samples/kprobes/kretprobe_example.c
+++ b/samples/kprobes/kretprobe_example.c
@@ -35,7 +35,7 @@ struct my_data {
 	ktime_t entry_stamp;
 };
 
-/* Here we use the entry_hanlder to timestamp function entry */
+/* Here we use the entry_handler to timestamp function entry */
 static int entry_handler(struct kretprobe_instance *ri, struct pt_regs *regs)
 {
 	struct my_data *data;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
