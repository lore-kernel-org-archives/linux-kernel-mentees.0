Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C074374059
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 30 Jul 2025 06:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753856279; cv=none; b=r+N7KJXwbNwN7PhTyJe7VzRXXwDLmolcCvglKhJ7bTAPSMtBRZKdbIp59hfeZUirSqpnoAqxTJDKWD2OHHheZoVEgeHryaF7khTJX1M8ikU0bd/fpdn6zYMcRmtpatwSrGWFmtJNO626DkQSsud0aLY8Zq0YACB0oZwVyQxMX34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753856279; c=relaxed/simple;
	bh=XxMNf+s+au9pzXX5Y2tRQ2TxicTyQrqJ3gGr+HCCcZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Th+4EI2glCmFbk7Gqi5AQ2J6PIrYx2YUzBkjjYk4lullWvcC4refdthKu3tWvOlQY8D8rURaAUZkFzcyN9JrBb3JIGM9fdr01xs+426hVlXPqV5u8Kau1P+orMfhVMdrZIBf6cLVPF6uaZB2JHLIocsSzT9Q8TvlidxrBqHpVCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=LwcsNHVS; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="LwcsNHVS"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b31d489a76dso6539130a12.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Jul 2025 23:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1753856276; x=1754461076; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98acdjAVPrJS4Gqdzmu/lk9sXTEBspyDUAMw8EWioqY=;
        b=LwcsNHVSRnZd+96iLkS4JM99zT1Y62fKsqTT1AC6x8+u1TWxiAAij041wJCN17hrQo
         lvXX1NXv0aBkI2wdK4DGG646SyejLupuk6AmGo0GtWFv6OXjRYpwbr/MpWSKYc3F4fyL
         CL1ktoUEOY5fSQtxvOfiE2H9R4IrSWoVtLUeYfs/GK+Y+ij53DvDiEA0RLsUDd8rX+2m
         ylS7QnBW0E3iMaw3x9AS/ey+uNEoF6+G0grOqJycOWi0PRZ665luxpJLyNTHchCVSaUG
         TDX+sXPTthZEAIGXWjqjZOSTvDkifz3wbQbCm0FMrW6Qb/u8s4swm+Xc4kKJaNgg7dvn
         46wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753856276; x=1754461076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98acdjAVPrJS4Gqdzmu/lk9sXTEBspyDUAMw8EWioqY=;
        b=KZF1GF54bn/XnDuwTyarkQvS7Uvka7rD7FfhdqoRmIccoGvFKKWFjwqfWCz0h7q8j7
         +KIR3FUGN53j4BF7X98r4htkrHHmq2GgVneQYji21mA2NdFlm3f9HShwPHLNLVw4ZRUk
         L+U5QN0VZMpOU1vRBSZdpV5t299i/HlFWsL8S9kgeRphxzV3eqP1j9v49xyIG5a98qUB
         bX9Umx9sVWBI6bu4dST1VJF75EPiyJY3gB4ZengbitOLiBQ9i03pj0Dynn2h/jjSvNsw
         mh1AQzidabNvCRz9V7jDLFb0bvnYM8ldjCOUHQE2cvH0Y69cMoVjr/OyJRrkkgb33/PY
         ELAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXSGkqZMICYdlxRpCOQq4F7/oxxy0kV41MZ9xXSvZhQ2WDzdhMEJKKL9YxAw5gGYX9X+xMDcuKREsQCAV/Zl+LIvw06Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2pvejyJClR8S2aB7Sp2i3RmBPhwv00im6Xpm1Fl0f5h1M7V2l
	gCxAfdlgTbmTTgB8c3awyuYgrO/rV6ZwPdYv61RBTlIAbtVw7/2GAGwhIpijTrbzBYM=
X-Gm-Gg: ASbGnct2RxWtVlIpjcG/1foauUBTnJ1SAkt6S7j9yVACj+Zsf4CXYpcWnHZyAWNcVZG
	dSfcB+QD50RvqjaWItWFqtp9h5bBBJ3UfMD0j/dt91cdT9UsbN2pr1In6xRPj9tETHHRz9Yrkk2
	XqozqRroAGQgy8cJkmzoWfC3Vs/sw8Kl32GTsAwpAH9FzBC3gK5rE3eLPB+DNgXJBtl2TBQKekE
	RgpTqBYOZDo3LwsdQfCTRGUUpROCgo/cAn9FJFIHhdAWhYe0kVLlZ+0H3Uls7kxOrzy33kk0e4i
	CI02I/HaNtXxc7OMdm3jiByq/kHlHLa7aAVTdXH9W2wGdCtVuhIcb43Flj4i3SHHSpH3vs94AuG
	Ov1r7nFRMQB9O6kZId5JoqY+eAjdUPur+puTItsWyBTdSfp3u61hw5qMll/zZ
X-Google-Smtp-Source: AGHT+IF2plv3fMP0uvyMA0WmAMrYR0uHAsvmRyjAdt8jIJYVnquEq1k4jegvH5HMZncHbb6PvKV5aA==
X-Received: by 2002:a17:903:2a83:b0:240:7fb:cb0b with SMTP id d9443c01a7336-24096a688b9mr25697995ad.15.1753856275969;
        Tue, 29 Jul 2025 23:17:55 -0700 (PDT)
Received: from mystery-machine.tail542cf.ts.net ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ffa37f078sm75017815ad.115.2025.07.29.23.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 23:17:55 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	linus.walleij@linaro.org,
	neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com,
	sam@ravnborg.org
Cc: dianders@chromium.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH v3 1/3] drm/panel: novatek-nt35560: Fix invalid return value
Date: Wed, 30 Jul 2025 00:17:46 -0600
Message-ID: <20250730061748.1227643-2-me@brighamcampbell.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730061748.1227643-1-me@brighamcampbell.com>
References: <20250730061748.1227643-1-me@brighamcampbell.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix bug in nt35560_set_brightness() which causes the function to
erroneously report an error. mipi_dsi_dcs_write() returns either a
negative value when an error occurred or a positive number of bytes
written when no error occurred. The buggy code reports an error under
either condition.

Fixes: 8152c2bfd780 ("drm/panel: Add driver for Sony ACX424AKP panel")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35560.c b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
index 98f0782c8411..17898a29efe8 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35560.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35560.c
@@ -161,7 +161,7 @@ static int nt35560_set_brightness(struct backlight_device *bl)
 		par = 0x00;
 		ret = mipi_dsi_dcs_write(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY,
 					 &par, 1);
-		if (ret) {
+		if (ret < 0) {
 			dev_err(nt->dev, "failed to disable display backlight (%d)\n", ret);
 			return ret;
 		}
-- 
2.50.1

