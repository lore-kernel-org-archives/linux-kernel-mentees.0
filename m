Return-Path: <SRS0=nWhl=GJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6271C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Jan 2021 03:05:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BD0722D6F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Jan 2021 03:05:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BD0722D6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DE76D86AF9;
	Wed,  6 Jan 2021 03:05:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ljb6829uiqrE; Wed,  6 Jan 2021 03:05:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5B9D384FC0;
	Wed,  6 Jan 2021 03:05:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 454BDC013A;
	Wed,  6 Jan 2021 03:05:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B978C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:04:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7039C85308
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yc-Y3VFLUeTL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:04:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6BC168511C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  6 Jan 2021 03:04:57 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id 22so1429609qkf.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 19:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s6kPsdrQGFtRIW15gnjfxayTfIR6vKrZhwi28iuMhA0=;
 b=dzwj0vmBYlMtkdxj6zzOPVRBCaUVvyHQ7MXQj4ItQJ6V1nI4vb8NJwfksMbPpvFVak
 nEGOhe0LjlPvvHH1CPMLCV5fM1P3KDYLUBS8qOQzmeR1h27v7Qg9E+yer0seApXtWOQY
 IA4Y7dyB+n/6LXPSDYl832rLDx2d2fGj4Hg8jUyTR1lxIddgc+B4frfQSvpa43d9N2fX
 Ugz3BFg3TOaxKByvkrtrzx+kfXKfXK6LE/R+c+uPZ61m4MBx/nepftaVQ/nYQgltzCjE
 5hXBftcAG+TfBuGT/lxEq5h80q4hUaKje/Pm30jgC77tolZX/fpF4IZUsyvZLItF6Kk/
 mwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s6kPsdrQGFtRIW15gnjfxayTfIR6vKrZhwi28iuMhA0=;
 b=L+GQ52EVK+sSusnC1SxkTbnEeTmb5aGv8yMl0KTyWAzudIFs9EZu/njD+BVhe9W0xn
 MMbbdgrKiAd+KEayoMDP3G1W/M1XTo5imov3vDoJ5wxsHpPy3paz7eh9WtsLrgRtoYSm
 wOMfyOV/R+503KNzZCyN1FQ4UD6x+C8p7b5kQBJMX3eJbabCiRi030rw0cJQH2DhZsPS
 6KTIY9YWGsY8dmlsp0U9bDbswu+X7/T6rKVBlZKggozk6lOVpvc1fyaZXuNNM7jH2G0C
 OL65RHkfM9/E1aAt/de0Gn5w358BDT2U9WJJP2NBo+qkfufaFi2+bCooOkS7ss0zuZkA
 nGoQ==
X-Gm-Message-State: AOAM531gFaORB3509UYs+09azEIIfa7sGZvm0GH6zO1LPFBGOIxyjqVh
 xLp8ChuMGUZqcqslZtAVYvg=
X-Google-Smtp-Source: ABdhPJyF4RtXgEU36C8YgcHsJ2JHyUGpVT62dayZsGYyv3EN3ffcQBVbB1GZWw7K6UYtY2KrRnhhCA==
X-Received: by 2002:a05:620a:13c2:: with SMTP id
 g2mr2532569qkl.174.1609902296433; 
 Tue, 05 Jan 2021 19:04:56 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:77d4:6fb0:85b3:b6f7])
 by smtp.gmail.com with ESMTPSA id n195sm730019qke.20.2021.01.05.19.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 19:04:55 -0800 (PST)
From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To: mchehab@kernel.org,
	hverkuil@xs4all.nl
Date: Wed,  6 Jan 2021 00:04:45 -0300
Message-Id: <20210106030449.3223172-1-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-media@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2 0/4] media: vidtv: add media
	controller support
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

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

This series adds media controller support for vidtv so that we can
support this driver at the test-media script in v4l-utils.

I based my implementation on vim2m's.

changes in v2:
	added missing #ifdef that otherwise prevented this
	code from compilling if CONFIG_MEDIA_CONTROLLER_DVB 
	was not set.

Daniel W. S. Almeida (4):
  media: vidtv: Add media controller support
  media: vidtv: reinstate sysfs bind attrs
  media: vidtv: use a simpler name in platform_{device|driver}
  media: vidtv: print message when driver is removed

 .../media/test-drivers/vidtv/vidtv_bridge.c   | 34 +++++++++++++++++--
 .../media/test-drivers/vidtv/vidtv_bridge.h   |  7 ++++
 2 files changed, 38 insertions(+), 3 deletions(-)

-- 
2.30.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
