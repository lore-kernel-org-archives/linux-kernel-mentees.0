Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430418F66
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 10 Aug 2025 18:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754849036; cv=none; b=nhwBXlJpMGz+0eJPJiUflZPgRyu6Llz78DAqAAvuIn5BiW/tAIIa+vg9dVVUOASv9hvVuhWwtx824Vwjbu4CQ13+v7eFailGWyZdVaD8wvxjocZ3rjeHfCmNCT0iAvkm82jLO0xWy5ilOTcTEXVG9Q/vTgOYxH1n+XLu2LPHQ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754849036; c=relaxed/simple;
	bh=gaYOoHtzTnOvXU48a18BZKN8A69dA/OT/XQFvRAYK0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NJaUEXr9NLFZu2xy7S8zRskVMA+CnLysYW529a4+22u7uBa1ulg+gH+6nH6m1x9gM/M9U2XKTDGIy2pgpgiKijrf5Y/u9dKt18OkSr11GIxX5Nk0KOBOFw7jBKP5fRIAfL3oIHO8YO8j70d1FTC+L7uLFnYWnlG6tmsKMlrZ9zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8LmBCGp; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8LmBCGp"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-31f017262d9so2806843a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 10 Aug 2025 11:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754849034; x=1755453834; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8iCC178+oHgUid4yigF5hFbaYT7QTZQRpFLb7VJp988=;
        b=I8LmBCGp7uMM3q/zfbhaYcwQbbU10LXfSuSeyvuunq3OZvp946jI34P75RPJy0/m1I
         j7+sn1FSBhlKTSUK6CXBqlW860MImdC+wgCvCDtvKJ8M+QYhnvDkhCL+t9GI3zex4/yg
         Q+Job3YuVNP/ZJxc2F7d9+5ZAG81i9x2u7ynmObBO/QcRTardD1XcbSEwzzBd8pTUIfq
         QBbkiqW4hKZBhPkzPjCwktQHmkU136SdPcoYeHlrKsrbEnSNqv0/aP6NnKExfU476Z3u
         rV8P8YVSToZb2C2x0+oDMBcAXoAKlAhUgMsAmWeIE3EbJ972zRxMYpiFUI6al70f8bTq
         oLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754849034; x=1755453834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8iCC178+oHgUid4yigF5hFbaYT7QTZQRpFLb7VJp988=;
        b=n6W6P0XSAS3Qj8CQ03Wn9oUFPIAzC4hdBlzCkgcxTomAj/ShkO+F/7th7NMTsT2WJW
         t5ezywuriTk7J4aAmTpflw4S3qn4kVZRz5JpsFhHlhS0EWuGTSM6fyhwjqatMvX5bHFT
         F8Os6xtULNOgPacipnU3nvHxW47FCLVxEdZBRNo91PtgVmdvPHDjup+t08G5buWo1Jkx
         L5yv366eaByHWq2pUSutsQVGUCeNzY1mehchtqRoYzb1V72YoSZbSBdslkJ5BLKuFSzX
         bcZdUw86dZOXBp+qAAdoEQqRpVQhrFoIeP/rz2kVFeoq97NKjDYqmiZ297M4/WXMoiaM
         jXmg==
X-Forwarded-Encrypted: i=1; AJvYcCVMeZi/x3mojbTnYmJHD5slaRm2co6s0ufGbO7U515371Xk93tMamRi8ZGRvBdmvKRw+Y0H6+ueZEHWkjQy1jxG4ONZ+g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7sG+I56uu3FMpSpgAI+YGrq7nrIZEKPyQwMyXp3pZ7nT4l8XI
	3zj++DxhZNzpUKliLt/F/Nnf+1qZjw5jYDZwmD6BteSnVYF1a9Cx6Hh2
X-Gm-Gg: ASbGnctdjoKmMJz+6zf7w6NmEuHncuGk+T65fyj1BPpEiZ/YkwkyMu5tCOcyqXjmyMn
	3GO/6qxWGsFlar3CzpI6gfp0PfEa5rpdNSXQYwBtE2anmNkVjkLYF+550VXozybMIvRA0FfXPQL
	maBgFDBGEPujU2gHueV7f5aRqUxInrLHcfpJ+rI2hSuRll8RRywygHYPy1n4+jNFEmenT+ogRkC
	pTixwdPprRDbfQtQ5DmpGKPwLV2+/FnDhWNSI6dLqg1kkT+R9rXaOMngClAp/GJK5QDRlUjz6jJ
	6i87o5/zkRFDGPPcNC/t+xuA2sgOZdGV2zQS3XPvQc9j6YSW4Chuq33Jn9Rfn38a85vWtlVTz7o
	fD5z8b7giaaJ/bHsitu4C99AJtN29eH9BA34t1U0rQcxMjQMsVmT2tYM=
X-Google-Smtp-Source: AGHT+IFbmMq9se1Gfprc0dkctpXAIoLrgj2/vUGkJmxiyPVwrDO/BYSwEweScA9h1dNxojoUAJO8kg==
X-Received: by 2002:a17:90b:3c83:b0:31e:f193:1822 with SMTP id 98e67ed59e1d1-32183c48368mr14203717a91.28.1754849034415;
        Sun, 10 Aug 2025 11:03:54 -0700 (PDT)
Received: from chandra-mohan-sundar.. ([2401:4900:1cba:adf9:80de:8778:334d:8ba1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b43c54fbce4sm3256987a12.55.2025.08.10.11.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 11:03:54 -0700 (PDT)
From: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
To: sgoutham@marvell.com,
	lcherian@marvell.com,
	gakula@marvell.com,
	jerinj@marvell.com,
	hkelam@marvell.com,
	sbhatta@marvell.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org
Cc: Chandra Mohan Sundar <chandramohan.explore@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH net] Octeontx2-af: Fix negative array index read warning
Date: Sun, 10 Aug 2025 23:33:27 +0530
Message-ID: <20250810180339.228231-1-chandramohan.explore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cgx_get_cgxid function may return a negative value.
Using this value directly as an array index triggers Coverity warnings.

Validate the returned value and handle the case gracefully.

Signed-off-by: Chandra Mohan Sundar <chandramohan.explore@gmail.com>
---
 drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c b/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
index 8375f18c8e07..b14de93a2481 100644
--- a/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
+++ b/drivers/net/ethernet/marvell/octeontx2/af/rvu_debugfs.c
@@ -3005,6 +3005,8 @@ static int cgx_print_fwdata(struct seq_file *s, int lmac_id)
 		return -EAGAIN;
 
 	cgx_id = cgx_get_cgxid(cgxd);
+	if (cgx_id < 0)
+		return -EINVAL;
 
 	if (rvu->hw->lmac_per_cgx == CGX_LMACS_USX)
 		fwdata =  &rvu->fwdata->cgx_fw_data_usx[cgx_id][lmac_id];
-- 
2.43.0

