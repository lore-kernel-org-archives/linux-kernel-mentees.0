Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650E4252910
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 21 Aug 2025 05:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755753404; cv=none; b=FsJWDCWMGyK7D+uovUt+Pwfl2J4CjVpO8CR7/E7pTyhORL2Yll77cN/32fTpTZ2ylwTCg/3uNZ1GOnr6+vLRwQ2Ix3tuO3eDiTY3VbqRQ2UZoexILki2A/Aux5eVwWhio3KVQAGL6NFCeSGgmuAb9pVs1AZDbygU77qbmDadvwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755753404; c=relaxed/simple;
	bh=BhUu/dqckzWlpFgGsZaoGhamQXuN74Ue3HJx1CshBqs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NSeCZ2YADZuKyyJpcfUl0L5IJW+aIpQtP3exqZ7ULktuHU9bVU0Qx+GKaSCRmBZpjSVoh8kVShDvbBWoBBa9OG/rBIvc5XCptkVefLcKtA8IBaYn9/xBB1JJh5PFRRdbYdeaA38UY2EnWJqi/7gvFq1qJlN7JwZTUv/zChivrYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbQunEoO; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbQunEoO"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2445806e03cso6779585ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 20 Aug 2025 22:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755753403; x=1756358203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LlTHfa+x0uudQk0OxSTFgf0vUez6OOiOBSo0LqzMZeY=;
        b=lbQunEoOUZxNEjkDFSNGa9pnBHu/sY24tdRZS4oYZ5YaRF8AsibuprfcmrFOCm+unG
         Y2gWAAD8j9laQ9EBqE4jpXm0otjp53Ci9C1VTYYPoKSjFCDxaht6TONKEV7XNuZOrtAb
         4PCuVlyqrOZ8kB/TwxLopBNdv2mq/ShP2akT0PezDwUFiHrYlmgvkWAkNomustJWNAob
         mAbOvxASMnbbgQw9VSEoUldo2gQsDiLGPRSCV6gS7jWZVlPnrAv3U0liAcK2GqWeF7WN
         ASUkoP1UcLE6cK8LWhjHYMyO0HcXHstcLli+dJ+fGf5hdpMjF1+2kGApnPTTdj3VAC5o
         EZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755753403; x=1756358203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LlTHfa+x0uudQk0OxSTFgf0vUez6OOiOBSo0LqzMZeY=;
        b=lQ3N6vMnENwUdg5Dr9wDJzIuie/1shmC9xdyHSoYGQcELKQuFCv+oz5AEpmpYj3kJc
         IzP9vqStOgEYo4bXGx5sP22+rukYkxu2QDoPLGxGh+afH2FtU9o9ycajESAXvWe9UslN
         iGpI5u5MDhvQ4bvaeN5toVwO3jRGhkEoOT4E9ZIM6ein9hSCcS7Org3jITdDlBjKKQ1N
         ss/DyLKktkayKegMU9bSCMKNB1K+s8IljRPDa3Bb95x5Ti24wY+cIXwBmTaX2OwKNrZG
         mWj5jO587hjp16rKZG/TKDrb/kxpxu8LZUn5lSdmaRha6pVXcKHWfikCzkY/r1DocxM8
         gaAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsiFL/tU/CQf2pxofcyCa4wL2MFrn8TkcPoWFhOFciLo89k4gnRgxovq2ifLlIZCRLf0VLbjUwvWU3hR73AqZHbUO3ag==@lists.linux.dev
X-Gm-Message-State: AOJu0Yym5DsSXwqoiuCEq0geVH4CYxNn5prYbftWaoV1PsuVjqIFHa4Y
	tUb9JSNiJNKQrnSvh6F7SV3Nw6H+22X4O6MerzodDvsUUFUvBUmg45z5
X-Gm-Gg: ASbGncvrvn2zVcPMNl9sRhimFoKr7rkG2Y4+coieoiIX/lnaXGs7uw8HUiingwC/UhZ
	7KnRQobCH7J0gCC1Y2VX+oNhHZQbrklKGW+dnML0UjDpAsdEafTfw6rpzLl9/fK60KyWLeh79Ci
	ARzRvYBhJCYZqKPQ6cuq12aR64uL+k04ppSzmpLxSbcyfd9IInSvvK1XaEWqb0axNrnsoSQeZtF
	iugtYc9eaWvsz6p1t/yKTPoxCCM52Yju+teP0P4CFlXTK0F88cVwEbYrAe3YZTqTJp8ziBPOPZT
	jztUtljpYeIktiqtNz708zjyyS64zdpnepe9moKhPdBTCjP/9lpL9mPuo/cf229Az++jCx9H1B1
	avGcnEBaIHtE6v9KY2V7fHniVZeJUGhSIpyhCnTxu552L4M3p2RJnehDFsk7CWmWH2AILZaB6UZ
	4=
X-Google-Smtp-Source: AGHT+IFcNAi7YmrTTwPeJfG4g4IzNtFLqJ+Lotl3SbBTAxuRu5974wNQN3hli+1Ix2UxQ0JbmEng0g==
X-Received: by 2002:a17:903:32c2:b0:244:6b46:287b with SMTP id d9443c01a7336-245febee20emr17107765ad.20.1755753402588;
        Wed, 20 Aug 2025 22:16:42 -0700 (PDT)
Received: from primalkenja-desktop.hsd1.ca.comcast.net ([2601:646:9d00:1ed0:f117:a404:888:9420])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245f1954456sm35285305ad.121.2025.08.20.22.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 22:16:42 -0700 (PDT)
From: Vivek Alurkar <primalkenja@gmail.com>
To: corbet@lwn.net
Cc: Vivek Alurkar <primalkenja@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] Fix typo in RAID arrays documentation
Date: Wed, 20 Aug 2025 22:16:21 -0700
Message-ID: <20250821051622.8341-2-primalkenja@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changed "write-throuth" to "write-through".

Signed-off-by: Vivek Alurkar <primalkenja@gmail.com>
---
Changes since v1:
	-Changed '"write-through" and "write-back"' to
	'"write-through" or "write-back"' as suggested by Randy Dunlap.

 Documentation/admin-guide/md.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/md.rst b/Documentation/admin-guide/md.rst
index 4ff2cc291d18..04668272c0ee 100644
--- a/Documentation/admin-guide/md.rst
+++ b/Documentation/admin-guide/md.rst
@@ -758,7 +758,7 @@ These currently include:
 
   journal_mode (currently raid5 only)
       The cache mode for raid5. raid5 could include an extra disk for
-      caching. The mode can be "write-throuth" and "write-back". The
+      caching. The mode can be "write-through" or "write-back". The
       default is "write-through".
 
   ppl_write_hint
-- 
2.48.1

