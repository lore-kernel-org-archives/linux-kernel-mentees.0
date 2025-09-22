Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA332F0C75
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 22 Sep 2025 07:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758525123; cv=none; b=V2X6wCsDPxNKk65SDM20v1lWQspafh+bg7R/82ADzvtPXQvaUs88sBzXrD0z5tYSDmRZ3xpWJiSf50hdcpljTh0UC888AZGOArtxSmEC2ebaqbpt8AsRFdEYr8TVaRfH8Jes87f0djHIVddD8dAnk2j/NsTLpw/Ay8Ro3VKvSQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758525123; c=relaxed/simple;
	bh=d/ugOaQrlaY7PrdpD8UD3GGiibqpO+25BScz2+luv2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fuqLQIohzWaW/32ZQIgit0t0FrWpTdfMqGf2ICPad2pgDFU+akA4BaAtuW8wDrXHXc4mXiy/j5W5DS7eT/leKAU6V9ExTUsKzSPgtB0FB/IL6+tgTBBzR9AMImOoItiVIky7vYhfjxz5da+S9uSbxSL6m22GNFZ2zQbOBcvwmrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJOFmKo5; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJOFmKo5"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC41A40B7C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 22 Sep 2025 07:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYbF8APf_hVp for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Sep 2025 07:12:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=rk0006818@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3FD4E40CC6
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FD4E40CC6
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BJOFmKo5
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3FD4E40CC6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 22 Sep 2025 07:12:01 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-77f198bd8eeso935210b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 22 Sep 2025 00:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758525120; x=1759129920; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L51uGeNa8nacgso8hnxd+eYLYxlc+LmoJqaI+35rjr4=;
        b=BJOFmKo5e6YnJtuA+4kHyjuJGHXf8FbrOb+CPZti4/58DyMILkQc1xmYrdLFyrzVrG
         ckBjqKCBl2AInYCNAHxrazH0chhz8f77VLhtH3u59F5W0iKi7Y3e6jTbUA4ADLcUcN/b
         PVZ1dioZtNY25fnF49LvuZVSDi4lN0XbN4TbPXSfOo20sCMxZm5DLi0f+kpzfxo1Up5X
         3YdxSPJxC8NBGq0nOKa/BbZBuHyJZyOvp7N2Y2ISMkubV0WUXRav89jcRG1vb0cZvxBV
         9Me9irioXo0ZvmF145ABBf4VY0vOorhJp7Av7CO6cWV80tozUycqucrsOks7N3r/ZpDF
         5v0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758525120; x=1759129920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L51uGeNa8nacgso8hnxd+eYLYxlc+LmoJqaI+35rjr4=;
        b=ZbidZXI5lLtXnE4LasKa9UMTnT4qrLEd7BjjTQ7KEDwCZ/6jEgpY0I43EkJAhWrVxs
         G/6BzmRuiyZ5Y6OKmH6hITMk3sUle57hfj2SgnVGY0aEbvGFpIGUpL+10/+h6FilR5PA
         aK9pTZEMUcHVC9c+up40MdrlGUQlRi354VkWG3faqV9OoDXglH3NrhzXoVMbaFmyhW9S
         ABGzgKXCahsDAhZKFPlW2E9zKlPyIq6XGj+6zDvc+1eW79oWxFiVU6Ieu1Dm6XM30xk4
         fdZ/yXuxHi71GETGZmf05ppcprJxtf7RA1rdSAyyvH20Hi0XqYfcOypBSsbEgRxKTVpC
         dSxg==
X-Forwarded-Encrypted: i=1; AJvYcCWAYHkUvfcid97IWzOnx+i6bpaPbpH6LtyeKHldo8wcX+sGmMye/lFhY+6u/fEFZyW2QbeV/5qUFdtbN102M6ahpiplQw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz5WojX2UYYmZ+IVbzCFny7Yvrqb6La8svrpzzN1sFzz12qvZ4q
	DYX3VDSrfg2KpBMAM75d6jwkr3FZRnUhmOzEZCEyooM7obeQf74xJbSN
X-Gm-Gg: ASbGncttVc0am5V+Rxr9ZtzKDvuJb8CoGK5Jced6fZkooYakUZ1kb9ALHnf7ocP5wy3
	9AJGsrJ4AallyXJfChJZr5YIgIHBZUxeMVMI6tpwC1MnTzNWCihKuvT25HNjFnCjB5N76IdGC2e
	dxUN+i27VKxKNn9NYy1I4t3uQPazQ7UlAeeaOHZjC9XGcLbm+xf3nHWIwzVOpN0QB/p8T2vO18Q
	9ajY0jSOHBlqdTvI2sHrmZnCGTj3Ovp0VC/djd/BjSNg9vl33YI+anw0Xm5ULmJuqqEpjPSQl7S
	tbWh0npusJnnhMFSJxqFQ32pgvgoGXDO/raOa7vYQ1HWQKdlYBl6pL1P/VQvs5Xt1j2WEibhbZD
	g90167gnhgjmSpls3jCoqMvX2CwAqL/dcW7qZ
X-Google-Smtp-Source: AGHT+IGwWT3qJv0Y4pAO24DRMgTrXx/7yCgl6MFgRf/c+ull4dMi9MomeuBzlvjoE4YW64QkG7MHMA==
X-Received: by 2002:a05:6a20:e212:b0:254:b352:6479 with SMTP id adf61e73a8af0-2926e37bea9mr16802983637.32.1758525120401;
        Mon, 22 Sep 2025 00:12:00 -0700 (PDT)
Received: from localhost.localdomain ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b55149526cfsm9017341a12.36.2025.09.22.00.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 00:12:00 -0700 (PDT)
From: Rahul Kumar <rk0006818@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	rk0006818@gmail.com
Subject: [PATCH] mtd: jedec_probe: use struct_size() helper for cfiq allocation
Date: Mon, 22 Sep 2025 12:41:37 +0530
Message-ID: <20250922071137.900508-1-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/process/deprecated.rst recommends against performing
dynamic size calculations in the arguments of memory allocator
functions due to the risk of overflow. Such calculations can wrap
around and result in a smaller allocation than expected.

Replace the size calculation in cfiq allocation with struct_size()
helper to make the code clearer and handle overflows correctly.

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
 drivers/mtd/chips/jedec_probe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/jedec_probe.c b/drivers/mtd/chips/jedec_probe.c
index 23c32fe584b7..a5d1137ca5ab 100644
--- a/drivers/mtd/chips/jedec_probe.c
+++ b/drivers/mtd/chips/jedec_probe.c
@@ -1985,7 +1985,7 @@ static int cfi_jedec_setup(struct map_info *map, struct cfi_private *cfi, int in
 
 	num_erase_regions = jedec_table[index].nr_regions;
 
-	cfi->cfiq = kmalloc(sizeof(struct cfi_ident) + num_erase_regions * 4, GFP_KERNEL);
+	cfi->cfiq = kmalloc(struct_size(cfi->cfiq, EraseRegionInfo, num_erase_regions), GFP_KERNEL);
 	if (!cfi->cfiq) {
 		//xx printk(KERN_WARNING "%s: kmalloc failed for CFI ident structure\n", map->name);
 		return 0;
-- 
2.43.0

