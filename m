Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5782F39FD6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Mar 2024 20:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711744403; cv=none; b=DGKMOb4N2/5xvzpF0O83i6ivxxdMkEudH6AlwglKPveMnyWAO5h+qkzIRNQqLWCV0Q+OVEFZ36RAMPaveUn3nE4fPZe/czKGpeVjuiSJPhgHKlwYXxJPfWhx7nppk0KCbd9a/Jozv2KOevZ0/BZLe+fLeRgkLrLTYzshsjCpqkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711744403; c=relaxed/simple;
	bh=MmKPUNxZ+susb4kr/ZOyBooFet2Ni9V6EkAgfthmPGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UjJYSUGccg58jG3BGhPxsRX9xJaw7mWSUcVsZDjjaD5tvHKaeQpqNK5tsZMURzKtqNU8/UVOHA0svSYULwhMpCBQZhtBmxCWPIHKE+4hW0s/Iw5Bwd/JDEqKl4R74sc7bnA/uW+BAGYYcPR/8K45i9aKup1r/nqcPM7BqTvi6bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3XC0VTo; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3XC0VTo"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A6B24000E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Mar 2024 20:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOhMnRqBDn5G for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Mar 2024 20:33:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=shresthprasad7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 43E52409BC
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43E52409BC
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A3XC0VTo
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 43E52409BC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Mar 2024 20:33:19 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5e42b4bbfa4so1393660a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 29 Mar 2024 13:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711744399; x=1712349199; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9y/dxoUHYnuLJXM/FbNFKWazEIf0YDN2gZikUVSS61Y=;
        b=A3XC0VToYcPO3rItKR8Q/w5Gc0gGi+ESA+YYQE+rXX0od4xD7Ez9YThHeRKDQmK7oD
         WW4QZfp4eROB0t0MkVdqAKajHXuhaARglzFuWaRPXYy0+F+ItuHHSsBQgf63LEwstUhu
         PkiGCFG7DQNEpTm2js3vwgZyJ/wOexgcZLYx1CXecLiu8JFpWmWSILvxg23H9rVx0fLt
         IEEKWGF02BKfTo3taa0rkqIxzqpwpUG3gHfviBljIWn+isPH9luzB4n/zFq5YxYPZiEF
         ACKjbjyH4KQyv1jJeVlQVlPwOXQeptFoKOYY2G7FfMsPhhZEW0GuxZaunxJqEDIXgxt+
         pdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711744399; x=1712349199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y/dxoUHYnuLJXM/FbNFKWazEIf0YDN2gZikUVSS61Y=;
        b=gU1h0WGF1GVDbQJ7YSM4ue+hVRoPCTYE1DOldNCsMa41fGI3ITGxOYOGbEuj2NaQHl
         uPTG9KVdQ8V471ayFdIQlS8MTjQW7+OWSrxy4l0I48N3FCCnUQdiZiRrbS7SMm+rYm17
         p0ykLuPbXhkXl+3jtossaG/eSC3uilPhsnQUzsQhzfF6N4OWwPdyr5htQ9d1WAYj9Tw2
         q7K4cy84O6MAaVKJlrAC3WiRmQ4OIud1PjGPdmpwsp5qDEsYgc4BuYk3mJyprFXV07Ew
         AlGGbyik6iX9r2ZX481J7mZ5CoTcQnxPtFHZYJ6C9hOvNf4DAj453UMGV0H9itQyhnoN
         jc8w==
X-Forwarded-Encrypted: i=1; AJvYcCVVo5kexBjKcKqCXNOZyR4K96lePg7EL5Vx1VAWTZFnA5vEvS41fsgdFjrumEEUAW5D09e/4H99Xf7mD+m6YnLEGWa56PmlmXlCBlRIN+QMyrYXHc9/F2tIrpO9b09j
X-Gm-Message-State: AOJu0Yzk005mha03IVxFq0CpUo3ZDSjsiaaTn+NoSoLCaVzL9YzyU5ax
	k2WESK8r40woIk8EWS0P5ZW4bNNPZ2IBLpKzGbw6GdDKzTO4KUu3
X-Google-Smtp-Source: AGHT+IENv1wF/FlhJUBdDw7gbHcuc9C7OqOL6VgCxshez/VMiYYzHneKoAE1DtcwhSriDloEUjcrhg==
X-Received: by 2002:a05:6a20:3d07:b0:1a7:1c5:4746 with SMTP id y7-20020a056a203d0700b001a701c54746mr1717945pzi.1.1711744398901;
        Fri, 29 Mar 2024 13:33:18 -0700 (PDT)
Received: from localhost.localdomain ([122.161.51.128])
        by smtp.gmail.com with ESMTPSA id w26-20020a62c71a000000b006e635740126sm3524177pfg.112.2024.03.29.13.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 13:33:18 -0700 (PDT)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	christophe.jaillet@wanadoo.fr,
	prathubaronia2011@gmail.com,
	luca.ceresoli@bootlin.com,
	robh@kernel.org,
	u.kleine-koenig@pengutronix.de,
	frank.li@vivo.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Shresth Prasad <shresthprasad7@gmail.com>
Subject: [PATCH] staging: axis-fifo: align arguments to open parenthesis in axis-fifo.c
Date: Sat, 30 Mar 2024 02:02:24 +0530
Message-ID: <20240329203222.12889-3-shresthprasad7@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Align some function arguments to the opening parenthesis of the
function as reported by checkpatch:

CHECK: Alignment should match open parenthesis

Signed-off-by: Shresth Prasad <shresthprasad7@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index c51818c56dd2..a70af76be7fb 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -376,8 +376,8 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		 */
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
-			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
-			read_timeout);
+						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
+						       read_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -517,9 +517,9 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		 */
 		mutex_lock(&fifo->write_lock);
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
-				 >= words_to_write,
-			write_timeout);
+						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
+						       >= words_to_write,
+						       write_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
-- 
2.44.0

