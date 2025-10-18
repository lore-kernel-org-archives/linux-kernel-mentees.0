Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76551E2858
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 19:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760814751; cv=none; b=gDj3Zd7owhm1cu3AHZcXOL2/QU5P/ZYhFSwpu1waf+0eZ8hxuLM13bLxRVc+z10AoHi10Lwy8OGCTmrb3+Ko5Crcrz7B501nIhxubQcIGnkDaqJy0w0z1I10FrUxUIGJoLPzyP1LgtmgIkV/N7SnFQokVnPq5TLAthSuGXiMCdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760814751; c=relaxed/simple;
	bh=Cpgrt5SbcQFH2dEyWj8y2+kKTm0J/7DumNlggph2KeI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O3mSsvHjcDfN3aJuQvHISW/tQTHutlXaAJsOl0E6s4vrdPlVSA1BqRH6eevPqENX5pVGHWylOArVXkYvhgd3pFwxvhwEpcQHVGN4xx8bjzWFF0IgG9ASCnBLZ5n+EEbqsxVCWrx9wgSqaS95UfiRa9U6sVJoRH42tIE4NMHRAgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pol0cc8B; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pol0cc8B"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 650A540440
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 19:12:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qy2yuK24EJl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 18 Oct 2025 19:12:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com; envelope-from=mehdi.benhadjkhelifa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7771640434
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7771640434
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Pol0cc8B
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7771640434
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 19:12:29 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-427054641f0so392061f8f.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 18 Oct 2025 12:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760814747; x=1761419547; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uenq9zUN4jnOACfiis104z+6oR/uGp0g0fP3KoqPQzk=;
        b=Pol0cc8B9fuZMyRh7gfjppwmTfDPgv50AbsZ1FLcmJzqzWJpT3Bp2GQy084shf7X/5
         9aOB6i0q13HqVG116P/3FSvqfHZWIdaN7HoXp+j+U6IuM7WTd3KwsBr9+/9coUxZ2PZy
         pWGnCqRox/OvP8mWNb4GjSgy1OLoKe28EhSokkhJILEfhpxufrvLy4p5JhD1slEeCf6y
         Qk898PDzSvsbhEvoFvFq/vzxT0EbFFafcrwf4G8CWx3uAa+dQG10X9x+CI0691OjC05Y
         wFbvkmfjejeBcr7gm2AVTINIwukilbTo649VfGU5gyohCiYmgYDg6/OAndliDQgdj1mm
         OOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760814747; x=1761419547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uenq9zUN4jnOACfiis104z+6oR/uGp0g0fP3KoqPQzk=;
        b=ipP6vh+qNByJvj3BJ3ry92uABNz+D7FrgC2E2wD0TSylBIn0f7tkCy/rwG3mzTF5uP
         nS3IRhXJVPWx8jnyToXhzvMacB5SBYSqu7/FCMJYjHdsBxjfqZx5j5GFs2J3u2PZ0Wt/
         5kqngY23KKIROrhK6AN22kMSP7IC0uGOfaIVfDSsjBJxBA02hvTuyoDzSvI5BdPUmJTK
         aTuV5c+F2CVYauhohUPxp5xu6563Jjv3bSoUZORnODHu9ra5Mq+IrOrPI5/+iWubX4nG
         zLe7IsRpei+VOFjUBSU94f0KktGJlkb0aNstZwrDxZsDAEHuqXrKMVWdLs0SG3+Gs+8T
         qofw==
X-Forwarded-Encrypted: i=1; AJvYcCUIhpl96t9M1ZKBR8qj+ecQGAcklTdqJ/iuNQcnUDzFLpU6VbaCvkNCVSa4eT3OmbxcyBXclnO60gOo+3DJew+Eb3Q3Lg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz8GRPLVIsrKXtzRjBRM17jmNHkrlM6wbZWi/TtXf9gWmDntaLP
	jjTsrhDeuik+dVpZoeOMkpgBy7PwIOgxLDqfDssOlsWTqhXpVoIbYH/x
X-Gm-Gg: ASbGncsKWraGGW6z+9bCIBc5LBwOSP0z3gtOUnEzcbZ/9bh1QUgUZ0aN8k5nUlSp+ng
	dLjX0pkg3j1Eubv6OcLTBoA7yuSmQ1dXf+CiGTIsqvT8L0cc7BtLxWNBgaQPfoXKi0TO+wr5820
	YoZ0nI132LOUhPnQzpzAjukxIgnlFdnwTricUtQiySEZLEERBa6MBpiiW/Hy9rWMlPuJoO/QAMk
	X5U9C2XSPRQALYFWGxaI4b7/AzlXHvb3QOJbRlHslX1AMbLpIBOoOtJyfTAUauaFn/ymJE9NUR3
	GbyXDUar0FUN+HJ9h6WxdCRo2KByuhlt78YpTVZ9jEecK456ePS3Ry78PS7f1CUIZrx/SD6B7aa
	MsuFm55MfWq9+AyhBelhWeFZ5Vv09QWYIasHbY9pPgj2TubIrwfa9m6j5NdoUJfXQ/as5FIAJ1K
	N/5LnO
X-Google-Smtp-Source: AGHT+IFeotg3SOqozCDeGAvqxPUt+glB8XDCNwLIM43/UO8gAjt8ouXK8ko6Vt+aDxAZJHhJtcwrow==
X-Received: by 2002:a05:600c:3515:b0:471:152a:e57d with SMTP id 5b1f17b1804b1-47117914193mr32306685e9.3.1760814747218;
        Sat, 18 Oct 2025 12:12:27 -0700 (PDT)
Received: from bhk ([165.50.121.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3acfsm6406354f8f.14.2025.10.18.12.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 12:12:26 -0700 (PDT)
From: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
To: akpm@linux-foundation.org,
	urezki@gmail.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	khalid@kernel.org,
	Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
Subject: [PATCH] mm/vmalloc: Use kmalloc_array() instead of kmalloc()
Date: Sat, 18 Oct 2025 21:11:48 +0100
Message-ID: <20251018201207.27441-1-mehdi.benhadjkhelifa@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The number of NUMA nodes (nr_node_ids) is bounded, so overflow is not a
practical concern here. However, using kmalloc_array() better reflects the
intent to allocate an array of unsigned ints, and improves consistency with
other NUMA-related allocations.

No functional change intended.

Signed-off-by: Mehdi Ben Hadj Khelifa <mehdi.benhadjkhelifa@gmail.com>
---
 mm/vmalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 798b2ed21e46..697bc171b013 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -5055,7 +5055,7 @@ static int vmalloc_info_show(struct seq_file *m, void *p)
 	unsigned int *counters;
 
 	if (IS_ENABLED(CONFIG_NUMA))
-		counters = kmalloc(nr_node_ids * sizeof(unsigned int), GFP_KERNEL);
+		counters = kmalloc_array(nr_node_ids, sizeof(unsigned int), GFP_KERNEL);
 
 	for_each_vmap_node(vn) {
 		spin_lock(&vn->busy.lock);
-- 
2.51.1.dirty

