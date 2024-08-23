Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F0B188A10
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Aug 2024 15:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427265; cv=none; b=K5/zV6EqpwSEb1rocg8ghc1yXYhKf60ExD4KSHkFlD16a9hDfGg5WFyosHqWHOsuh/htIab/IHu66swOxhH/aSpj1A8j9tbyEEFUZ4hLMecw/iq215uU7lGEElkASPjdmaSg3U6IUOz5b7zRA2Ozj0QeFj8yZLP7/r9mZJTELQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427265; c=relaxed/simple;
	bh=9a2e+v3FT14bhuAj+QqfdFafJhUg0z4MjKBWadxqB0k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bBFjvcGPyLOvO79R9x4yScou9WUBK7TgDq0W0f/3x8+VN/NCaHyASAxrhPjdRGcfYdN02FtbSMq79Qzo9U5U7Wcx5NaJj29PNbb7td/YAdWzgu9lOv0vl74gQaJFDVDkwYkc9zlimZoz7caqOdh1JiplRU2SPiaoCHRyPXZ5aJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6kKBiYP; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6kKBiYP"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFEB260ED5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Aug 2024 15:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAoN0kuW_nvH for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Aug 2024 15:34:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F276F60DF9
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F276F60DF9
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b6kKBiYP
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id F276F60DF9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Aug 2024 15:34:22 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2d3bd8784d3so1654151a91.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 23 Aug 2024 08:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724427262; x=1725032062; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IvYT3UWBCKLp8ogLPWqf/Z+jzZrJA9UrUg3fh9E7FtM=;
        b=b6kKBiYPyQeXZOU0/EBqEmS71fWIsJYdUWPk2uDMpOM2ITXqn6saTHuDOMUj4GuqN0
         HhWLAxwoKHiynZ+t49tFa7j1T9J5U7rLUZaRi78lPAcOvoI84RD9RB4/oDtYL1/SrQaw
         yIUrZCLXtENiL7IOVK1vLn8yi/1UYJzuBlzSflw3gY9Ax0+gDf2Aw6m7EYNxLIawUbTn
         2E0qjl3Pc3uvuG5ePxcgflTCYn9aFcdolXyji7bC/HWY8vdqpW3wNw6zTi4mHEjOTabS
         mM46Hfi8z+qI7vOLz9Um+HdPk0+gFOL28X0f/88M976WA+6IL8nf6u/tRoqSi7aUZPfK
         OqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724427262; x=1725032062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvYT3UWBCKLp8ogLPWqf/Z+jzZrJA9UrUg3fh9E7FtM=;
        b=Qrsex2x5RzTufCuJjXt3C8sTyYoUHTNMFOLude9sxMUZLumGOFcYB0hCokg4PrCREe
         DMegf/7pOpi0PvCvuZLELWECFinq6ubXRKLy25tCf8Wy47Pp8CoeGO325j6H8jtsKfcg
         nGz4VSC4wNwsJXxYQ6UO+yO7mYJ8EOVC1pq3TS+afQ5t0PhpOGLMcMsAR/2MeK8DGTpC
         xLNA4M137s5csdS0sjWYoXWA6h36ZR3mKF0fjeGoEg8Pj3XzUBCBC+v8Lyr35jbez66+
         qMwLwqkEaCPy12bEkHIJ+QOcU+RFGNirTQmqirOXOQ56+vHvnYFm3YjN+Vnn6df5DuUt
         EQEA==
X-Forwarded-Encrypted: i=1; AJvYcCW1z7nEMO8OHXJCsdYpuev62HyveGJ1Ewm8p3MwRqj8XyV7j0SV6/oR9Ef8SP3kR9b4p4iMiYpKKg21xS/EfPtvnJ5skw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yw+BUicxOOVij6FrIFvsEPUiXcaakrYKA3WhzS5yQk5S7l14Tow
	vUviw6bY/CWF6g8AgjfpDF7WRFEdxafTX7LxBUIMot5FYmouuHBe
X-Google-Smtp-Source: AGHT+IFd1+TQM65D80wpYcq/4gnpICwdY2KG3PE3VutyDwjVB0LL6tzDDULZQp/CxaGN9r8zIiKXjg==
X-Received: by 2002:a17:90a:77c5:b0:2d0:d82:60ae with SMTP id 98e67ed59e1d1-2d646d6f656mr2630453a91.37.1724427261685;
        Fri, 23 Aug 2024 08:34:21 -0700 (PDT)
Received: from embed-PC.. ([106.222.233.87])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb913460sm6550531a91.21.2024.08.23.08.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 08:34:21 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com,
	garyrookard@fastmail.org,
	linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	dan.carpenter@linaro.org,
	christophe.jaillet@wanadoo.fr,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8192e: Replace strcpy with strcat in rtl819x_translate_scan
Date: Fri, 23 Aug 2024 21:04:11 +0530
Message-Id: <20240823153411.74142-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strcpy() with strcat() in rtl819x_translate_scan()
Also Fix proto_name[] buffer size issue to accommodate all
network modes.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
Changes in v2:
- Revert the use of strscpy and replaced it with strcat.
- Remove the 'pname' and replace it's usage with direct
operations on 'proto_name' buffer.

 drivers/staging/rtl8192e/rtllib_wx.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
index fbd4ec824084..ec0c4c5bade7 100644
--- a/drivers/staging/rtl8192e/rtllib_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_wx.c
@@ -23,14 +23,14 @@ static const char * const rtllib_modes[] = {
 };

 #define MAX_CUSTOM_LEN 64
+#define MAX_PROTO_NAME_LEN 10
 static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
 					   char *start, char *stop,
 					   struct rtllib_network *network,
 					   struct iw_request_info *info)
 {
 	char custom[MAX_CUSTOM_LEN];
-	char proto_name[6];
-	char *pname = proto_name;
+	char proto_name[MAX_PROTO_NAME_LEN];
 	char *p;
 	struct iw_event iwe;
 	int i, j;
@@ -59,13 +59,12 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
 	}
 	/* Add the protocol name */
 	iwe.cmd = SIOCGIWNAME;
+	/* Initialise proto_name as an empty string*/
+	memset(proto_name, '\0', sizeof(proto_name));
 	for (i = 0; i < ARRAY_SIZE(rtllib_modes); i++) {
-		if (network->mode & BIT(i)) {
-			strcpy(pname, rtllib_modes[i]);
-			pname += strlen(rtllib_modes[i]);
+		if (network->mode & BIT(i))
+			strcat(proto_name, rtllib_modes[i]);
 		}
-	}
-	*pname = '\0';
 	snprintf(iwe.u.name, IFNAMSIZ, "IEEE802.11%s", proto_name);
 	start = iwe_stream_add_event(info, start, stop, &iwe, IW_EV_CHAR_LEN);
 	/* Add mode */
--
2.34.1

