Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFC4319618
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Dec 2025 21:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766527155; cv=none; b=cMScX3nMBPy3nZiVaGJ2IQPpCNFJIleP2huhWayYiNxhx82n/lfmg49AbLDSKK1tPEz72VOwLnkOduBsgjEnkMx2LGV2yk3msr1qexEXcIqcqyE8S0bmzrESix1HX1/egEBOQFu3pvWl8BJXxwho00jP1bvVG+XbxOoLEET0U7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766527155; c=relaxed/simple;
	bh=o5/d1n0tGoXesIT7xFEShhShec7ADyKFhy1sjeMZeao=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VS0Vkfs7NnV3VQ1Jr7Z+X2jLiHhGnZ8VySksYbCD2Tu+nmbhjolzXos5Z6j1+9/W0iBVwncPAl92Sz7DkSsDWYFMyeFPfabwNltZBfungOcrlLCU7odEp06h13GJowEmm4hRZv7CpC1rCZ9F8FxBQHZ/vOxRe6UVkuhN5yVl+64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEZHtzTd; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEZHtzTd"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b727f452fffso1037987866b.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 23 Dec 2025 13:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766527152; x=1767131952; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IUybjfCPuH4Iea4yG3y/BgalmWwW4QAXVnrciU7xwY8=;
        b=kEZHtzTd9GEGljF4iyhyxRu/0CYi1tjMYGdWe0v7/HFkOqM+wozmcv88d81XR/casA
         DJK0Zre5ID4usqI4rUI9NFm/8ABzOwEZ9QsHUFlXxLUVsh1JUQZuUxvWj/nEACmM4ZrZ
         CzE110XeR7dzI1hl6j9WgqpGmHFuqLOcPXUd/QdTo9MffLPhNjsfALqIlZ2wFKB9QoMG
         pFBXOO18ceUMFNOQnXDzkHK8OCP/Y9qL7s2fsv/wmTSU0WHuj1gEGrG9tHC+Ha/ar3iS
         Y4b6kpevGyCUobuCOgFoghmNJUAHrPKuELPULjsm+8F7LSojuE1Qo1Br6R5bmJY4Acuf
         5M5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766527152; x=1767131952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUybjfCPuH4Iea4yG3y/BgalmWwW4QAXVnrciU7xwY8=;
        b=sl6vDuJYFy/39S/1WroFTjeAmnjKfkKzQ2e29E/XzqFQckhxlbGUnjlgHxtOW4sLkr
         DIYwlN4/aFrOKUAlRTkiV7n/Vi893EVHxeayDSALvL1/16qfndapqUzTbUiPAinu6qDo
         uoFgffAkmU4SWomf6b1jDOmt9DOUARut9VxL9K8nsEv9y4Wr8/07y4W21dnjPwZ1igYA
         iepAlaspFaN7hlIyPah3tF8DY2vEfzw5nTjaFw1C92MPPF059RDwEBGeyiZo2P8BJfvc
         m2EDqA3YwQDIItTrooPsikjlYEzbgD+BAr2r1vzVP0EWiwbydCVDoIUdoJz9RyirK43E
         GqnA==
X-Forwarded-Encrypted: i=1; AJvYcCX24BXDBRcvJ/+nnDhz1FC428qqDLgGz5w5SrDcG8CoQdcnLt6RcwlG0jsqqhOqdkXyJlRNQkqC57mkxEKXc8m5WhK6AQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAqMZ4TiLHPv4x+66/VLHpFaw38xZmjpPK1uLBb4wiX2DtseP9
	hty8taHR5m3X2w/dXrEqPHQcH0LAbIr5/am1bftKIfsPb0zaukBH54L5
X-Gm-Gg: AY/fxX7mV6vWEoJhuyXk8Plm5nFjx4LLAKPsuiYmJMwFZePKhVLFpire5VIZJzGxDx6
	/sR1unY3RMT592j4vqOgif+yhk9lQL0jaqgxPnlxywVLMNhM5ls4rplTddYSQF7XjyfErlkv7x4
	72USOJFjZ0th7lBvEu/0TJY0uyuujsMrGfHO0ZEv05uUC6CQMp6alCZlg2SK48Evu3uyZjazunx
	zFh4YQtLan2dTKzSRhmOiw1/tEoHjGufqKsiH+d1TWWHpD7J7y0Wa06rmIOxKPz8BBgvg+Ekkfe
	VII857ZhakWD7HUH3nEJkg28mObPsbnT8gmeFquAGaBJ3yGjJ9ib1ryvORKdLQS+knTF+gmP9fU
	g90gfT1HtKQnJYt6eP4b0JiJ7XHnlaGw1uiAiGgEU7NkY+dM7/SBikICPViO4jf5nxRDUeDTHnK
	+T8x/cPQVqDawvf+2z4buquLf+E0fNXv0QR65mCFuwTxntW3kBJyjwvlHXv8w3DzQpJTr95xr8e
	cb0dNUAv5WF2HmyWfvO/SHrFRXUJohK7aIn7ztSzG4=
X-Google-Smtp-Source: AGHT+IEeVPrStoOO63n58znMCh+CtUHUnz6eYZmVyzuIxpmSQdcD8/AU3tbM/KBMj8HL4qja3IyUfA==
X-Received: by 2002:a17:906:23e1:b0:b77:1b05:a082 with SMTP id a640c23a62f3a-b8020400379mr1461607466b.2.1766527151725;
        Tue, 23 Dec 2025 13:59:11 -0800 (PST)
Received: from localhost.localdomain (host194.safe-lock.net. [195.20.212.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ad1e6dsm1559098366b.21.2025.12.23.13.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 13:59:11 -0800 (PST)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: tytso@mit.edu
Cc: adilger.kernel@dilger.ca,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>,
	syzbot+703d8a2cd20971854b06@syzkaller.appspotmail.com
Subject: [PATCH] fs/ext4: Initialize new folios before use
Date: Tue, 23 Dec 2025 22:58:55 +0100
Message-Id: <20251223215855.2486271-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KMSAN reports an uninitialized value in adiantum_crypt, created at
write_begin_get_folio(). New folios are allocated with the FGP_CREAT
flag and may be returned uninitialized. These uninitialized folios are
then used without proper initialization.

Fixes: b799474b9aeb ("mm/pagemap: add write_begin_get_folio() helper function")
Tested-by: syzbot+703d8a2cd20971854b06@syzkaller.appspotmail.com
Reported-by: syzbot+703d8a2cd20971854b06@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=703d8a2cd20971854b06

Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---
 include/linux/pagemap.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 31a848485ad9..31bbc8299e08 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -787,7 +787,8 @@ static inline struct folio *write_begin_get_folio(const struct kiocb *iocb,
                 fgp_flags |= FGP_DONTCACHE;

         return __filemap_get_folio(mapping, index, fgp_flags,
-                                   mapping_gfp_mask(mapping));
+				mapping_gfp_mask(mapping)|
+				__GFP_ZERO);
 }

 /**
--
2.39.5
