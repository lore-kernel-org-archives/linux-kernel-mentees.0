Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4771220CCF5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 09:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728639653; cv=none; b=FodrG+IHtgjRqXkGedjs8OFUQCjWyjFBB82G2CewiAJMtUgNilzDz5O+hqT8FL8b9OUFltcZryELdlCQWQaLUFn9aeKngpTeNifD5AxiOzli8ER6rAKxYT3X+w1SV/p+bZd9QixUClCyR9grw+/E7ZEUgsrmLB56cHd7O9ZkD34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728639653; c=relaxed/simple;
	bh=iQNhq+CQhhscdKGYDFLYkitEdQ89YDdaFMFypvyo1dU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hEV96QNj57JArQU1mkDdKOyf6MkApouIZN62KVWoF45vWoA3rwYDTBbjcDeQWWfKbvPodL8dAKsaEJyIBsBYZazgRpEU2LTw41qR9kQyryTyIks32KTr0BO15apxdzxwmYXujoVLHyaHNygQY3gOrRqoa49uR7r3r8g6jOGNHB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPZipbVN; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPZipbVN"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBD1E61108
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 09:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ebL3Z3HqzDz for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Oct 2024 09:40:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::72a; helo=mail-qk1-x72a.google.com; envelope-from=0xff07@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28975610EE
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28975610EE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MPZipbVN
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 28975610EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 09:40:50 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7afcf0625a9so182707885a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 02:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728639649; x=1729244449; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7AhjpOVVAnhOPJgZn0n/MxJSbqlC44iwzEWSMXLlrU=;
        b=MPZipbVN/ycFLUhwXTuUhhcBhS+ZG/3cyige3kmSEzS9gj5kpjGm9YS1xSKWT16CoL
         tYQqzs81DVmTcpryu67O9esYYc5FWrE+IpoNAoHQDvkxtpCbiIxh441KKNkD8Ya0rPfA
         WGXpo7J1hucvJAUs70jigzxLsYP/P9CYmJw7zQFb+CuUSvP3TpNaca338bmQSwMuWqE4
         iK6f2+Z1oBXaXtKvOSfOZ0sASJovyAtCXO0zuKNPzibxGtRr2e/uWzzovhVbWAtgy4x9
         K3hxVSyBnD2bmSoMNABIzXcaJKLtukx6dFJxbW8QZyWZMjpiC3OANtFI1cFMWdgZj62V
         5mUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728639649; x=1729244449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7AhjpOVVAnhOPJgZn0n/MxJSbqlC44iwzEWSMXLlrU=;
        b=i1Yd1nupyTiLy2Ey0qqLDwZhf+5+BfVdrQwok4uqPa6jjInUGhPKxYL8z1GFB/JANk
         nNfsfmNA+vrNCM2Jph9c5jRvve9I3tay+bF1qhiW/+WOObK4umz/qnOpsZKq9MGed4K9
         1MVtfebsFIsL8XT029CvObqevNH633CA30oAIi+UZjrMLp6ZRPm7LRAenIIbsm6YrBqx
         rqjYh1H0lzTRhfhDFhuKVTGDX/P4K9enwym2nvqGLxLTzNAllVMBgOSsvu4katErwqWy
         BOfBmA1+oy12L6sUwRzBkTOulVRny049GkPMFmfE/e1J0ybXm1QK+qXHY/bub+YjbKGg
         BXFw==
X-Gm-Message-State: AOJu0YxNaxrj2GqaEiH8XiwoeulFEqEjk0YSzYjeQqaBGYEUF3XOrdFc
	zxWjmSkmnvkSVVIUOchaEy99lLcMtcip7Pc9LaGFW0Cv915GS5nrFm/P3u//
X-Google-Smtp-Source: AGHT+IG/+cAgSQ+5fGXIcN1uMcpXrVrmlk8jdj2JQFkFspeYwHXnn69GCnIs8Iu6eLdEN3k7633Y6A==
X-Received: by 2002:a05:6214:449b:b0:6cb:e770:f50b with SMTP id 6a1803df08f44-6cbeffc1ee7mr36700466d6.33.1728639648775;
        Fri, 11 Oct 2024 02:40:48 -0700 (PDT)
Received: from ernestox.. (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6cbe85a5b7fsm13855256d6.2.2024.10.11.02.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 02:40:48 -0700 (PDT)
From: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
To: 
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	ricardo@marliere.net,
	skhan@linuxfoundation.org,
	0xff07@gmail.com,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Vasileios Amoiridis <vassilisamir@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Angel Iglesias <ang.iglesiasg@gmail.com>,
	Adam Rizkalla <ajarizzo@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] iio: Fix uninitialized variable
Date: Fri, 11 Oct 2024 17:37:45 +0800
Message-ID: <20241011093752.30685-1-0xff07@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang found that the "offset" in bmp580_trigger_handler doesn't get
initialized before access. Add proper initialization to this variable.

Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
---
 drivers/iio/pressure/bmp280-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
index f4df222ed0c3..7d4151826b86 100644
--- a/drivers/iio/pressure/bmp280-core.c
+++ b/drivers/iio/pressure/bmp280-core.c
@@ -2210,7 +2210,7 @@ static irqreturn_t bmp580_trigger_handler(int irq, void *p)
 	struct iio_poll_func *pf = p;
 	struct iio_dev *indio_dev = pf->indio_dev;
 	struct bmp280_data *data = iio_priv(indio_dev);
-	int ret, offset;
+	int ret, offset = 0;
 
 	guard(mutex)(&data->lock);
 
-- 
2.43.0

