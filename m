Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BF51494BD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 18:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724179355; cv=none; b=ZYZ2nx/c8gfbmhzvQgjIi7fDO9RnSEcJ1aov7CB7WBELE9/+XBDzoLiRgBeq1dkB/Y+QhSivQe5nDeOTLyGeL4vUKmvSxPA4hczSr7pQMKGRfpeqIBGfjPWly6QBHDtq65dFDjweGW7clICF9U848wc1iRM2rzQZugf8HzW7mIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724179355; c=relaxed/simple;
	bh=YPwnmjDLK+YVf0WyuqFgoPNXU4jhy1NiR/p0IqzQHyo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cJRMySWa98qmV1ePTQnTdiGpCR8tlyaKOOtaO2fZNiuJScqN5arEDukAAHwlHYmMHL5F0lobyUU+/ID6sZJYMNO74+SuukZlcktYfOdFA84yyQ/GE74awd+ODwgBZ9VF5mzOSaf3fx8No+Lp3C6OLWSYCLxzNtmZPtmM8asf78E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXKgrpDx; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXKgrpDx"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FB0640679
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 18:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXDilo16JybV for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Aug 2024 18:42:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2C60E402EE
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C60E402EE
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jXKgrpDx
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2C60E402EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 18:42:33 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-714114be925so726395b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Aug 2024 11:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724179352; x=1724784152; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6qvU2I/kFY0fRRBFMo/OPhj2YEvUyZhHs3rYMJMfKI=;
        b=jXKgrpDxAAURT04TyefHREe9IXfhaNhvKXkWJZg7qFcEQBEdejIBXLaRPEtFHGua7x
         hFGgHFVv1XTS9Fg8o0aauR3xbtPfuxNqjMEX1QBATIqgoDq28hV1EXzl/J0I8kZjsvCH
         XsdG9cwXHqMSAcjNVG0LTu69ppOUSdjAl31MO4ZmcpzjYp87b0GyIfoI5FnpeldkUZOt
         6FIRXwQZj8sn2PnHJIEU+PeTcoGt3vMH+3W9pEsP0eLuXVHJRk9+ctlefVCPkzrhUog7
         rz+QmYYpmgAXKtHbtRcwt92aHxrA6a5NNx/z1d9sgQZ6jvaKujVQXbqo6o8jNVP16GPO
         OiCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724179352; x=1724784152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6qvU2I/kFY0fRRBFMo/OPhj2YEvUyZhHs3rYMJMfKI=;
        b=TRG4JhDFWXV8mFxdO38DQmxnNKw4qMxQjT1wWyXJyknO+LL9uGRAetLInS945l3bkv
         D5QJDRS9uV+4hI0tn0zrUnJiGAgixqWBwNLRJH4FSr3Rr2N//nl42Mn1CC359+fQVvcI
         G6xLIsRB01cT1GaFbpaMoALUBwEUtJd3r9ww3aJonoscOZJy6JvWpvL5dY07HsNDudJB
         o2418WwrzxMWo2U6Xyq3puCgxB5gwpjtN155pXDg0uH9MNDtBltElVuaB28ZtzCmitgj
         6dsc9VSrQlY+yNbnBefv0GalchI3ayXDExK0SravCEicdCRIIbj76RXiQwrFT5YWpnB7
         q+zw==
X-Forwarded-Encrypted: i=1; AJvYcCXrnCGm0feuD+GVdg6x5nKdZ39UfDPQ9MJhMDSLWgMvXfvNALIPFFLmeR6LAJWbtpSs/hGQDPGmYY0b3ZIlY/PSI5PNlg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwyK5VzvLab7Xpwsa72W3G5kj8PQDZI+GebOOnaSEaXSHnVMdBk
	r/CvdC22vsvQAqO3uwz5kEUT+kn4Ua6zkLosEythoA34Op/YSBOt
X-Google-Smtp-Source: AGHT+IFxlJrjQAQKZg0A12JTqiKvjdykV//J1dgiLVqq1WbyaFiL56N6kPECxFc5tIIGDKmeX/UNoQ==
X-Received: by 2002:a05:6a21:1788:b0:1c6:a57a:159c with SMTP id adf61e73a8af0-1cad81814e4mr388450637.52.1724179352220;
        Tue, 20 Aug 2024 11:42:32 -0700 (PDT)
Received: from embed-PC.. ([106.222.232.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127ae0e246sm8541159b3a.70.2024.08.20.11.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 11:42:31 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com,
	garyrookard@fastmail.org,
	linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Replace strcpy with strscpy in rtl819x_translate_scan
Date: Wed, 21 Aug 2024 00:12:16 +0530
Message-Id: <20240820184216.45390-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strcpy() with strscpy() in rtl819x_translate_scan() 
function to ensure buffer safety.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_wx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
index fbd4ec824084..970b7fcb3f7e 100644
--- a/drivers/staging/rtl8192e/rtllib_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_wx.c
@@ -61,7 +61,7 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
 	iwe.cmd = SIOCGIWNAME;
 	for (i = 0; i < ARRAY_SIZE(rtllib_modes); i++) {
 		if (network->mode & BIT(i)) {
-			strcpy(pname, rtllib_modes[i]);
+			strscpy(pname, rtllib_modes[i], sizeof(pname));
 			pname += strlen(rtllib_modes[i]);
 		}
 	}
--
2.34.1

