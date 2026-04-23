Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9DE21771B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Apr 2026 06:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776924183; cv=none; b=ZzVjtOF/XBAEZuMY5A/EXDc+GfiWTk8h2SmzQEQjHQPC6S8VdqYb+vZonedn0d2u620k4juntDHDV9AEwO6Nd8sTsduBR1RPeO9iMEQCZy5/Lv4ImJxxnq3bk9C0oXoIylOEwjDC679k5/ldDwDeF7gBUDz/A8I3rQuMWfmtoRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776924183; c=relaxed/simple;
	bh=ceEokkRv7J/gIQScaEcq2PSqrKrV/4PD5eqMMtVhjDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cE7dCLPEy4w1A6+0glptdnPhIcYP7vTMXe6jkzyRB3awqZ22sE7RfaCeZOhCjYGP379sPvhgkQ9wzkyX6K9NGjkTGErxr7pXVyDamp5SfVbpiP1RYGuHaRjCRKSLZjlB9U+yLqFuS/ieK0gC7KzYh41yq4o/GM3CyOHWEVsoTqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5Hs4rBL; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5Hs4rBL"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD3FC60B6E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Apr 2026 06:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDZc9zt-V65y for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2026 06:02:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47DA560B6B
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47DA560B6B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=j5Hs4rBL
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 47DA560B6B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Apr 2026 06:02:56 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35e576110adso4260658a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 22 Apr 2026 23:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776924176; x=1777528976; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TbfsvgaTL4tZwAILAQQupP5ysgI2o47XYAQ59piLtY=;
        b=j5Hs4rBLTQjP98agS6iEX7f0S23DiX3HU9qWhRqi4nYT4abUohkQfCDWKDRtygBoNh
         RTnMjT06qlzu2NZVKigSnzUXdv5vgyhuTip1iSj21xGo61EP+INeDpBdcGZag+hzsZOe
         o8O7B9Ty7NGAWQApLAYmLKjEMnsfit0Y/QFyrh0+kUzcGrNc42f0VAfnTgV8cz5UOwik
         8do/3FcPECsLikPPmFCdwXF5V85lK6oX41s2/kzVLskfMui0HrkxysLExWH0t46kWmBK
         uvlt83dOYnR3Iv4OIF/ow9xF4o8PTJTx5NfX3h5O/JvfOj2szZDJeoGpKxU//kq8ehOW
         urcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776924176; x=1777528976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TbfsvgaTL4tZwAILAQQupP5ysgI2o47XYAQ59piLtY=;
        b=ObsOHOPl4xk+HAj14yXWxZ4jrW/oB8C84hYWKkvr/if54jRhFeF3ScNlrMlDhX5Qrc
         jOjnU9qesReCp5ocL6Sgim5lENDPNf01317jYGwLne99pqCeQq4+60vV34omGx1hiScV
         TDSy+dERa4/ecfMsLHZ9WTM3E1YCzS0UGRgQ5rfWHFa8++Jr+qT5jTWar1pyxtVzL4nJ
         ANs6s/5sO5U+/yuDHQj0nTj0irpZCJks3kZtT+VvjI6Xib1uuzwIfGHccXEo7kC2Yhz6
         3d7BRfTtUyrBMJq7o4XiRbHk+HPuAi5IETG9YZBO1uX6DIGAgqM0xVWwBu38Z88JZQbT
         9daA==
X-Forwarded-Encrypted: i=1; AFNElJ9poup/H3srcpq8bc+4c6bjI9ngMvsNukqMyblvlekc87WIHPZj2UOPM2T8BB7D09tuowccbrYIDsCwG8TagKi+SpXeEQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz1fMopCNnqfNtKmlMT38StUm3JeJZNGX6AwfpQl1HBrkf6eLpO
	dSXJ4v3SOzxhmvqrWkNuJwXsAPeW9vcyZSiFYA8RQDa88mGCZt2vQE3l
X-Gm-Gg: AeBDieunZMf0ozUUygSdwvLKuZKhbKB1tyZoqqz3xqwQS3EJ4pgo0fQg2ezqt/qvLyZ
	g8LOfv/C5fLySqtZmag6/FQuks1n4r7171zHTIMhDz3JN7vBRfa9NsvwkWLDiYyRUV4MTa1s2wg
	1m4pfgnZYo5hNDKqUjfeHJs1JUZhcaj1IYVWX4oUkbTYg9Foisx49YrTNPlbvApJkqxpoOUGThU
	rIbtu/8n1xKC7yfsnD+DABjQUPdVBeaDxLoz254qfrtV9Lt5mwE8sluz5UlZK+LyazllVJiZLGM
	6NrHf9X2rbjRG2PqUzbR1Ft78XbXVbsZZ/tlkIJbht19RUoQjpDVR4xbBUCzOXYBW0gs+J5s++4
	5p+KredtVg18bBSRkv92d5szMn7m2vLtfQWhnZuBdq32Hde9wkl0sEgISVmXUmgK2CO91bM6DYC
	QHa2gNdbkHq+mpFyIyKwQTOS8tn+p4ejnazw==
X-Received: by 2002:a17:90b:3d02:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-361401ec4b4mr20061094a91.5.1776924176225;
        Wed, 22 Apr 2026 23:02:56 -0700 (PDT)
Received: from soyboi ([158.140.171.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a9fbsm24479325a91.11.2026.04.22.23.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 23:02:55 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH RFT] media: atomisp: Add error check in create_host_regular_capture_pipeline()
Date: Thu, 23 Apr 2026 13:02:46 +0700
Message-ID: <20260423060246.296986-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When calling ia_css_pipeline_create_and_add_stage() function, there's no
condition to check whether ia_css_pipeline_create_and_add_stage() throw
an error or not. So add conditional check for the return value of
ia_css_pipeline_create_and_add_stage() function.

This is reported by Coverity Scan with CID 1408952 as UNUSED_VALUE.

Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
I am not sure if omitting the error check is intentional or not, but from
what I see from another ia_css_pipeline_create_and_add_stage() usage
in the same function, we check the return value after the call and return
the error code if it's non-zero.

I also don't have the device to test this change.

 drivers/staging/media/atomisp/pci/sh_css.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..6aa8a883cc76 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -7041,6 +7041,10 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 			err = ia_css_pipeline_create_and_add_stage(me,
 								   &stage_desc,
 								   &current_stage);
+			if (err) {
+				IA_CSS_LEAVE_ERR_PRIVATE(err);
+				return err;
+			}
 			local_in_frame = current_stage->args.out_frame[0];
 		}
 		err = add_capture_pp_stage(pipe, me, local_in_frame,

base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
-- 
2.53.0

