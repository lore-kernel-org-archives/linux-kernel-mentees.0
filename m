Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F61C00140
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 15 Aug 2022 07:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB1F681A24;
	Mon, 15 Aug 2022 07:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB1F681A24
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=N2pYGvni
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wg1Yv3uw030f; Mon, 15 Aug 2022 07:01:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DD6FD81258;
	Mon, 15 Aug 2022 07:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD6FD81258
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA668C0032;
	Mon, 15 Aug 2022 07:01:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD960C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 07:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7863481A5C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 07:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7863481A5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wQZCAHpyGGUw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 07:01:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D322281A24
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D322281A24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 07:01:22 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 q7-20020a17090a7a8700b001f300db8677so6017031pjf.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 15 Aug 2022 00:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=lBxuKExwJiydRUzCxRZG0pdDOfLn9vnu6Gvrg3IOunk=;
 b=N2pYGvniog5ztC4WpHJhrj6BeJx9tktZsy+GCUmnqRhXpAxABkZ5aqV9Q0nkMNfvgS
 ir2vahkblaz1/952V515s81n2Db6xV+r6LR9ZFy5etUzT0MD/rkgSC+aQS18vQ7PeQq3
 EV8RTskC5koFGiIDYAyZETNdqzN0BJQLix4lR7x8vmaMTI14jzOKqJvyAWzXi+Q0FaGK
 xpkXSvzYKRIpRF6K9td0tdRAwp+70PzydSVHL477nXuTwLZLw85Mb7fTaIwvHJdjpPGO
 cFMzSaiNmWBQ2Dq9jDn1rUCV8uFPuuNcsPPCf13pmU2xAAbvM2C3ToEIqPiVa6wQS0Wn
 epSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=lBxuKExwJiydRUzCxRZG0pdDOfLn9vnu6Gvrg3IOunk=;
 b=xUZremf9sEKkH1D7VUr0rxhVXd7a9SCGDqjuyi2+SHZj3jt8+QVtXv8yqBUtStDISZ
 EcvhHUyEuOgUGGcqCoLXIBBnI7C/KYftWEsINb/JihY9h47CtM0nkNu4L89hHs9lNzZ7
 SD4oXt6/oOBsvWQm/t4noDqDLyvMqYoD1eCpLWlhXa+tBS/p+Mab4v/M9OP3yNCQ9Utq
 AxSaJgEqOo9Oz22Jrudhlh6vwpqnVOXCygew3lxRsnz9NHUCqEQ04ZGVWOCjD2ludWWy
 gv8afPZ2lDxAtO+nwJ6xYQpf3EvzVCjxRU0+mXKsMEWEQwWAMmAyBeEFHj2PN/qdvQbS
 ejbQ==
X-Gm-Message-State: ACgBeo1FDBG865Sn+eMkelSi6HlKc3WgtHyv4DIusSAdFO3HoTCFpg/4
 teqbUtc0j0FoH2E/zNwboDs=
X-Google-Smtp-Source: AA6agR7sVypDFOcf7uuBLF8hsvBcfE4nZsErFsVMqm9kaY77S3uHGMBjMpNocX1KWARSUXPR0DWzEA==
X-Received: by 2002:a17:902:d4c1:b0:16f:8311:54bc with SMTP id
 o1-20020a170902d4c100b0016f831154bcmr14884497plg.25.1660546882289; 
 Mon, 15 Aug 2022 00:01:22 -0700 (PDT)
Received: from fedora.. ([103.159.189.139]) by smtp.gmail.com with ESMTPSA id
 g2-20020aa79dc2000000b0052d27ccea39sm6224743pfq.19.2022.08.15.00.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 00:01:21 -0700 (PDT)
From: Khalid Masum <khalid.masum.92@gmail.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH linux-next] drm/amdgpu/vcn: Remove unused assignment in
 vcn_v4_0_stop
Date: Mon, 15 Aug 2022 13:00:56 +0600
Message-Id: <20220815070056.10816-1-khalid.masum.92@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Cc: Wan Jiabing <wanjiabing@vivo.com>, David Airlie <airlied@linux.ie>,
 Pan Xinhui <Xinhui.Pan@amd.com>, Sonny Jiang <sonny.jiang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Ruijing Dong <ruijing.dong@amd.com>, James Zhu <James.Zhu@amd.com>,
 Leo Liu <leo.liu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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

The value assigned from vcn_v4_0_stop_dbg_mode to r is overwritten
before it can be used. Remove this assignment.

Addresses-Coverity: 1504988 ("Unused value")
Fixes: 8da1170a16e4 ("drm/amdgpu: add VCN4 ip block support")
Signed-off-by: Khalid Masum <khalid.masum.92@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
index ca14c3ef742e..80b8a2c66b36 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v4_0.c
@@ -1154,7 +1154,7 @@ static int vcn_v4_0_stop(struct amdgpu_device *adev)
 		fw_shared->sq.queue_mode |= FW_QUEUE_DPG_HOLD_OFF;
 
 		if (adev->pg_flags & AMD_PG_SUPPORT_VCN_DPG) {
-			r = vcn_v4_0_stop_dpg_mode(adev, i);
+			vcn_v4_0_stop_dpg_mode(adev, i);
 			continue;
 		}
 
-- 
2.37.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
