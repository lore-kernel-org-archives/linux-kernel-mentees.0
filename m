Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49571EB64DA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Jul 2023 14:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D92D4812B7;
	Fri,  7 Jul 2023 14:08:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D92D4812B7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Gtvf7fMa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwglCdxd5hDt; Fri,  7 Jul 2023 14:08:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E8348812A7;
	Fri,  7 Jul 2023 14:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8348812A7
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C650BC0072;
	Fri,  7 Jul 2023 14:08:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86CDAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 14:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6131260B4C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 14:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6131260B4C
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Gtvf7fMa
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DLvJJwpVWhum
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 14:08:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C49D7600D4
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C49D7600D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 14:08:38 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-666ecf9a081so1509448b3a.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 07 Jul 2023 07:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688738918; x=1691330918;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=byS32hr7erdZTY+UcfjyedfSymtmrjNME4C/JkAVrAg=;
 b=Gtvf7fMaliZ6uI2lM9dnMHMK6mzfpfEuO/GqOV7nEu5GzGYDa+Bbdv3X360RueV0hS
 jYo23omOWCHyVEWxyrYmrhZ/nid41To0GuBupf6Eu94/j5ETECXXcYnYWG1IlZCj9R6z
 h+zolelfjB1hI+b4GuYfH0L1HyCxAWOMDeMTmTbFGIVapb11XXzkk02ny38bq1+u+kya
 191pWyzQlhqiDgilWndh1Dr9JwSZwTB5xNQ0+YZb5gXkC66Vy9qWoWaruFR/JDFIlfqO
 dE1NSTu4fZ/RA8A61cNAz/LDND26Rw8yvbLE8ne/tsSXdtKF4a277rh+iTm7yntkDVOK
 LWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688738918; x=1691330918;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=byS32hr7erdZTY+UcfjyedfSymtmrjNME4C/JkAVrAg=;
 b=XTeEER56yiD9AcM4YdlQ3zCJ5KaAxn5V5UITWfCqiaVQWL3pg5mObJdYj+JVhAvx2X
 0/oUI1n2adByaFio3+CQyCneGOV+pcxqPMLEXsJZz5+/SSsb42dNfj31vV/qA9VmWTKl
 22YmhOhSg+fhix4vEQLOHPASJ0Od4WGeKP5RwftwBajTPxalMPaq+zlqtPlhjIaY9R/1
 N2UnrdiWz5+h3koPowz1izbPVcgasHHwrI9L/p7Jh/l3OzYddNb2cxFVJHZcu0Aw+J+R
 fKPUheVEjVJXRwszHvIHKIlfcW+/v3AiRzaTnlDB8HjqI2aVW82/h79WvIxVdtgu+qjo
 n/0g==
X-Gm-Message-State: ABy/qLYxZLVvg/h2s0/WaQzr7dVPOrS08gWb3MraslRxUDMF50pyjMUJ
 H3uDvU33GzYwkkIs/T8TezA=
X-Google-Smtp-Source: APBJJlEt65ZV2IYcbmD1Ogi6pKlV19dODRyqUIJS9fzwgmU/9Pj+zC2Uxot7KwOV2Lc17mHbSFIk0g==
X-Received: by 2002:aa7:8895:0:b0:66a:2ff1:dee3 with SMTP id
 z21-20020aa78895000000b0066a2ff1dee3mr4752885pfe.6.1688738917650; 
 Fri, 07 Jul 2023 07:08:37 -0700 (PDT)
Received: from [192.168.1.9] ([14.238.228.104])
 by smtp.gmail.com with ESMTPSA id
 w21-20020aa78595000000b0064378c52398sm2968662pfn.25.2023.07.07.07.08.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 07:08:37 -0700 (PDT)
Message-ID: <362e127d-6018-5fc6-247b-3c729b99d946@gmail.com>
Date: Fri, 7 Jul 2023 21:08:35 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: william.gray@linaro.org, william.gray@linaro.org,
 linux-kernel-mentees@lists.linuxfoundation.org
From: Anh Tuan Phan <tuananhlfc@gmail.com>
Subject: [PATCH] tools/counter: Add checking directory exists for make clean
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

rmdir requires the directory exist so it causes "make -C tools clean"
failed if someone only builds other tools but not counter. This commit
adds checking the directory exist before doing rmdir.

Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
---
 tools/counter/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/counter/Makefile b/tools/counter/Makefile
index a0f4cab71fe5..2907f3b3094b 100644
--- a/tools/counter/Makefile
+++ b/tools/counter/Makefile
@@ -40,7 +40,9 @@ $(OUTPUT)counter_example: $(COUNTER_EXAMPLE)
 clean:
 	rm -f $(ALL_PROGRAMS)
 	rm -rf $(OUTPUT)include/linux/counter.h
-	rmdir -p $(OUTPUT)include/linux
+	@if [ -d $(OUTPUT)include/linux ]; then \
+		rmdir -p $(OUTPUT)include/linux; \
+	fi
 	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete

 install: $(ALL_PROGRAMS)
-- 
2.34.1
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
