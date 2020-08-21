Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6346FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 12:48:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 282C42078D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 12:48:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GN2/HyCM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 282C42078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id ED85320408;
	Fri, 21 Aug 2020 12:48:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D8+ejJTf119M; Fri, 21 Aug 2020 12:48:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 223DC20360;
	Fri, 21 Aug 2020 12:48:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09A0EC07FF;
	Fri, 21 Aug 2020 12:48:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53934C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 12:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4DB5620408
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 12:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n3-zW3tUu2vi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 12:48:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id F066E20360
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 12:48:42 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id m71so1032764pfd.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 05:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YAj+ZHFEhi6DkE5EadqxNJjUQhpwoFMrhs/00bSdKUM=;
 b=GN2/HyCMile6eX0I8wDeO11bNFyoKrKRkByJ5dBfneQo1rktDNPo4H8eMjfCGnC7FC
 euGiEDsn1TWo9kS2CPHT95v9cPTtzDUJs2AGfNBbY+FTfsXw/VCEZoi3vmmS2+HsZwB3
 7kLk6NRz2gRKvZfVlMv9Xe8B84c7G9Gg3PcRZmEs/k6gPxYEqenwBLdfPiQCooSO2HBb
 Vm0QsFlUlV8VjYMWbEDVlqLhL2z5I4ZzDa5sN0nczTmYQT31lfGDJ7hwvJmnT6MwSwG/
 AsmtLuhutRpWwm7J8cRMLdHxcvlKRu2S6VBsjgYCrqzPb7SQXPl0cpjDHyiitnZWSTWN
 YJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YAj+ZHFEhi6DkE5EadqxNJjUQhpwoFMrhs/00bSdKUM=;
 b=LHsSAikfAsmYD7Mc9E1ZLx9HN0iDphbYhF/RtG6k9HEgQ2elX3UDU3Bi4xKm6voOIK
 BBehGv0c5zI/FgOFA3FEK7hRu7ItyyOUjyYYmI/Bxs59erEtzbZAVFJPir3VIeEwBSiX
 I5DoLrjGv0CqbpIYzShpI/0m8NGQfQEu3tVQF89DUrPBOAXKXmHM6VkSfw+EXH+JGfXP
 fRKfrW0Q10xLNthsIyrgbGFpPHr9udJUfD+ON1O5OSbwEb9pzhvr+gccyM4z+wiTS+0B
 lxaKlR75yCEcU2ww6jahQSvDaA95Yj6LO4mMss5lMcRan38lQt9O2dB0J8jUVuF9k0+j
 tUbA==
X-Gm-Message-State: AOAM532aQiW8uwOmpkoDo+iATzKhLIleUSOaJAJbf1EE0TchUU729Mxc
 joVcKxrTHuEwcR/R+dXJ9w==
X-Google-Smtp-Source: ABdhPJycqqj97WmndmIB3OwSgFsbVw33CadUqAHlJRa6VhQFdVhwboO2MZyWw3P6qvzoqZWcTTMUtA==
X-Received: by 2002:a62:1c58:: with SMTP id c85mr2341720pfc.105.1598014122415; 
 Fri, 21 Aug 2020 05:48:42 -0700 (PDT)
Received: from localhost.localdomain ([2600:3c01::f03c:91ff:fe6e:64cd])
 by smtp.gmail.com with ESMTPSA id d13sm2598787pfq.118.2020.08.21.05.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 05:48:42 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Date: Fri, 21 Aug 2020 08:46:45 -0400
Message-Id: <20200821124645.495649-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200810050532.640075-1-yepeilin.cs@gmail.com>
References: <20200810050532.640075-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: Vandana BN <bnvandana@gmail.com>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] vivid: Fix global-out-of-bounds
	read in precalculate_color()
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

vivid_meta_out_process() is setting `brightness`, `contrast`, `saturation`
and `hue` using tpg_s_*(). This is wrong, since tpg_s_*() do not provide
range checks. Using tpg_s_*() here also makes the control framework
out-of-sync with the actual values. Use v4l2_ctrl_s_ctrl() instead.

This issue has been reported by syzbot as an out-of-bounds read bug in
precalculate_color().

Fixes: 746facd39370 ("media: vivid: Add metadata output support")
Reported-and-tested-by: syzbot+02d9172bf4c43104cd70@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=02d9172bf4c43104cd70
Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
I'm not very sure how to name this patch since we are fixing a bug in
v4l2-tpg by modifying vivid.

Change in v2:
    - Solve the root of the problem instead of adding more boundary checks
      in precalculate_color(). (Suggested by Hans Verkuil
      <hverkuil@xs4all.nl>)

 drivers/media/test-drivers/vivid/vivid-meta-out.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-meta-out.c b/drivers/media/test-drivers/vivid/vivid-meta-out.c
index ff8a039aba72..95835b52b58f 100644
--- a/drivers/media/test-drivers/vivid/vivid-meta-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-meta-out.c
@@ -164,10 +164,11 @@ void vivid_meta_out_process(struct vivid_dev *dev,
 {
 	struct vivid_meta_out_buf *meta = vb2_plane_vaddr(&buf->vb.vb2_buf, 0);
 
-	tpg_s_brightness(&dev->tpg, meta->brightness);
-	tpg_s_contrast(&dev->tpg, meta->contrast);
-	tpg_s_saturation(&dev->tpg, meta->saturation);
-	tpg_s_hue(&dev->tpg, meta->hue);
+	v4l2_ctrl_s_ctrl(dev->brightness, meta->brightness);
+	v4l2_ctrl_s_ctrl(dev->contrast, meta->contrast);
+	v4l2_ctrl_s_ctrl(dev->saturation, meta->saturation);
+	v4l2_ctrl_s_ctrl(dev->hue, meta->hue);
+
 	dprintk(dev, 2, " %s brightness %u contrast %u saturation %u hue %d\n",
 		__func__, meta->brightness, meta->contrast,
 		meta->saturation, meta->hue);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
