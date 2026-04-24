Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B972D3A86
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018552; cv=none; b=PU+Ns6jeQrA4BZvTWhOVdLBCXFPUxSV5zyAuLQ35uSTLsaoKPS2icW/yq5dx4GRADDwQAk1HGskLkOVKTX6pICpL8E0nnQvtDuYiuKevKzzK9bc01HxoeFPo4VV0Ags7jlSLhbFqkYJxlx9DdQfEhvdpFBDW8pXfXwi6fDJtZks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018552; c=relaxed/simple;
	bh=undu5dkCTUgwl1M8+79fnIw1tnD/iD/mxZTBPxvLUMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AVGeKfxAz5z8/wdBF9XVd7sGG9BIyRu/WFaVaN0oU/KqaDlWF2juBaBRSvzGUeok485/Myv8uDdknRoPIhUNpwHGFa2BKO+aqh661mT8K5sgb7z8+AaoPeRJiTvEuCsqdDlXV4aKuAYMU2rrTrQWh+Kq1Z6Rp1D/UJ1u96dpr/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ym46qcto; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ym46qcto"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1610584292
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 08:15:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZ5XBn4dHglu for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 24 Apr 2026 08:15:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DC2B84268
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DC2B84268
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ym46qcto
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9DC2B84268
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 08:15:45 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c76bde70ec9so3014474a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 24 Apr 2026 01:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777018545; x=1777623345; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qcv3yPzsXnW5c+HXfigOkDMAbuRYnw8S8vUv2u2wfwA=;
        b=Ym46qctoVoUnQdsDCEoOX1O9OPNu4kB53goJ/YsFShBmlA6ZoZJOGgMxK2NDFj7L3p
         TwfS6q6ra7q9Qgie4P6kDEbfIki+H0ZgLrseqW6cTk3RN97m37UCW2MyB2xnnMQe/5id
         JHzfg/gfqt6jbGcGE/jM51TCYwz5PvfIkxp3xuOp3BSB3riO6trrQ5WvCPn1XaXV0hBp
         BSNjz6dzz7GXNsERAAuwRUOrPr8TXNSo3mf3vrhs93xcX/DNSih0k/TshoKGnSj2QreL
         vTmu+0Ijfq2vxzjmC8IIm+GHvjeoBrIRoVKZYhYmyeLiTUxXi1XXMxbkIoFX9IXZj7vg
         PP3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777018545; x=1777623345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qcv3yPzsXnW5c+HXfigOkDMAbuRYnw8S8vUv2u2wfwA=;
        b=EHtMGHoER3RCYYzukmjNsOIZqdd8ZbySKmpRgzfMjsgtcDEeCjWA4i2F14u0y6eLCR
         Oq5GJztEKTwfFypcP+JoDdv3Xo18/UyGfx5DxQE3kLV66/Oh0h9PhvhnkEoywj32x3sS
         fvrYylCHMsi8c4OTLFPCK+GN41RJaoQ4uRFqNr5Q1DhgmyAgUlTcFTj0ZMO7w8hdbldx
         tdx2mAonp0MSfWZBA4TRri2gW7nRTipozjS90sbktnWM99JxGdgGdDHTZ0IBYayX1p/f
         BrGI83CGSEnMaEPDDZ4uVxl5wUTmsV/sJ8Z8R3qQWmvpf1E7s5gndIV+fv3HUqiOUIVy
         4Vfg==
X-Forwarded-Encrypted: i=1; AFNElJ8bx00zxUGdDC8AT7M0YjM1Z2uTagWwZa1f3b+IOsjxd3ootgYoimYnHS9RkrJonDzb/exa/zuDAFetQEkhjbVt4YOveg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxT9UfU3yVLYuJ3Oi5Xz+YtDodPa7IGpDvWmLqO/IP/xCTaymbe
	GoBCJF7rvCUXagHWnkXQjJCj1pNKf/GDFZAcFHuQl7vji4XEAPDPiOpS
X-Gm-Gg: AeBDieulJRpKab3qxPq2zCRHFPSjLMpmoDBRxi6P2pJewhZWR38epZ1VkL+oGgJLaDR
	4NmwLrqxCHpLSyjRNt8qRp2c57mGA8W1eyocApo7V9XdAqOSTaDiYxen5VT57qgGGi83rPoSJD6
	fdxH3ad9V25N7Va5Lii8ILxtaJE8VZPBxaOepxpqbLxus8ASTJH9joCxZCRE3NpkOJ9JE3koJTA
	g5EFNIQNzT1HrpzHR4jn9RmDU/s6I/aPnZ+RflHa+9KTozNMx8Fnq2GWLyUQnqZ0Dfoh/cOUl8W
	BHVCktD6Dk3sFkYNgYd8VL+9HbFPTsi88KIm8s2aBx57lN1EUOHF/9EToRsSQnqAK2AcszfFhpU
	Si2zYA/GfisPlXZ16mpiXvEiF9Xacmlyu2wI/NXz982qxwgeJCG/zdCGWz3lD0gtZ1fmsE1xxfs
	18CJJcSiHAa6KzcJBuCnPxA0P0rN71xU8fOXis
X-Received: by 2002:a05:6a21:6d9f:b0:398:b95c:51ed with SMTP id adf61e73a8af0-3a08d8a3490mr34780945637.35.1777018544653;
        Fri, 24 Apr 2026 01:15:44 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:993:9321:304a:9347:5e0e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797702fbfcsm17347848a12.22.2026.04.24.01.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:15:44 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH RFT v2] media: atomisp: Add error check in create_host_regular_capture_pipeline()
Date: Fri, 24 Apr 2026 15:15:38 +0700
Message-ID: <20260424081538.459564-1-robertusdchris@gmail.com>
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

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
v1 -> v2: Add Fixes tag (suggested by Dan Carpenter).

v1:
https://lore.kernel.org/all/20260423060246.296986-1-robertusdchris@gmail.com/

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

base-commit: 028ef9c96e96197026887c0f092424679298aae8
-- 
2.53.0

