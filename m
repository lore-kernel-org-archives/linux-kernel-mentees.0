Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D5381AA5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Jan 2024 17:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706029250; cv=none; b=cSVUs4VYkyBifDiPjY+SkuFtC4xYmlgYbSmwpWS6T9vbW9BXocTatUe78ZWGBrQoalJnxm53Aoqg5oOExw5soHFkrP10EHIHVht5z9AQF1J3eaDWE0Cgs+FO+wUUTKsUCqhA5OnCKasFohpbkq7iWkj9zNtFik7toxvorISzxi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706029250; c=relaxed/simple;
	bh=JXNi83z3g4sX+ICW8C4lvgwYzci91IhbPpnvmdwCIgo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ummt+2bgdIIdP0smUeVZqS7rEEoLk74oNqCCiT0NaYFjaT94hMXsGkQwgEOxegP5OViyOtHEdJ/trjYQN3faFHgHLOG2RpACvugWhkBJ/iwH7NDT1eduNl8ePHj/vpHHj9JviFkG5x+M8lWlqz8NcmNH0RztxHDR9fWnBZb3KQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bntQCLZN; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bntQCLZN"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9D82403E5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Jan 2024 17:00:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9D82403E5
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bntQCLZN
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WbPDmBy8oPsg
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Tue, 23 Jan 2024 17:00:48 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0230340217
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Jan 2024 17:00:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0230340217
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6dd7a44d51bso786775b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 23 Jan 2024 09:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706029247; x=1706634047; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OteIcE5G3PZcm9puMaqfcpsg4eSz1Cg3ZcdX9mf5Lqg=;
        b=bntQCLZNWI4mB/mhpRfcFn4e3OTrCitPT6wGcwcBgzzfjV0D7P6ucw/kkm235VdXJv
         dzGN9+WKuPOejV523NvwojRVx2vc+KQqtVUGfAVjolN+jZnCsXi0rla31KjsLehTuB+6
         fQhB4ncMvQn5c5kHja3PUjwoijoqGSPN68GOL50f/uGXh5ya9qx/enw3aOCenKeZjFbr
         XU4IdE2kF+5wV7fPe72LB8N9GoXHULC3UyXrDO9TixulFY4umkDA06cKe7OUk2TVKSYO
         9cpeIynzdMnOaBELnAUtrToFgla+xZ7fK1zsMKBFoDbtRo9S2cJP7CvFITtqb/CtEWTM
         z25Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706029247; x=1706634047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OteIcE5G3PZcm9puMaqfcpsg4eSz1Cg3ZcdX9mf5Lqg=;
        b=QHCTvN/rw6S2qi43jbQ9yBlRzaCi+/ETC0o76V0SowhXmRoLoZApsBiT0agAANmJYe
         8w8jWzYm30vAhy1iY57ywzTXPeCcOrfFkWISXRg4PZoMEwAyzGw2BuN4mIamnnlbLRYD
         9V1msnrYc+IYN0Q/ytix4HV6KMWdglMjD0X5HyVgF8QgTFdRX+F49ynvuKj3YeWI/aGd
         Gt4kWbmEN5y2Bs/2ey/fKSjw+njCGO/e8TCfOazxDQCFRA2GDJ2+SuDeHBfajPvrZm7P
         9NrlA7ATzgvsjXZPoJKkvFeitu2mlwKPh+Aub3ifPlFSvuUTZZPQ2aXgUQ10OqPHjbsU
         /N7w==
X-Gm-Message-State: AOJu0YzFqabMMnW7DxPe1RFzI7lJm0AWqc79oHbGuA5h5fcL1Y0GxG+h
	gtYtUA4G/m7233euEBhvySx814qdA9huZkvIk72eu/2m3cQnD1ks
X-Google-Smtp-Source: AGHT+IELkOAvkuKjtdQnxv+JTUBvC7TGzDBn6vg1d7letxHs0K/ct8iuji+gjSfZ6TxvTqRQQoqvaw==
X-Received: by 2002:a05:6a00:3a0a:b0:6d9:a565:9be6 with SMTP id fj10-20020a056a003a0a00b006d9a5659be6mr3641166pfb.9.1706029246941;
        Tue, 23 Jan 2024 09:00:46 -0800 (PST)
Received: from vivek-host.. ([49.37.249.69])
        by smtp.gmail.com with ESMTPSA id bn21-20020a056a00325500b006d99056c4edsm11984724pfb.187.2024.01.23.09.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 09:00:46 -0800 (PST)
From: Vivek Yadav <vivekyadav1207731111@gmail.com>
To: skhan@linuxfoundation.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH] Add Extra kernel Version
Date: Tue, 23 Jan 2024 22:28:38 +0530
Message-Id: <20240123165838.2110-1-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- In top Makefile add kernel version to identify

Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f1b2fd977275..7ba07e50e6d1 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 7
 SUBLEVEL = 0
-EXTRAVERSION =
+EXTRAVERSION = -mentorship
 NAME = Hurr durr I'ma ninja sloth
 
 # *DOCUMENTATION*
-- 
2.34.1

