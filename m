Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2623A2F0C5C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758617587; cv=none; b=u1p6E6inaVEqc3m8ZhL+ZhU8xP3Zohtj934R1j6HAQk6G4fQfUkDGTKxryLMZp8TjlGbUZWz4UKpMxMKmWh3Nh+KLFLxnCJfCUAM7qRDcL0fkFhrhim2xhw5Mfi5OLL4HJRMANL1/go+ZMIlzm0BIBprkZncQZ9AG2tucKYSs7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758617587; c=relaxed/simple;
	bh=L9TSdM6ceeD8ljbIELNBkv1m6KBoy85O9aC9JMdtFjQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=ccj8j1tTYXTSuiIZPdiDmte/hZ4XTFqEOlxFI4dB0vBcnahOJhjggOk6JXjZso5DvnMEklV3GVjROxhov0TyWFys4tYZWgY83D2f/Wi0es2PSe1FxINNJ3OZNVbRY1WrCGbHShbwJ/kKyPeJuX+xD7kH4au9tSWrn/yspvN8RnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQ2/RwhI; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQ2/RwhI"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C13CE40B8F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 08:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lA7Kk6acJKbd for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Sep 2025 08:53:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CFCBB40899
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFCBB40899
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dQ2/RwhI
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CFCBB40899
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 08:53:04 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-46dd8af697dso2661405e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Sep 2025 01:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758617583; x=1759222383; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=HejTWNpWzxc6zcJhy00/kkFkRjULOR58cZ1QBwMT80E=;
        b=dQ2/RwhI28LSu5h5S56Brrh+KEfNU98D0ZVbND+TxMknk1UVm3dOeVyTmm+pZXaOmv
         tCPsQlmy4pAnEVaBwpNdmUn6qzSeCFKAq0kq3SOEA052IusJX8dnxhiceFXtxaMxp2Y+
         1LeTAhHG8FzhayWsmCoeVxHsf12NE4TuRF8NUNfLehY6PSq/H+YQ3Nr6bO3v6dQjlFxe
         TKQpjxuMrTtrVE2AXiqXpcIaA0FRfUWn/UYmcHO4KtZFCALWSBIH7v8I5TmeJLtZ3A3K
         SUi2mXRqOWkJHL7U1Q/mR5+9JhNniAh+JT5bpc//pIZ6ac8E074Yb1dnKABdqz5yNeVL
         HWzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758617583; x=1759222383;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HejTWNpWzxc6zcJhy00/kkFkRjULOR58cZ1QBwMT80E=;
        b=ocMLBuj/Ts1n9sywZMuQcMnQMOYH+9sWXdJLUDHbe23ppgyKH/IhtSpgs4Yudummfj
         XiLDqfpxY01iaxNiWZYwiAzJTX+1fBWdwY1Fg/j/Z8KKd87Y3w+/J+Z2S9uOLjr1yeRO
         tzKD3Ldp0l3p9g4DGx+ko/f7rFqvSxjR7Dar7Qy5pN/mOh9FqMwviJcbNetOlTg2CA9/
         A86KRYDYOsJKEdf5ztTdbRkZ2gQS8YBzLQ48c9cqsehX7G1r0GoMYDv7Za5vxEA84Nk5
         sQ6xOjQxekh/GBNfotKcq9gwlj3v/ctwDydxFsaKsMA3BQsTwGFKFN+qWTcl/BKNk7eE
         gF8g==
X-Forwarded-Encrypted: i=1; AJvYcCWqf2LxqQNyPFxFIRmxLEV7hLjsnmtEJef1v/Ke7pcKN2rLVycsG71mySj/PTqwFtGRB2O+crLC7qP2ksKXIi5dFLcf6Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxE599XEubxjyejwO6tQcze/X7dRrfdrBCWm7i8H2m3EAjpUDUV
	SFNfLApJ8cBAHjhasnIB1Raem4tG9HRtbH2GebL7WfMPhpjGyrhXTOg9
X-Gm-Gg: ASbGnctWaD1/7vByO78e9i9GcSvuI/bLIWerAHeMahhGnF35Glk3b8owjhL/oK0+jlu
	PF9Wk9QOeD/RPvwbeg8pQBA9veKPIZgAXHJgHTJIbQMC/lzYIDGyXnTvxADsU9Q4600diDh8Wok
	Z8hLD5j4x/3bhnSmBjeXS5BUSVEoNtj/4Qj9OzJdO+1MxzP1JeexyvnI65B/4O/nbcUCEhKXllK
	3xoXKBD9xjYH0T6y5F/M9Uz/TmfqQh9oDligkBoktqZxC8FWAUIhKDXbG6w3dnnc79omQeVJnOt
	okNbXROtJuZuGDObb/z4/C5B7JhEncuNGtKHr4Rlia0+7lJ7EJDhbt6ZIskGTwrnkZqhq0zXLCT
	w5Kub5TlgvSDAQA/Un9k1xZG/GoBClXFc3irYfy+g+0ZlXnY=
X-Google-Smtp-Source: AGHT+IF+pe+VjNamL550YfvLiwpzja5iPw2JpG5LSj5sevXgBPnDhd/LroHyEH2A+QZT+qzzkEG02g==
X-Received: by 2002:a05:600c:828f:b0:462:3c05:3c00 with SMTP id 5b1f17b1804b1-46e1dac9966mr8681385e9.5.1758617582289;
        Tue, 23 Sep 2025 01:53:02 -0700 (PDT)
Received: from bhk.router ([102.170.50.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46d1f3e1b03sm81136945e9.23.2025.09.23.01.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 01:53:02 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	mingo@kernel.org,
	tglx@linutronix.de,
	mehdi.benhadjkhelifa@gmail.com,
	jfalempe@redhat.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	rubenru09@aol.com
Subject: [PATCH v2] drm/gud: Use kmalloc_array() instead of kmalloc()
Date: Tue, 23 Sep 2025 09:51:44 +0100
Message-ID: <20250923085144.22582-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace kmalloc with kmalloc array in drm/gud/gud_pipe.c since the
calculation inside kmalloc is dynamic 'width * height' to avoid
overflow.

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
Changelog:

Changes since v1:
- Use of width as element count and height as size of element to
eliminate the mentionned calculation and overflow issues.

 drivers/gpu/drm/gud/gud_pipe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 8d548d08f127..8898dc9393fb 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -70,7 +70,7 @@ static size_t gud_xrgb8888_to_r124(u8 *dst, const struct drm_format_info *format
 	height = drm_rect_height(rect);
 	len = drm_format_info_min_pitch(format, 0, width) * height;
 
-	buf = kmalloc(width * height, GFP_KERNEL);
+	buf = kmalloc_array(width, height, GFP_KERNEL);
 	if (!buf)
 		return 0;
 
-- 
2.51.0

