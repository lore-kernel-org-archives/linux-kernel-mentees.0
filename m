Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FE933D503
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Jan 2026 05:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768888801; cv=none; b=DjuojCtKxkM9lT50pqDfjc4xk8ZK9PfOp0qLeYizo4WPysl2J2VBsyZJd3akgLhcq15GJsQZSeOgTAsLgT54kOKu5laIMOajGupywa/QYTFVmzaWYgMFif2PzusKJwkc8GtDX2IH6JFcZWaHA7Ao1KH4ZA7hWBbDGG4GvoGNOQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768888801; c=relaxed/simple;
	bh=d+0glxgDY4vIxsn6I88RYhxJfsf8CHfuxmaylmAC9YE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kXcAekQel8tDxHvpXtDs8VA4JEvcfcu66eTG20JPQppSa23ln5dN7hYRzUY++fCANuE6YgpnoJP1mDXtWbARxdgLoETHZ0qokwb8XxUcpCzlf3/9GJ+x63Mut9mMW4OoUYLm/8jT0eC6ErCqp/n0vx1s/JOwZj9KJQcYJ7AqX5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4u7y/Cs; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4u7y/Cs"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD3694008D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Jan 2026 05:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NpQWOC5aiN1 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jan 2026 05:59:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=giorgitchankvetadze1997@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B478140042
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B478140042
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y4u7y/Cs
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B478140042
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 20 Jan 2026 05:59:58 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-47ee47ff24aso3197905e9.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Jan 2026 21:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768888797; x=1769493597; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jd1v1Li4QAuuqgyxm1sUNoO7QW0mx3Qk6KM79wJI7gA=;
        b=Y4u7y/Cs2tP+73WhXhpYCrriNj2VCVHg+2xojCZiAf2u36GohlzcL9Iz/R2X0wc/It
         +IxNsiNuHUo5CYghutW6mgwQwJZzjbxQ8w74x8L4nj2BNFDyPb/nXMt36HJDfEXk0iQe
         JHuaoFDxzJqlCfDsHd+HJtRyoMCsDhneI3qL/dVqJIzsUblZH8CatYV0+QAv7dVC6wAD
         xwGCT/3T00K3jFrJyvTsGa2TaR1rIRyFEGrb8fUVxUzdTMW5z13DqZHwj5O1mqCdjJVC
         3vg34+eqm5GsooYZzE7MKaF1Xeeyc94uftDQ8rKx4fMFXUZsYUJRUTBIYEhH6FzP7WlR
         TdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768888797; x=1769493597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jd1v1Li4QAuuqgyxm1sUNoO7QW0mx3Qk6KM79wJI7gA=;
        b=OBsO6cevLmI5cHiH4NzMnzffEyLG1w7YE0YaEQ+/4JBAkYDMc+RsuT0fNOg7KtH6lG
         wSIffDD0o4ak0BtJjL0dBfFeObojOoerMosAL90SAVDHnj0fSLg0J3pHwnQcn4bJ8fXL
         i7a87GqX9S+hzLue0pKNgu311R+Hm+T7w6d70gLaKEEMfFI/B19LHMGNYdUhIubejT5h
         SgSENEGj9dEJAaPIrG3hKxVGpQObmIED/vUzO8IwfG03ErLWFBUf8XQgWwqLcT9BD2KP
         WQypK4/nqTu0/Z51HHPczxVPaAvOG519/a6MbAfE1EOz1du1sqiAKZjI5BiaVCyXoQof
         52XQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXE1W+Vd0V+v7oNaPt3IryVuBi+eYWUvy6ynVe45ajJxJEjaUPJAj+hFlgdB345IGmikn9CKSPmzyrEAxEqmYad2zbpw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz4ACszRCUpaoRXo19ZFwnXrmzttLpoWQQkRtBOge2w1Pb0qjYN
	c4rg1lT9gJE7GXxlR245y5972gvlPsHoyXyc8mZFtu5HYE8fLK4SgUU5
X-Gm-Gg: AY/fxX66Ju3kIhZDTutlRgAMoVjcKasLz0+O9+UsLaTJSBJMG+vhyB6zrWV8QYtJPID
	fJTmj+Snnk6WVZh2pUeETChWVWHN+nzY9OXqsKESjjMnOmMbQj0UJQxgtCfdTHpOejHY8tCTuZD
	fI7uAr5QemCElozbis9PRBDB/2yN6e+ThBO8wN6nCYk6k9mP2QOexEtS3rSZjLngiNOIUmItRMw
	0YIy7lQCbIdqsuSNTAMhf2hNbrHUdGDBwrEORGo/5iHaytkW/9vmc9NNAEBJO+++IpBHAXI75Es
	L9eE6RFoZGT/dEdslG6Kq5jQ+KXgA9o2XFGvVdoT04+VxHjzymDbMuQ6xHtSd6RdNfTLb556UJt
	GaYydOa1Vtb41X6Fq0KawDpRYvd23+g5LEXx66d0ouWExm0mhAU1Hy7Bo98175A71llmdpQezLp
	1HcqqaxC89ysfBXcHuJRo=
X-Received: by 2002:a05:600c:6212:b0:47e:e20e:bbb6 with SMTP id 5b1f17b1804b1-4801e31e0f6mr93946375e9.1.1768888796382;
        Mon, 19 Jan 2026 21:59:56 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm27104788f8f.9.2026.01.19.21.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 21:59:56 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: skhan@linuxfoundation.org
Cc: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2] Makefile: Add -giorgi-lkmp to EXTRAVERSION
Date: Tue, 20 Jan 2026 09:59:31 +0400
Message-ID: <20260120055939.12554-1-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Append a custom tag to the EXTRAVERSION field in the main Makefile.

This change allows verification that the kernel was built and booted
from this source tree. This is a requirement for the Linux Kernel
Mentorship Program (LKMP) application.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
Hi Suchit,

Here is v2. I updated the commit message to explain why this change
exists. I kept the code change the same (replacing
-rc6) because I've already booted this version for the proofs, but
I understand this isn't for mainline.

Thanks,
Giorgi
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1465f7157..e1527f8dc 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 19
 SUBLEVEL = 0
-EXTRAVERSION = -rc6
+EXTRAVERSION = -giorgi-lkmp
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.52.0

