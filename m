Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7A0284674
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Dec 2025 12:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766750687; cv=none; b=RfW2ttTCTlkt2H/jKJMzNJy0h81wAGDhiHcdiQJ7QwbYjvHePDVWBei2/TKrEM2dMWEBdW0ZSIFQT/u8B2vlcsZI/wVmPXRBqFQbhtpm5kSYnCBJscp9YtQHttO4Kzso85zMs0bTqDhVre6sJmKU6R981eg80bVRHjNlMrZIvcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766750687; c=relaxed/simple;
	bh=5WWw3Ai3nUNL+KGovcJwkDFtqP99aWr0F86Mzj5u/cA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pntRWwn5oBfFJMz9lOPWPJ0iDWQw6RJj4BWNQtNLWkPtq2lYTebFdRZv6bZeuJrIXdcdjPtBsBZVNgczgqle2y8ssHhLnh1R40ux6s4eHWXMgVtQVjUphNDSdT7WPrDLPFPNgaTZ44XFlHuFeE4uWmpodUJjvvTbontjxwdyBOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7qimPVx; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7qimPVx"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0DF46070A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Dec 2025 12:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2sv9rKPkUVBH for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Dec 2025 12:04:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=mottikumarbabu@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 05BB5606BB
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05BB5606BB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=L7qimPVx
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 05BB5606BB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Dec 2025 12:04:44 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-34ab4ac9a34so1221346a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Dec 2025 04:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766750684; x=1767355484; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzOikjZCAZIVSqRjJRRgnV5+w+5j2FvIdULvG9czO64=;
        b=L7qimPVxK4KZ5JBtK+qftdCuU9qDYNWNE2d55x9UVwlHFCzUnDfX45jk97e3dHmMo9
         jAosoayda5rhFP1Tnet/ucMSQXuA8FbLnaPNyi1eLpx9FP9AjtUwJIKJETdDCno807PP
         A45pGr1njLNihwvmLq/8ittc6gHvdoveRYPyEl9m6a0JJxMUG2jKqL7AXj76RFVgZB52
         D5LZ3B7dslkw28Mw+XUUVOe0174g/95xqOamxIk9fZF3tM5MOvtv+jr1sGEZn4UP0vb1
         BLFr0Y2snUamrQV6fjl6vASs5dpfqBFc4RSa6o5dpAY1LWaIUWRiAuG1N9h2PIS4UT17
         CIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766750684; x=1767355484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzOikjZCAZIVSqRjJRRgnV5+w+5j2FvIdULvG9czO64=;
        b=d/GdoPGa0Y8ehCVfV4ku9DzJ27qWmuVJrkDx/2wUYdKq4h3eMaygoKAns7QpmWBUxQ
         z3mqZFjzMrCYdpeMazK3hgK+aOkM1j07v7OkZ5N8rCJxELyZVysk2xhu9OCGATsUeLct
         bvPWVxVXTGSa59fhFpznKEt5C0FxeIWyxoMEal55rTFy0hgE/qryYjdGb0vckPAht4Vz
         +vPw3l/oUzCESz3vc8LRbnsHNTH7CW+UnOZE6kjY0DVh1i0PSwsYMbOhmk494MBSK1XV
         GX4JsokmOmPn8bhy14cydSdGI+TcODVS7WKvPy5bwaxSag3D5cuVg++VCsq7/qFhXX4s
         VGcw==
X-Forwarded-Encrypted: i=1; AJvYcCVhlST1ZWccbEi/6Twi8PhQT/YvwoHp/Xpl2lsKjo2v3AlvNh0+WsidJQG1wlclEKGkT6JvP5w+LSlxUMOImFHMYkC1QQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwfYgtdXstYNrje5R17CCajcp4Nr3jhMUdVoSNgrBqfe3kv3OG4
	9SeeBpvNkcfJKDIe+HNNsJG2wTFChxAKsxCGHLtS53TdopRMH0jl5gbD
X-Gm-Gg: AY/fxX4Iw8TCjxS5JnUiQvj7XN2KqjbF0V6e8IR6JkmM7mdQrObJImcCBl2BNOef+yU
	rsXtL30rAyNHTLVzfDLbEJ+zTJhVEN2nJOL/eE42XsbSGhXLohICELaXKdEgzXE9S9hsrBbZf2H
	20/y7Tw6egTxgVYdaAny0kGK4rXjDImQacWYjCoQGGyVjhkiwRrSiJ/JKggBpZmpliiiCRmV0S5
	0z0mx1xA7M93KRLnaE7KM4RdyGjWxRCXj0/L6gy7dL5TWmmc2iIbu8QptsukQLlVOtblN7UTzqb
	51SJdVtfd9qJLL7+5HmaBg5Lkk599Jb0Ed9R/fdcVLBb67D7HzEVJ2Lk+Sip3r5Y0z3GicKQEHw
	nwJ0NsLiOvRwY8Qo8JjhuaiLrn9gX8REdhy8EN1RNZA8vaJvx9aNGrNfd+wdRfiYPaotzMrbD/z
	8pU9nNy1pBdX8aLQ9gmzfDyRl7QA5Mfexeo9zUOgc7tq+ZZtjs
X-Google-Smtp-Source: AGHT+IGHbrz3Pi/17OtuTBKj/RvZlBgKGNkstEwcas0tluFEbj85RUQ4XNy2YcB56+6MmI/E1pvQ4w==
X-Received: by 2002:a17:90b:4d8e:b0:343:e480:49f1 with SMTP id 98e67ed59e1d1-34e921c4431mr15253293a91.5.1766750679676;
        Fri, 26 Dec 2025 04:04:39 -0800 (PST)
Received: from zlabs-hw-ts-ws2.csez.zohocorpin.com ([122.15.156.136])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e79a17fb2sm18821244a12.12.2025.12.26.04.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 04:04:38 -0800 (PST)
From: MottiKumar <mottikumarbabu@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	mottikumarbabu@gmail.com
Subject: [PATCH] staging: sm750fb: fix const array warning
Date: Fri, 26 Dec 2025 17:34:17 +0530
Message-ID: <20251226120417.2599020-1-mottikumarbabu@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a missing const to g_fbmode to fix a checkpatch warning:
"static const char * array should probably be static const char * const"

Signed-off-by: MottiKumar <mottikumarbabu@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index d100b9e1d3d5..7afb58561a0c 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.43.0

