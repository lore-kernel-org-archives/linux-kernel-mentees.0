Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C2B6AC2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 07:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jNWROwX9"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 601668347D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 07:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 601668347D
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jNWROwX9
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hR_Ajx-61-EW
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 23 Dec 2023 07:22:54 +0000 (UTC)
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B121583123
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 23 Dec 2023 07:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B121583123
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3bb53e20a43so1989161b6e.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Dec 2023 23:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703316173; x=1703920973; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNfo77EiD377cQ7ylz3OMNqhiLCn7Bf56izU6yp9keU=;
        b=jNWROwX9TcVWHrnKFvxCxnyxwNUV5TK6JShTgQkkmti6BmGqRQvZ59+jeyNZBrARaj
         57VdCMXREzpQeQ+L6RBDCmlhok0IJz32QEjArYGTU5NO8/J6WjnK0WZkInT3SpQJgKl8
         A+RAcTYVuJytXITfNbALtaLeWHI4qRsBz5pqiB80vvuuvw8SwL0UzFYwVyB1xEm7m+Fu
         iB8mNdgOAZvh9nR6tWm1y/ccgud8OWoocP8rLHtHJN3J7Oig3uiZ2x1/56eIM/T0IVG1
         WE6m750Ds81KdMy8gSY42CTuSxgXcJufpv8JrQuDWb+0RTL/zAEdxiLdM82z0FNmtsWa
         jWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703316173; x=1703920973;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNfo77EiD377cQ7ylz3OMNqhiLCn7Bf56izU6yp9keU=;
        b=Q+cubZskgdG8n4EvH/d415JOO2lzfJk3oK5eLE1a1OFewSiZAVz6XFzHI7LtAqtsnB
         Vj6oUzseIcfHYdp8jZqf/57Hhqdzh3MTHBPNXemArsR8ps3sTZ33nndVhhX4nSLGPLjM
         6NqA7rrxfO0U3MAUJ3ZWnIIVCH+nwjKNmwEq1rq5/SUsonBDgxS2QNDJz9KkcUpiBhrf
         BjvUo3ukflC+mezbbc+0GRoRlN3nTkc9b9jkNemkRQdSdfDu/ECAgsY3DaSyVSMTEzN+
         6+V5oSRn54wIrjZhGWd8qU86Y/kyDUyx0HtkF/p5NSE/EPm/5ZFZEExrzNh5aGegmyXj
         zqfQ==
X-Gm-Message-State: AOJu0YwDY3YiQcmGWwc9PCzEgSa/yv1//G1aBwwM2X/Jwf+4wasJCQlX
	wUfFZuaEpZKA1+iaKbR3mEs=
X-Google-Smtp-Source: AGHT+IFF55fkH3MfEXKsaer9jFXCaeNRv3FjwluAYkN+PJH68bnw13o1BXJrd+HUY1f+AsGNJCeqqQ==
X-Received: by 2002:a05:6808:318b:b0:3b8:b063:6ba9 with SMTP id cd11-20020a056808318b00b003b8b0636ba9mr3481308oib.88.1703316173647;
        Fri, 22 Dec 2023 23:22:53 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id kt3-20020a056a004ba300b006d9723c0373sm4241378pfb.33.2023.12.22.23.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 23:22:53 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media/atomisp/pci/runtime/rmgr/src: Fix spelling mistakes in rmgr_vbuf.c
Date: Sat, 23 Dec 2023 13:07:45 +0545
Message-Id: <20231223072245.81630-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistake
in rmgr_vbuf.cas below:

'''
./runtime/rmgr/src/rmgr_vbuf.c:201: succes ==> success
./runtime/rmgr/src/rmgr_vbuf.c:211: succes ==> success
./runtime/rmgr/src/rmgr_vbuf.c:215: succes ==> success
'''
This patch fixes these spelling mistakes.
It is good to use variable name that gives
proper meaning and spelling error free.

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 .../staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
index 2e07dab8bf51..1f24db77fe38 100644
--- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
+++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
@@ -198,7 +198,7 @@ void rmgr_push_handle(struct ia_css_rmgr_vbuf_pool *pool,
 		      struct ia_css_rmgr_vbuf_handle **handle)
 {
 	u32 i;
-	bool succes = false;
+	bool success = false;
 
 	assert(pool);
 	assert(pool->recycle);
@@ -208,11 +208,11 @@ void rmgr_push_handle(struct ia_css_rmgr_vbuf_pool *pool,
 		if (!pool->handles[i]) {
 			ia_css_rmgr_refcount_retain_vbuf(handle);
 			pool->handles[i] = *handle;
-			succes = true;
+			success = true;
 			break;
 		}
 	}
-	assert(succes);
+	assert(success);
 }
 
 /*
-- 
2.39.2 (Apple Git-143)

