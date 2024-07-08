Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3270146A98
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 17:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720459384; cv=none; b=it/Ntv1WoYzssk5olhNlvaPLiKYlgx137HgvQgOvSDA7ENN61uAMtyvJXt/fUt6mnwXqc0UstDgEXa/P4bqo9d5PxfkvnRx3UYRWC0s/6oJ2dewzfGB4JzSQccUi3byoJD5NozybF68CAYy1Wbz4gES6h9+V7e1Oy2qEmslhi2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720459384; c=relaxed/simple;
	bh=qYq6s4bNLi2kzyWMR518+ntELHhG9kRHTZCMd61DDxk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IacCHSWDumEMYD2o+uB1BuLiqV9JJ5StZSaVoH2kpcDP2uEZiyg7dIoM9wKEN1WR/pp9s2Lk7WotY8qIhPYMeVA9YHc6YbXJEP02M955oq3S5eDZQ3r8TxTYSXL5jl576l1TyAitSwJRnkHpSOHJsat9K8NF0bPa60zafItMRLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3zLCH/4; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3zLCH/4"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55987811ED
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 17:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eVJNnBmc6H4s for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  8 Jul 2024 17:23:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com; envelope-from=abhishektamboli24@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8785B81148
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8785B81148
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b3zLCH/4
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8785B81148
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  8 Jul 2024 17:23:02 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-1fb3cf78fcaso25370815ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 08 Jul 2024 10:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720459382; x=1721064182; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l8dssTOE5YtjaCpjIjX/bht9CAwJzQ5jf+TiBoCd/rc=;
        b=b3zLCH/4fVv5upy3pko/DJdi28NBadbY8gg5Mlt4BjsNyGdSqOzxanwnunRM315Heg
         qCxUDTrtnksGQC3s1TnyysbjYpqy/Ll3Z9ixs+ZIT3NnFYZUzqtbHwGRDtpmQYWZsj6U
         Jz6ERMTYqi+LDdvtWJK9Oasj6ZRR7jzJ+cqbAogFd3r1+lmAv7IM/fKaHb0itsDrVq3S
         FjT/4WMUiM5P4/HWFS7qHtG2SdGmeRRG/kD25v1XCnkrmPC4D6sEee5FzWIAyyko4pJw
         Lz0HCeIa0v1/tPwHnfNKVZQ4ovEQ7VaH5HHojjjhtjh1cmanf+SspOjsqDBnh7EBBWNy
         vEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720459382; x=1721064182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8dssTOE5YtjaCpjIjX/bht9CAwJzQ5jf+TiBoCd/rc=;
        b=p+9g+5NR0JvCP9MsAYTN+ah5/OxDJ7OUkHI2P8b0fB+d2Y3G/KugL2hAG7sLm1Dybp
         2mW/VGjpJ4EXyHxWIjSe4IC90cRh3HspZ9hlXc9RtV6Brh7szwe6Ie/inopJva0HBgJ6
         bAqw41YJ0M+APVZAoZlG4nRK5zb5tRlux4PvbQX1RhQFCWzfM8J+e9iPfBAi8MnakkjD
         Toee890XoUYXCv3EekzO3RVx0ddOLBKQYd1FEdjRMhkdkqhzeeAmVgmDYcn6qWmNE/9l
         tkQymSfyNs43bgyT2jTXUUDFz72xCElPym4U2QAhWtr40fdimQnlPboWSRTN4lQTxjFJ
         c/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMuJnen6kFzGUDqax38ADSFBlF0YlsFr7ZrElYg/9ABGZj8V9ZKKA4M1MSYbdR/90Kt53vMuO1USFB6mpHS/LlcFUfMBt757vujazg3+f7iYvlfDMAiYh1C+Tbzva1
X-Gm-Message-State: AOJu0YxKEgMCs+UQKGmcpnl6o7mfgXKKOr0N2Tq6cM72K6X3aeUaqUvP
	zqyV1pZs+1qM7NvAq10RJL5LMJoWTxgLISfelb+OrUF8lQNiYxXr
X-Google-Smtp-Source: AGHT+IEnHd1r/rT95kPOKGYZBxgklx50F/DDhELRb5rGAwZPK7BNWUon2xTWMeDCG3gWIbiM3Cj76A==
X-Received: by 2002:a17:902:e84f:b0:1fb:3b30:8ce0 with SMTP id d9443c01a7336-1fbb6ed5798mr1508735ad.44.1720459381664;
        Mon, 08 Jul 2024 10:23:01 -0700 (PDT)
Received: from embed-PC.. ([122.173.216.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a10852sm1190705ad.27.2024.07.08.10.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 10:23:00 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli24@gmail.com>
To: airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Abhishek Tamboli <abhishektamboli24@gmail.com>
Subject: [PATCH] drm: Add documentation for struct drm_plane_size_hint members
Date: Mon,  8 Jul 2024 22:52:24 +0530
Message-Id: <20240708172224.46073-1-abhishektamboli24@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add descriptions for 'width' and 'height' members in struct
drm_plane_size_hint to improve clarity and documentation coverage.

Signed-off-by: Abhishek Tamboli <abhishektamboli24@gmail.com>
---
 include/uapi/drm/drm_mode.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 1ca5c7e418fd..25891a636e4f 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -872,7 +872,13 @@ struct drm_color_lut {
  * array of struct drm_plane_size_hint.
  */
 struct drm_plane_size_hint {
+	/**
+	 * @width: Width of the plane size hint.
+	 */
 	__u16 width;
+	/**
+	 * @height: Height of the plane size hint.
+	 */
 	__u16 height;
 };
 
-- 
2.34.1

