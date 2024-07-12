Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A3176231
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 17:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720806343; cv=none; b=RTDeG/ObnjaFuJQKeOCComhjh5bC3J71TiBVbtI+vVKqk8TLR/dAR/tmTYh4HQaVWiXknilKQ1xhsS4R1S0F3S1nWBINAz6oLBHs2twxFhDIqDksQPjCOZ8X9jSGn5O4DNy/B6QnnwLC6vV7x/Hr7tySUlRK9e999z3uiWbH0sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720806343; c=relaxed/simple;
	bh=X13h60Czwbm2ujyxIP806a+AW/lW7IB0AqcSBAamTB4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MZJgyw444tGgPg6Evr/teJrKBOJG7LLY9flhpfLQToNe5a86I3kl9lNHLLaSJY5nnTPCKTazcfdU5eQnr+nL1D2PHlMU9g/BcMkmmhzon32nHARcntYdjHddajF21gdcSi5TmYvTltYw4GjNcptpXluRLpQpYAgWBcuBGUb54sU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDunnfRn; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDunnfRn"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B4CE4022E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 17:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nh9z2FjrMn-Y for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 12 Jul 2024 17:45:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7FE9F40108
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FE9F40108
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZDunnfRn
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7FE9F40108
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 17:45:41 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5c669a0b5d1so1176554eaf.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 12 Jul 2024 10:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720806340; x=1721411140; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tNXQMXtVVY9UI6zu3BBCUXELAve7Ltcp0DjuWc3krBw=;
        b=ZDunnfRnww3OXCx1y+SLY1Y9FxcVGg9pqXs2ulKfvo2esDEpjsYMT1BLBkjwK5/h0c
         R8rM/3lmJ2a+A1dS18evaqDyeVp4nh9eBOWFtANziNAIGk+F/dsxmposGCPkCEIw8YCH
         niIJCujwJtrcMjvtUz4yGl9eEmkHlWz/EEhiYAusrYZvH0p33WDybvnet8Wy80XPOQkj
         d4DV+CHtlKnEgyK606VR5mXcuFnyCaF/UGPlUleb4U2axuraKqSFvu6ePGZNgp+SgukC
         Si8Qcd9lWNHf0n8Pd8mYsTWgDrdE4+AQwHuUFydnXnKSjSJ8oIbrChc6QL7heaG9tUWs
         jVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720806340; x=1721411140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNXQMXtVVY9UI6zu3BBCUXELAve7Ltcp0DjuWc3krBw=;
        b=OIQ75tV1t5s2OMgDbHJ750FLUXl/U7RiLu2qmgr3IOIkNA+AJNniEx4bkeFS4Sd/a3
         8P96Snd1DHnTIxorjlLROxeIPTtpTbjP+LwPQiSylGsw+uTl359fRBt82f+pXl5HL1KU
         Izmi/Lkoh7gL7j+W9zZjOdnvGDawPOasCFLIKypR+/9q0Q2bG1JVsaoJ00CovTi7z/u0
         53uIqF67Jdal8xfiRCJGOzOTLDsctBZ03BMXeD2EcZ0gt4iIM9fHn7UPFxBY/DyTg+P0
         RJ0JDQ0ys6N873K0RYMaK3fiXkhkjwNaOxP7CItQDNo9Zj2H+FDJM6Vg/x6ra++igynl
         1RZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYeVwKhusbQHan93cZf7dl/H5GHLVVifC00TSRvx7cIGwpCeTMSvFX0ao8l6tkV04Qr3ka5k2A7Dw7xlv0bStIDnXebFW2w2tyinO7HQ1/ystHtRgSZZ0Ky/+kKuWG
X-Gm-Message-State: AOJu0YzuIQA6lke8TJpocr97vIYVJLlUt6wrzYWZ/mv5KYodtmxIzh1S
	5VFeax9bhK0EMJ7qiehExk5iJo09bdWRcBypHmYwtJDg+qBpqdVH
X-Google-Smtp-Source: AGHT+IF9PKjomOSMUJmoLDlemBt+PLgMux6m5VCf86phTvzU1z2v2Giz3TyPGWhJB2bd25AAHSvm3Q==
X-Received: by 2002:a05:6359:5d25:b0:1aa:c73d:5a83 with SMTP id e5c5f4694b2df-1aade04191amr928556155d.1.1720806340226;
        Fri, 12 Jul 2024 10:45:40 -0700 (PDT)
Received: from embed-PC.. ([122.183.46.111])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-77d669d5282sm5097810a12.67.2024.07.12.10.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 10:45:39 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	harry.wentland@amd.com,
	sunpeng.li@amd.com,
	Rodrigo.Siqueira@amd.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] drm: Fix documentation warning for read_mpcc_state in mpc.h
Date: Fri, 12 Jul 2024 23:15:10 +0530
Message-Id: <20240712174510.70467-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add detail description for the read_mpcc_state function in the
mpc_funcs struct to resolve the documentation warning.

A kernel-doc warning was addressed:
./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:547: warning:
Function parameter or struct member 'read_mpcc_state' not
described in 'mpc_funcs'.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index 34a398f23fc6..9e65ecf1d3b0 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -282,6 +282,22 @@ struct mpcc_state {
  * struct mpc_funcs - funcs
  */
 struct mpc_funcs {
+	/**
+	 * @read_mpcc_state:
+	 *
+	 * Reads the state of a given MPCC instance.
+	 *
+	 * Parameters:
+	 *
+	 * - [in/out] mpc - MPC context.
+	 * - [in] mpcc_inst - MPCC Instance whose state is to be read.
+	 * - [out] mpcc_state - MPCC state structure where the state
+	 *                    of the MPCC instance will be stored.
+	 *
+	 * Return:
+	 *
+	 * void
+	 */
 	void (*read_mpcc_state)(
 			struct mpc *mpc,
 			int mpcc_inst,
-- 
2.34.1

