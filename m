Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FD62EA498
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 May 2026 03:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778211563; cv=none; b=laFGOUDQ+GjA7SFJlpzEXKsgUd0S/X3i1Ed2PqEYOWXUDbOLMgRQBE9c3sbz6LIiMlNMTqSQoLOfQM408HAwwFD3PPT5i9vpGoYi2A3eE7bvxgIZj/5/FrQRdRR96u6M2XFwgo0MFW5KWShEfWQ2vQhovp9YojuDg9TCfGu/hfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778211563; c=relaxed/simple;
	bh=vzSxG6Onrc8/yaWLl4CTnv1mXqAZK6Owe5CxDryLrIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lwhzksi8dBcN14HjHgb0/bEu0Su3fp0wLrOx08wHJcvCM+RkxHemrosQC7RoYE8U0KbXvvJ47hFVOPjmydIZQrF25Fab9HsjinRmFdvLnNVSuG/xfIqNtN0pCDYu8tIgDm8BoRpGaO27+3n2MWMtR5ajBrHIEwTUicwSWie5pzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aF/ynF98; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aF/ynF98"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0599D61255
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 May 2026 03:39:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pxbn1_skmA_w for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  8 May 2026 03:39:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5ADD76124B
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5ADD76124B
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aF/ynF98
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5ADD76124B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  8 May 2026 03:39:21 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-837c09d2268so671273b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 07 May 2026 20:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778211560; x=1778816360; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2vfbSINB9Jq0JdlahOlh/WjU5V7KN7fzt5ytJCyJiY=;
        b=aF/ynF98wjiPOp2sT6M1CeTGVc3/7CJxQXaBW6Os+x9jPmsyZ5ELdTqpZ9S1UaDJni
         XeEyETrHqcNcKHI3k6DHb2G5OY9U/8eRILmXRMdi+vU0x0qqxRqS8qd2l+xcu2IWR1Sa
         uNsqXRsEPa5WwAm4S0ju24mEdOoEnXuDvuDswvHag7r2PzoXwnFkTlOUM5D2B1F3wyeK
         wu8WHUiTnzS6jExIh5tFvw0xw/CBJtLgyWHJfn2RP+dptXyhq5Kk3xC41D172KTEn8UN
         OzHBGn0cCAVXbYC5N0DoiRP/Jep+tyalknyCsOnHGznBvkuNcG43vViMuwFzNm2nXldd
         kxxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778211560; x=1778816360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2vfbSINB9Jq0JdlahOlh/WjU5V7KN7fzt5ytJCyJiY=;
        b=YoVobtzBPJ4NRUcFgHqz3RqXlDXNFA5h2RB9JsgsvwJRCLzjHgwgWiToZesZLPp+df
         o9OyXDklAZjYErU6QyQ5BfFrxUVYx1ijz/x3YAqViX5FbS6+eUHIApqqaYQWYpZ8L2F8
         ZjzrTCSSHwwaov0nNjmurI2ZpZSRLzRKhpqHEof36T2A6D9trz0uaydRddfzwZMAJZnm
         xbv3f6f4sxKssFPBtbzxYNA6REWjDQvyDPbo0aSlV0GhWP0a1iH26wxREKuOJM/GVLe+
         Mme2VkhBPjy1gAvKPgmwEW2f+QuT6BQ31czxmKrN/2bMNTTntntd1AKPmrgU1NrjlB7Q
         +C+w==
X-Forwarded-Encrypted: i=1; AFNElJ+9/zs756L3RQItAmw2KBFwyRjZUut7NvzplfEX4Kjgbzi4oHc3NkDASaDro05MnjxyBw6VXTgzccg8a6aE9oe4s2Nm5g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzluImjx+i+evBK9kEimuHf0sP0w3oiTUdN9Y5SgM8V2UEhLk7k
	oGQ4s+QQrNOE6hl5pBXZSNIWYjoEV3b+Pl5CPYJTB+zyZTxCjRTDcypp
X-Gm-Gg: AeBDiesE+2/S50A2cUxi/Pz/2ZqoFxWEz1M+YbUM84QGPcCV3TJyfHJw24kamAfFfSc
	GrxTUCGXrUbxrTf9gT14py0TNZCYZV3oaAmVRHV/pD0HBZIRjQnfbDMCDYvCe/QGv5CWaf64HAJ
	h44Ytm5yptAGCr5vRUMGC3UYPm2BIWNt9xYpRXDQBI0x2kVQrbhCO3KcXiFm4M4I2xKCGwHOcUP
	aREle2bSbIgCGfy6A1pKAt7diE5V7lJ42T5bQUsGc3SQSLkYTS/y2IkxU8w/x5uqlZf0dQA1XAh
	vVEZGOxwoBtWt2eaiVQJqDf6M0+szSfpBpap8tgB1Dn53GUkZ+nyWR5ufsb+KzFB5Ov3PbRXnsk
	KFG4Hllv/hTgaEP+WfAdhf803N5e1whu79rt+UhnjOJ7gs2ABuWwgFqxBL8L0sk0gAgmZkscmtS
	2b9L3tRg/VocUULSzIuufNor7A/w==
X-Received: by 2002:a05:6a00:4516:b0:82f:559d:ece3 with SMTP id d2e1a72fcca58-83a5b9d47ddmr9840609b3a.15.1778211560488;
        Thu, 07 May 2026 20:39:20 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:993:9321:304a:9347:5e0e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965646254sm10905574b3a.10.2026.05.07.20.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 20:39:20 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: g@b4.vu,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH RFT] ALSA: scarlett2: Add missing error check when initialise Autogain Status
Date: Fri,  8 May 2026 10:39:14 +0700
Message-ID: <20260508033914.111596-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When initialise new control with scarlett2_add_new_ctl() function for
Autogain Status, scarlett2_add_new_ctl() might throw an error. So, add
error check after initialise new control for Autogain Status.

This is reported by Coverity Scan with CID 1598781 as UNUSED_VALUE.

Fixes: 0a995e38dc44 ("ALSA: scarlett2: Add support for software-controllable input gain")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
I don't have the device myself, so I can't test this change. Thank you.

 sound/usb/mixer_scarlett2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 8eaa96222759..0f83f8981213 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -6707,6 +6707,8 @@ static int scarlett2_add_line_in_ctls(struct usb_mixer_interface *mixer)
 		err = scarlett2_add_new_ctl(
 			mixer, &scarlett2_autogain_status_ctl,
 			i, 1, s, &private->autogain_status_ctls[i]);
+		if (err < 0)
+			return err;
 	}
 
 	/* Add autogain target controls */

base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
-- 
2.54.0

