Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52692C001DC
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Jul 2023 15:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBA8A40138;
	Sun, 16 Jul 2023 15:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBA8A40138
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rij7/W12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mObDEQHHxLjP; Sun, 16 Jul 2023 15:45:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BD1A5400FF;
	Sun, 16 Jul 2023 15:45:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD1A5400FF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9290C0071;
	Sun, 16 Jul 2023 15:45:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2273C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 15:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C47A40138
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 15:45:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C47A40138
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CMu13FG8ItZQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 15:45:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5F12400FF
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5F12400FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 15:45:00 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-55b22f82ac8so3005620a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Jul 2023 08:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689522300; x=1692114300;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WvKLyYGop2dMHaRt6lb3hw8V7SqDURLCw/b6W7tR2ZQ=;
 b=rij7/W128RMSEHRjPkvt2CSFG40Sv7oKrGqKjz6K6bq9S/PM+IchTptN3BawFLhJ/r
 ym4Ih+Qj1qsriFIa/Puu6Tmz9/vqoq4oZXOGfmuYL4jxvXeK/E0Y1w+bggUP8FEiEOzs
 tgMRyEi9rAUgNWr+tF8/la+/kblt3PSWYZ7dinO7J1usDeZ9LZqi7UQ8Ot/XzV0wbzKq
 bY/Byn+4wu4jCZRnC5VvQTi8V7NMCF61Z3jszJFIdCqHVtPCzb2tSefH6Raw9ju5qd8B
 QeE3Lu+ZuvSmV8hXrkHadkluWwPDvoOgURv6J3vtmbkpM7RDrAZs/RKUtnminlv37ag3
 Ce8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689522300; x=1692114300;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WvKLyYGop2dMHaRt6lb3hw8V7SqDURLCw/b6W7tR2ZQ=;
 b=hlUyQmahFbWPaQ00IBGfSPUi3KoNJ3g9iTTuKsGUuJ9JAzqVFkxxQ4+h4hVDj1vxLM
 Ol/L0r22YOaYU4rqWqTFM26aDOLtH6aUlSNWfXJIpqoQ1bS0Y6ml7aHtnKJNX0JbPNSQ
 fRQf6+W1wwwCJiLbWUck0Knkisx9WzEKXctUGg0FwqH2e6Vlt4yTc0Ay4SJJ/OTfW7R8
 eDTrMQS4SlZZQgBCr2uudmuVjNVstEn58aDQIdaH3PAePT1FDYnOb2+6G7fospFJzR+T
 NZ2jWmbLHPHOPAJhTIBR2lVJyondM+Bg/PxmFCeLCYbEArlJaopVTA3k0j1dvi8sLLFz
 JjqQ==
X-Gm-Message-State: ABy/qLaZGOEqzrrDHEUdAqesCIAcZYO5DLNTDJnmPcr4ePUPtxC4ogwr
 Q/pgmteJietc84s6Izyy4ME=
X-Google-Smtp-Source: APBJJlFFuuZv23TJkkzP/61j9KUMip1D69gCdXdZz9eTEN+hWwdErmMNiT9ipAQ/A7/wIMXeZV0kjQ==
X-Received: by 2002:a17:90a:e594:b0:262:ec12:7c40 with SMTP id
 g20-20020a17090ae59400b00262ec127c40mr10127878pjz.11.1689522299885; 
 Sun, 16 Jul 2023 08:44:59 -0700 (PDT)
Received: from [192.168.1.9] ([222.252.65.171])
 by smtp.gmail.com with ESMTPSA id
 26-20020a17090a031a00b002609cadc56esm4086575pje.11.2023.07.16.08.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Jul 2023 08:44:59 -0700 (PDT)
Message-ID: <d4080db5-1825-2848-079a-8bb674d8ee44@gmail.com>
Date: Sun, 16 Jul 2023 22:44:56 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: william.gray@linaro.org, rongtao@cestc.cn, ricardo@pardini.net
From: Anh Tuan Phan <tuananhlfc@gmail.com>
Subject: [PATCH v2] tools/counter: Makefile: Replace rmdir by rm to avoid
 make,clean failure
Cc: linux-iio@vger.kernel.org,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-kernel@vger.kernel.org
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

Use rm -df instead of rmdir -p since rmdir requires the directory exist
so it causes "make -C tools clean" failed if someone only builds other
tools but not counter.

Fixes: 228354ed692f ("tools/counter: Makefile: Remove lingering
'include' directories on make clean")
Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
---
Changes from v1:
- Use rm -df instead of checking the directory exists
- Add Fixes tag
- Update the patch title
Reference:
- v1:
https://lore.kernel.org/all/362e127d-6018-5fc6-247b-3c729b99d946@gmail.com/
---
 tools/counter/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/counter/Makefile b/tools/counter/Makefile
index a0f4cab71fe5..b2c2946f44c9 100644
--- a/tools/counter/Makefile
+++ b/tools/counter/Makefile
@@ -40,7 +40,8 @@ $(OUTPUT)counter_example: $(COUNTER_EXAMPLE)
 clean:
 	rm -f $(ALL_PROGRAMS)
 	rm -rf $(OUTPUT)include/linux/counter.h
-	rmdir -p $(OUTPUT)include/linux
+	rm -df $(OUTPUT)include/linux
+	rm -df $(OUTPUT)include
 	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete

 install: $(ALL_PROGRAMS)
-- 
2.34.1
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
