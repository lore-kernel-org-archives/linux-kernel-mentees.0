Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918812E6105
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  3 Sep 2025 12:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756901887; cv=none; b=HuKgA31svtiqw/7/PNSFqVPd1NhyX7nmdvrShc4H7TpXFzD5H8PB5dpDNYd/1dDTHp1btMt1MpFyxjBrIYODEThhMM52UcQ7vTccleIDOfK560/kc+GR+w4JG6FE+tmsMl1Uj14ZA4RV2OVG6eT7x6rg9iV6qtvAu/mYqnEMvno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756901887; c=relaxed/simple;
	bh=95OBpDFjrMZLWP7l6nQotjdku8KnlWrTHo+gw7ZdET4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FvrxrYSLWXSMLUNjAckRGka0ZS8mlg/TYtqfEGuXgZ/WzDOAcJFuQCDlNankf2SfKSrHzvXCHtrbFi9h062JibLylZQH5dL0HiLJ27VIsAa4UbzxdUxGsBmT0zF2Od0D6G89bTdLXPaD+wZhzodMHAciNHMlvaZ2ktGqhs4Ry/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kp6mb0fY; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kp6mb0fY"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-772679eb358so2072160b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 03 Sep 2025 05:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756901886; x=1757506686; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AgtFd2zd49CBSr/rWNwpzPccn2qZ7bpb6f3yzM2Jf8c=;
        b=Kp6mb0fYL8DB31UCxTxP5hGsUpuCgAhUnaIf3B3BL47KRePuuWPfmOLojIEUTl/kJ3
         ItZc7u4wlJnpuTsnohsZ1TU65AKvqcT4l267WWyD5xmqGbB8OMmcZt5t+3Nd8n45QXfm
         LnK8Eg+qyi8q1tYTfZWZ63y5rSPV/9KG84jK0zxiWxIa0H+nlueAImeJWmLfLAmibOs5
         bxGisqoWenIoMmj3dzm4v0z7NNa+YFMoqI6wK/iOZurOVfEi8ZZkEF9ZWPe8fpzn3968
         6jh6URu1Woj41HmBc3gHQyOMHQn8ApX6PCQMfITv1+HsbsoB/8mqocKOLxiMR8kgaU2v
         nISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901886; x=1757506686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgtFd2zd49CBSr/rWNwpzPccn2qZ7bpb6f3yzM2Jf8c=;
        b=tUvOzO1pKYSEMiIR7NS2p8aCZApwtxCykarT/ZI7GMi+rAr+7Uf996khfnB3Wavx/D
         PT0pwBNMVj96vvKZIPkAFCbK8BeaaOToioCM41lLyrSB9iDlzRVIJuom+i/MvW+olhtl
         UnWs/84pw2vXbWmdQloe+jtir05X7I4JTlLAoWYoOJLWPoSsWKoXm8Wq8FCpjFzHQ8wn
         RXnXP9R6IicdxyPDcPuLtkp5bCaZ2gbEwCsZQtzERfj/LkF+taakoICZGeQhbP82twyC
         thlmxU63MJBNkzW823KDkXf2BfO8pUDBRXv8fUbFG6RCZEoW3FDSMPCb24KKLiJ05IqS
         gUkw==
X-Forwarded-Encrypted: i=1; AJvYcCWzv0oKPdDRFFy4Z+XP7Vq9QpDRNz7tBFA5cA27S1TeuISPqvJTJ8LXQGV3n6zy7OsYbubttK98YxA35hyM0bpj/DSD9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJh6woFq4zNP9w+6bbObO3y/SdPSLXK5dPSz7avlbFBOB2mzVY
	thGsNV2KP3A8nPzjIlx+giw1c9p0JWaJs5Pu/eT+3CGFz+Bvb8fNcrvFpK0owypikWI=
X-Gm-Gg: ASbGncsS2wAFFvPVhRv9grGk51QyV4G+m+zz7KWgZiyzNcKjrAnDpYUZyCtSCex7Egm
	g4a8ou6YbvZq83fyalBEnKopURKdq0X6Z0LqUK3lbUKiKfr+GV/URo62i/q005M8nxMDFCoYH3X
	+A6rnbIfjiWDywcTQ2E5c+6XYGD6CP+KB3S0g5CiNaygxYV6ADTnbCd2vayivmpHxV9xHpltTxN
	Wv/JJ0lfMOf1jG6wtxihS4T5YXmR6nM5o93WMHb1A0UOEkJFFbGdYocK6KWwLvprgloQIYz/PYS
	HHnt/bOEQvK1a8fdWDLkFQzcLEKAZaNzaH2J3gijO/MKbAqdg6iG0KmjAE0c2QILocN0C4hKNgH
	eBLXJzaJ8yrmypBmZNBFl6BJtev6m7LB/w6Sw
X-Google-Smtp-Source: AGHT+IHXlQs3naooWGZvpcsO/wbHJ5kA1brIeIBq6OMurJmwLCXCEAjzel1TdBQ14vLml2G96C56Lw==
X-Received: by 2002:a05:6a20:938c:b0:249:d3d:a508 with SMTP id adf61e73a8af0-2490d3e1f8emr1791836637.57.1756901885674;
        Wed, 03 Sep 2025 05:18:05 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725ad1e9afsm9061010b3a.11.2025.09.03.05.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:18:05 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	rk0006818@gmail.com
Subject: [PATCH] mtd: sm_ftl: replace strncpy with memcpy
Date: Wed,  3 Sep 2025 17:47:46 +0530
Message-ID: <20250903121746.2527046-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strncpy with memcpy in sm_attr_show and explicitly add a NUL
terminator after the copy. This aligns with current kernel best practices
as strncpy is deprecated for such use, as explained in
Documentation/process/deprecated.rst. This change does not alter the
functionality or introduce any behavioral changes.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/mtd/sm_ftl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index abc7b186353f..575e137ce8f3 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -44,7 +44,8 @@ static ssize_t sm_attr_show(struct device *dev, struct device_attribute *attr,
 	struct sm_sysfs_attribute *sm_attr =
 		container_of(attr, struct sm_sysfs_attribute, dev_attr);
 
-	strncpy(buf, sm_attr->data, sm_attr->len);
+	memcpy(buf, sm_attr->data, sm_attr->len);
+	buf[sm_attr->len] = '\0';
 	return sm_attr->len;
 }
 
-- 
2.43.0

