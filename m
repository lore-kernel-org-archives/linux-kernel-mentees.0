Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C0B63D8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 07:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mk1Jl2Uo"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD2FB822C5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 07:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD2FB822C5
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mk1Jl2Uo
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UPAVnDolQDkQ
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 25 Nov 2023 07:38:09 +0000 (UTC)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3C324822B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 07:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C324822B2
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6c4eaa5202aso2518228b3a.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Nov 2023 23:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700897888; x=1701502688; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4JkLSQxu72A0kXiJvpqBGPzheBm60khT4FXTWA7Mes=;
        b=mk1Jl2UoL4tii5K65ekz2S2hZ1rCkFhTb/Of5b0sYScU2NffgBHypsG01HnIX1tBy/
         /Y73qMoX0+UXYT8Jde0YDNHAWGBs0Cn9E5Om/pS4Umw5dmc9b2P8KRu0cGJffShaDZig
         0lmlU8izb50HDOLMTxRqFkD3JSvJ4BI7++LElKoPDAIdP+Q6RjpPyG8FbR4ZW+y7pwhr
         HDomHgCfLF+tbs3Fp2dqYX0fMYegb2C8Y1qKGgcdw4A30/jSpp9+GhFW5dIcc/Okkzhv
         eSpltQ2Y2qRTXR8nw4DkgTthzZMqDthPePgpB7hMKwuqLsvXYGdbPySo/RidYXMfRYeK
         5Dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700897888; x=1701502688;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4JkLSQxu72A0kXiJvpqBGPzheBm60khT4FXTWA7Mes=;
        b=rtJXEqodo9UxjMJotRC4XUVFckJK7OaYqBpgoVPN9CbMCjhuCd/3d7ZNjfYl3YP9Zp
         pXU90G9H7/xDRwSjMZ9jNbFBwvuEota0bFB58PdXCN9JUQAgXuKUpELmy7ZIFdRuDzQu
         v8AID7sqaBaZwAGEARBiA69AZbjE7YFhsIP9pExnfhriww0dGie2SW5C2OFF25gvPQrw
         lfS+NSS4Sb87ck/TrIsjfLFjU941PLIsIfGljV1ImEPx5dvHlHCDNTP7kV96jOZaJqZg
         y35EPnM0HtdaRh9Eo+1ePxcl3+55c1/3aTwrF1xpAttpyO53pgzbHumTJnEyLkZ7xT1d
         TmAA==
X-Gm-Message-State: AOJu0YwWlsYzjTXUZf3Ng2dApjLQOc2mE+06/oP2ydc0Lpo+EiQwmpRy
	lF/cQiVRgcS3hDVepwQFM4I=
X-Google-Smtp-Source: AGHT+IGDI1LFtz9dBYBNDPR5osoWC6EhBp6lcBl4dvBLfPB5E8nzXe7WawYfRjW/cy3U92EQ1xa+oA==
X-Received: by 2002:a05:6a00:e0f:b0:6cb:d2cb:5234 with SMTP id bq15-20020a056a000e0f00b006cbd2cb5234mr6181755pfb.32.1700897888435;
        Fri, 24 Nov 2023 23:38:08 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:716a:b035:3f6f:ef07:d897:b98e])
        by smtp.gmail.com with ESMTPSA id j7-20020a62e907000000b0069323619f69sm3911981pfh.143.2023.11.24.23.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 23:38:08 -0800 (PST)
From: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
To: ezequiel@vanguardiasur.com.ar,
	mchehab@kernel.org
Cc: Ghanshyam Agrawal <ghanshyam1898@gmail.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Phillip Potter <phil@philpotter.co.uk>
Subject: [PATCH V3] media: stk1160: Fixed high volume of stk1160_dbg messages
Date: Sat, 25 Nov 2023 13:07:38 +0530
Message-Id: <20231125073738.649948-1-ghanshyam1898@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function stk1160_dbg gets called too many times, which causes
the output to get flooded with messages. Since stk1160_dbg uses
printk, it is now replaced with printk_ratelimited directly.

Suggested-by: Phillip Potter <phil@philpotter.co.uk>
Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
---
V3:
Fixed the issue with my patch needing previous versions being applied
first.

Used printk_ratelimited instead of dev_warn_ratelimited because
of compiler error "incompatible pointer type".

V2:
To add KERN_WARNING in printk_ratelimited, and later as per warning by
the checkpatch script, replaced  printk_ratelimited with 
dev_warn_ratelimited.

V1:
The function stk1160_dbg gets called too many times, which causes
the output to get flooded with messages. Since stk1160_dbg uses
printk, it is now replaced with dev_warn_ratelimited.

 drivers/media/usb/stk1160/stk1160-video.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
index 4e966f6bf608..98417fa31d70 100644
--- a/drivers/media/usb/stk1160/stk1160-video.c
+++ b/drivers/media/usb/stk1160/stk1160-video.c
@@ -107,8 +107,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 
 	/*
 	 * TODO: These stk1160_dbg are very spammy!
-	 * We should 1) check why we are getting them
-	 * and 2) add ratelimit.
+	 * We should check why we are getting them.
 	 *
 	 * UPDATE: One of the reasons (the only one?) for getting these
 	 * is incorrect standard (mismatch between expected and configured).
@@ -151,7 +150,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
 
 	/* Let the bug hunt begin! sanity checks! */
 	if (lencopy < 0) {
-		stk1160_dbg("copy skipped: negative lencopy\n");
+		printk_ratelimited(KERN_WARNING "copy skipped: negative lencopy\n");
 		return;
 	}
 
-- 
2.25.1

