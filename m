Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D716A15383A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 02:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739326402; cv=none; b=EuWNENY8KV6CCyb0S+Y/IGQy2G6kEx7VKiSoWKJs6+eTePHf8bCcFbNSSNPYHUG4Ljt8uDhP841tW3GxNHs8yK9Uyf4bFTD5kcWQXmtcXm/gM8Rk3qNUZL4Wt1SeR5xtoUPvP/we/mlZc6hr3GdJnScdkO3pk0D6CpnYV8tr4sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739326402; c=relaxed/simple;
	bh=+/B593SmQT5mbUFkEjMNutNlFiqH4deP9fAgQLDXXvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NFwHM6NMYIpMlaT+yPGThfjrgcXHDslCwppSXnGNnc2UoWjmqJac/7yb9Fin6NvBmRw/mrD1RPXw03+zY6mMxcZOU/K1p4FhwfBE1gjpYTXhnK1UL4DPGCbU2jgkaVAO3yFQRCb6R4D8L92jG0/2zozPhgCImfvQNDwrMuGUfng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EuOwRicc; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EuOwRicc"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AE9B41621
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 02:13:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNqhPTpOW44m for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2025 02:13:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritvikfoss@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 948504169B
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 948504169B
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EuOwRicc
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 948504169B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Feb 2025 02:13:19 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21fa56e1583so43621735ad.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 11 Feb 2025 18:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739326399; x=1739931199; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Pnx2/jJtG4JTadkzEhw1I4yWW/cg32nWfvMiGMEaiU=;
        b=EuOwRicclAPIBMnofwBWtOUycPheb2JiRqXd63gngUCWPNUrJJKNtiGN0AvP7WYI+3
         bPweqbRwtDNqIgXP3B/KFR7nawq43d4BIDSzB062y1TbRqU0xsj0Ib9zW3yVY/EGH5rS
         kGRDO6U/Vzcch8NZPD0/ZKcwN4PhylN4Xeaj2ARkHLJGwg5qgAzJbyxvg+AmxDcUI3yO
         roS8+FBOQM6938ofwJAEkaskFfqq78C76vniaNu80xgbcxvTC/tiwY65VMm8OLP2CUzp
         V08OD0scVhjeqSNMiQdrfXp1Rj+233vtd5fDGaZYNFs3aXr3cfwH5l9SfHsAF8dlO1N1
         mZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739326399; x=1739931199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Pnx2/jJtG4JTadkzEhw1I4yWW/cg32nWfvMiGMEaiU=;
        b=BnLkjNHyjhNqGBJBRz5l911ZcY6o9HKCJMQ368KICgnKDR2yXMWsJc9UWjhbgqCUlZ
         HZvzHCdBOZpkXAY3ET6y4Fxna9fgj+PgB94JTY/UTITJelTwTMoythTrH+NkDHSMxtPp
         hNOlUP5sutbnUHs/f9LPYkyoZQ+KDUwgKX/MZJ3nGz9t4DC5xqZvjdm1/FLh6tDHkoSq
         YKmFsOdgCgf/m7xmpoFBRm/6jXv8N09sDWLZKIQAQhzG5+do9ipQVZLODZ1dTocxHjS4
         wmxvfUptsrRz3NyVGtJKJr2PWoJPj4WvBy491sDVfDfofpFbwMuB78ydQca0Ynswb6Q2
         +7VA==
X-Forwarded-Encrypted: i=1; AJvYcCWXc/pf0rVZ6GqPNWvwR9ZOSBN5DMaf02wyt7ZtBfokh+AflXl4lm5Ycmjn2BuWZZYG9XWuXyPxe+uIVU7sQRxFtJNbsg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzxFWGVulEi3J/8aHq/q2VeH4Y7V1A2X+OONa/Edq2MyXDtWVq0
	0DlLvSH3BzP8Rk7LOGCXATOxtMUOV6AxCAiGdQSBQ5FRlch/vh1Q
X-Gm-Gg: ASbGncvLh++ic7o7ZI5tYTcoxlXOW/ZGuyZrZCTOEzzvsjwv6H9yRT6UJNV9hpznpfv
	M7GaMKhU5xuxMUYVTbsTtAqIjNHAp3oGw19SYSJp2m9iETXM5hlZCzQeYgr3QY5CxhcNcasgYU8
	xxAN5yJHcVLk+q1Y+eYW4olVV8wr6qLL2TBpDnLhrLfqC9KrD/0auI00iBU+y0pPTxDzS0Cwe6g
	xdbPACW3Gex5XbKRlUrd/HVvEcad4tvjfe1D3H5ZbAoVzxh7OZdF0PQpD1JPqcF9lzokeVRVy1T
	h9ygY73mb/SFqEUvSM/BUrk1EVR7I7Y8eXdFsrmy3JD9a2VRHg==
X-Google-Smtp-Source: AGHT+IGnQ3T53gmddcoGh5RFkXJnnQaNroa/ymWquGHeUzKjL+S9tt0g4lDVa+ieEBv8vYkOix4TYQ==
X-Received: by 2002:a17:902:f601:b0:21f:4144:a06f with SMTP id d9443c01a7336-220bbad659cmr21829265ad.13.1739326398628;
        Tue, 11 Feb 2025 18:13:18 -0800 (PST)
Received: from ritvikos.localdomain ([49.36.192.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f368b4bd6sm102457325ad.229.2025.02.11.18.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 18:13:17 -0800 (PST)
Received: by ritvikos.localdomain (Postfix, from userid 1000)
	id B184A1403AA; Wed, 12 Feb 2025 02:13:11 +0000 (UTC)
From: ritvikfoss@gmail.com
To: ioana.ciornei@nxp.com
Cc: netdev@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH net-next] Documentation: dpaa2 ethernet switch driver: Fix spelling
Date: Wed, 12 Feb 2025 02:13:11 +0000
Message-ID: <20250212021311.13257-1-ritvikfoss@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ritvik Gupta <ritvikfoss@gmail.com>

Corrected spelling mistake

Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
---
 .../device_drivers/ethernet/freescale/dpaa2/switch-driver.rst   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/device_drivers/ethernet/freescale/dpaa2/switch-driver.rst b/Documentation/networking/device_drivers/ethernet/freescale/dpaa2/switch-driver.rst
index 8bf411b857d4..5f3885e56f58 100644
--- a/Documentation/networking/device_drivers/ethernet/freescale/dpaa2/switch-driver.rst
+++ b/Documentation/networking/device_drivers/ethernet/freescale/dpaa2/switch-driver.rst
@@ -70,7 +70,7 @@ the DPSW object that it will probe:
 Besides the configuration of the actual DPSW object, the dpaa2-switch driver
 will need the following DPAA2 objects:
 
- * 1 DPMCP - A Management Command Portal object is needed for any interraction
+ * 1 DPMCP - A Management Command Portal object is needed for any interaction
    with the MC firmware.
 
  * 1 DPBP - A Buffer Pool is used for seeding buffers intended for the Rx path
-- 
2.43.0

