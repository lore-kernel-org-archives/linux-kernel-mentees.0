Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA66CD54AB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 19 Sep 2023 09:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0179A416D3;
	Tue, 19 Sep 2023 09:34:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0179A416D3
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZeQr4yy7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k-xg-75NDNEp; Tue, 19 Sep 2023 09:34:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DAED0405CF;
	Tue, 19 Sep 2023 09:34:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAED0405CF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B3C62C0039;
	Tue, 19 Sep 2023 09:34:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0479CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 09:34:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D01DA82ED2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 09:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D01DA82ED2
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ZeQr4yy7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CnZSSZ2TWjd2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 09:34:20 +0000 (UTC)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 175E481376
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 09:34:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 175E481376
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-1bf1935f6c2so39006945ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Sep 2023 02:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695116059; x=1695720859;
 darn=lists.linuxfoundation.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QVf5D/+j5N+ia+SFzQBn7+4Q88aksoEeF9OLLDBHLuM=;
 b=ZeQr4yy75n6PvZfQx3+uI21YmlWyDoieqYXovHsA3NqthrNHDyotnEeupJSbMuP6ds
 9JRCr+4z/oI8V8hTSTr9gNUekTwK8VYXGZl0ChvP8zHwTvcKE0C9BKhhxesDer72dikf
 sLqe59AbdqDc2Gmhm+cZt5pSHvz4ZrOqfjVdSEdckpVzzVv1cN0eshPsRSWyBvMa3Y30
 RYdXxiK3YyIjinF7QoAB1ns7avD3ILkBC0mvadz7dcSrQphH088vvTQvPvs+MIgsyjCC
 AA7+xLG8RqRnEPhiHdaJ8KsoBjkbvalCDK2mCiGe+puifvLHsaSSRdHrqPeIdKyDz+ev
 dqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695116059; x=1695720859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QVf5D/+j5N+ia+SFzQBn7+4Q88aksoEeF9OLLDBHLuM=;
 b=q3LYHjppiBdsi8zmnXhbwE0GGuWlVYhqXrhz6CxdxT9uzFUyXT9SfFqeKPmd5b+Q8H
 LRTp0sWAmNn6Ph4+sue4nBxE5V2Twkd0Es4S+DKWzZhr2T70Jdmd0tyjj6bmSLBi8pC2
 xqum4Xdzbo61exEQ1Mi8+MRjMI82m4LKQ40wXruO5baMfBQ9Xk0UV5nqZtHAe2GFj15g
 /rsUjRNC2nJ+d5tt0r4szkOJWYmr0ytpCzV5YRBImXzS+2LxUnUrYTSaBnZYeYz7EDXV
 dbjiJQIbviFFwGqD36rg+WX7KQTXJri9IZNthEnpNUXOzuAnrHPnydSud9iLvZMAETYK
 BMQQ==
X-Gm-Message-State: AOJu0YzZycxH3cgZ5FzjEoIlgsgsuYrO5x1GcCxUhcvykRauoYa5l7R0
 tyFsgpOjXjceW28okqhovkA=
X-Google-Smtp-Source: AGHT+IFEM34YO2uN1IhUDPCwqvzRc2cQqob4GZnt3NU716uhhFhKM1D0NXBeVCyJWYwKQ2stjepyvQ==
X-Received: by 2002:a17:902:d507:b0:1c1:d5d1:a364 with SMTP id
 b7-20020a170902d50700b001c1d5d1a364mr2849526plg.33.1695116059209; 
 Tue, 19 Sep 2023 02:34:19 -0700 (PDT)
Received: from swarup-virtual-machine.localdomain ([171.76.87.78])
 by smtp.gmail.com with ESMTPSA id
 ji1-20020a170903324100b001c44489ee55sm6487608plb.273.2023.09.19.02.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 02:34:18 -0700 (PDT)
From: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 swarupkotikalapudi@gmail.com
Subject: [PATCH] gpu: drm: amd: display: fix kernel-doc warnings
Date: Tue, 19 Sep 2023 15:03:11 +0530
Message-Id: <20230919093318.16407-1-swarupkotikalapudi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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

Fix kernel-doc warnings discovered in AMD gpu display driver.
Fixes these warnings:
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110: warning:
Function parameter or member 'overlap_only'
not described in 'mpcc_blnd_cfg'.

./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110: warning:
Function parameter or member 'bottom_gain_mode'
not described in 'mpcc_blnd_cfg'.

./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110: warning:
Function parameter or member 'background_color_bpc'
not described in 'mpcc_blnd_cfg'.

./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110:
warning: Function parameter or member 'top_gain'
not described in 'mpcc_blnd_cfg'.

./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110:
warning: Function parameter or member 'bottom_inside_gain'
not described in 'mpcc_blnd_cfg'.

./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:110:
warning: Function parameter or member 'bottom_outside_gain'
not described in 'mpcc_blnd_cfg'.

Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index 8d86159d9de0..61a2406dcc53 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -91,6 +91,12 @@ enum mpcc_alpha_blend_mode {
  * @global_gain: used when blend mode considers both pixel alpha and plane
  * alpha value and assumes the global alpha value.
  * @global_alpha: plane alpha value
+ * @overlap_only: whether overlapping of different planes is allowed
+ * @bottom_gain_mode: blend mode for bottom gain setting
+ * @background_color_bpc: background color for bpc
+ * @top_gain: top gain setting
+ * @bottom_inside_gain: blend mode for bottom inside
+ * @bottom_outside_gain:  blend mode for bottom outside
  */
 struct mpcc_blnd_cfg {
 	struct tg_color black_color;	/* background color */
-- 
2.34.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
