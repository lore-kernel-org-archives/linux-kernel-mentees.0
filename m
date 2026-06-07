Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32973148D9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  7 Jun 2026 17:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780855127; cv=none; b=UmU2p8dfffwFvCxkm1/PLSrtDpsicFjffww5OiGZ06S0aYzm27qFSnOngSNGvcD2zdGZssu6B55WYdjWg2PHsXPd2kJ55AKOcUzhrQ1a1c3XF7CWvACsEc03UIywjItbEDmH48TAvAr4opaEMdAN6u58m3puMEDwjwKah28eHDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780855127; c=relaxed/simple;
	bh=OxzWpDgTbn1TElNKYFKrRTdAxDZ3awLsdwSVIUMnol8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BoZtWFd9HEPioIWYsuUIejBqSOplMI+ifKoxhdfmiPu1hTpdvD26dohlPRSVP77uE2McjXlnShvX50NGP7WClB8ymEdxknkgBc5kin91KsOwhpXeuwM/4TNwYV0LSfZl4oh8WkOx1JZq5Buw9gHcsHOFfaU9ChvXjD0vSoDUq64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrZqvxQz; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrZqvxQz"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 446064295B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  7 Jun 2026 17:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3dMOsyODEgJR for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  7 Jun 2026 17:58:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com; envelope-from=mahad.ibrahim.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5357E42950
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5357E42950
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BrZqvxQz
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5357E42950
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun,  7 Jun 2026 17:58:44 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4905529b933so37531055e9.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 07 Jun 2026 10:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780855123; x=1781459923; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0/0Irc20jwBOe73u4JSV1lZu4bujVVeUgp0O8Yx5xso=;
        b=BrZqvxQz1cgJqPPiR9YRSeU3Au2B4fE94lZ1dfu+vaib/5o8iCfWGfZ6wyt9uIUa1T
         tLzqBSnYL3jlyY/wX6x8cJZu++TZhBee4V4ZW2RDNkUUOktbszXMeYCv19vTqZP8Pj6U
         kYQsHwuKwfNyB21zbwOvoBwdv8g7HExuzKoxiHI9aaPclGfZrWWGEwOPqWDFMscTgfK2
         v+XRtMLFLmFSgcIXZ1g1h0ajzmmi/VA37z7vHQMFHDIEEuDNLS1I0q9xjIjGBxCU/Ttq
         THCT7okFAkrkJqCO72xu2NkvBAPnFPh7rWc3OUTd5BN1eSbbxmTHdmxy0nVHLjL8Dck3
         G5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780855123; x=1781459923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/0Irc20jwBOe73u4JSV1lZu4bujVVeUgp0O8Yx5xso=;
        b=Z7n8l+EoAHAObCznZMdHVkIFrkHQbyWh/YzEr2An13RKeGNwzi5kvNWTw5SJQL1PSv
         ntohTcu2ZZ1QWjzhoDL9W8CUycl3MwTpVGc6SEnSWhwzMn5Q9XwL0WZD5lGDJgM2pFiJ
         U8V+7lEng6UmFlXXbBaLJJAH2sZ7BnUEy0ljuoVi0pe8NqsBMOhFilWphHjrKbb3SU46
         c2ol0R3FAm2v27laxxF56Q6/RxzU7deOeTeiOfpX1guw2tKt1H4K48oVP90cUHWzV+tB
         U9/ZZSHj6CtWO44/Alx54wBo97m3mL2rOzRz7D7whEQ9on/5G4Dfld15otG4W01RmcLw
         udQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+4OMwPs+lfjdSDTj7HxSf8trrRQuA0PqZhPAJ2zJkjpmsbH5RehzRqgh4GS1CKTjATpTzQyJME0MgmDTDKbcvD4D+pDA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwGxYgd+/z6EEyOkvcp/7D632GR9/h7LboKKUc4NNe9J4E5tE6T
	47/yQepA0x8XYcq3++8+3ZB8VlgO/p6lYJ9GLk7kZaxIv/8HfS4yA3Ty
X-Gm-Gg: Acq92OFweYnPvMONrGU8/RLMomh6/gFT5ag6jJI4iQ3f2jlT1CPiJq7S0vHeYyao5Pb
	OKk8tlgez48HUtWC6cQwpuy5W5a3iLnBGjIiaQy9dQunzbZYo/SCidmrFANDqRubJAf4US9/hzm
	gQen5kTHZd81DIrl1GICi0wJl0U/lVwZD6LK/V2rpbb3uU8XyRQa6eYOCXbAv3Nj+8/BoNMof9z
	jxx2l+njk8hx8L9vRSElwUhWBm4tZcAzsUsmGUP67E946jm/dD8AZyuM5FJMfWaq5JGrV3HPNgp
	+dNya808qx08J0ATB/JbOSR4oYzE36uVE8mn5ontQZ9luzXJJYSux1rwczQVz72egBzrtm22MPZ
	ybKNZJOZXfNw6a9rwDIVq1/rnySKYM/paEnY4iU02V+BLNfEhVzmHUN+e4VJqQZGPa0w6ITEMDw
	vclDx3fO8WKnIraGHEFVlwRb1PbfZrdHeinx5EpnqS+jcCJqIdj1Jv6+B3NQ0=
X-Received: by 2002:a05:600c:674f:b0:490:b4bc:4f3d with SMTP id 5b1f17b1804b1-490c25b06a1mr197238395e9.18.1780855122914;
        Sun, 07 Jun 2026 10:58:42 -0700 (PDT)
Received: from localhost.localdomain ([2400:adc1:447:6d00:1c1a:7818:23f6:aae1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc391aaasm379740795e9.1.2026.06.07.10.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 10:58:42 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH] fuse: use min_t() instead of ternary operator
Date: Sun,  7 Jun 2026 22:58:32 +0500
Message-ID: <20260607175832.14378-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace existing ternary operators for finding minimum value with min_t
macro to adhere to kernel coding standards and improve readability.

Fix coccinelle warning:
  WARNING opportunity for min()

Testing: Tested at runtime via sshfs with file creation, appendating
and reading.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
---
 fs/fuse/file.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index f94f3dc082c6..67bab59bc6a7 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -14,6 +14,7 @@
 #include <linux/sched.h>
 #include <linux/sched/signal.h>
 #include <linux/module.h>
+#include <linux/minmax.h>
 #include <linux/swap.h>
 #include <linux/falloc.h>
 #include <linux/uio.h>
@@ -1066,7 +1067,7 @@ static void fuse_send_readpages(struct fuse_io_args *ia, struct file *file,
 			return;
 	} else {
 		res = fuse_simple_request(fm, &ap->args);
-		err = res < 0 ? res : 0;
+		err = min_t(int, res, 0);
 	}
 	fuse_readpages_end(fm, &ap->args, err);
 }
@@ -2895,7 +2896,7 @@ fuse_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
 	if (io->async) {
 		bool blocking = io->blocking;
 
-		fuse_aio_complete(io, ret < 0 ? ret : 0, -1);
+		fuse_aio_complete(io, min_t(int, ret, 0), -1);
 
 		/* we have a non-extending, async request, so return */
 		if (!blocking)
-- 
2.47.3

