Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C4B28399
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Apr 2025 06:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745994264; cv=none; b=Pz6THzpccdv4VMFQL8vMB+yt8+p4eABuBtryumWWS/B6GHS5ISj4npgtVHuPKhaa+spF1UoNsUvwNnIgibwgQdUIVGSQlphPnAudE/luZ478vkx1xb8d17JTI3ovegnubh5GROymDYHyCnbbnYyiitiZdoUUdtFCfP+O/FmwCPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745994264; c=relaxed/simple;
	bh=BUlIa8BzzS2z9z6WDQCdewmzjAzUJyL047+xiQ/8HL0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jJWnAcXv5Mn5GEgLi+LncBsaaEeTpk/14T9yOjA2DYsGL+FEFIYrJYZrQeSzZ/CPeRqP7DrE8nmL+i03y+Z4BKiWBGPKLKW2XqNKP4zPU1HneJmWepRPeIxHShN/HSrjnX2p9oqz0AVpzYRKkVxXOoKb4cn12K/dhTGaipj/6r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5vNNTV8; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A5vNNTV8"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AB0B40829
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Apr 2025 06:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXI-fkzSr8R7 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Apr 2025 06:24:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=ankitchauhan2065@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 027F040528
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 027F040528
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=A5vNNTV8
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 027F040528
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 30 Apr 2025 06:24:21 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-224100e9a5cso84054495ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 29 Apr 2025 23:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745994261; x=1746599061; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t2BkgT+ns1+Mv1Haw5znYsaR1kZcYX+VRlw/c++zNcs=;
        b=A5vNNTV8ZYKe7KdT++gVMMpEzDPCzlLlot15z+y0wpGAk8gBK6E4p9n1TC9gVbZ5uP
         N0dVCBgdcS7rbTLiFr3B/3EZlPoQW7ZlqoWLTuID0AlpVCWg52YOyZU/BBk8QnhL157m
         9nekZT5tDDgXvDJjimlDho4RFSluWjqsx3ZR2U/Bcgo8YdDl+2qjc7L+TxG3SmixXI/9
         8+IPv6FmrcW4xin3McZxXmV4AA8vGJstvaFFkDhCCf0wRTDg9n7lA3WU+Ej/0B05WA0e
         sVqfM9Bbl2J23TNPNVStYYSSYx0H7xlyKQYZldEuVD3TGSnIRPCYbTfuUnFGt659zVsf
         RqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745994261; x=1746599061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2BkgT+ns1+Mv1Haw5znYsaR1kZcYX+VRlw/c++zNcs=;
        b=OyduOMZyHuzr1hyKQdBSJsmN+nbt5B/8mgnXQAfKr0kaoZJrgxUygAsf8J5mP8hIH4
         DEa++aPLlqobAL/u4eph1Kw5pyfc201XhjEcJNQRw49SRF7W58rMeOr2SfFh9LXjkk58
         qAfFNtkBNnvvR5WeUqAwykppyTXxeZ2JefJWIdzTHpH3C33gbARqTQcOXoQ43cW6rEik
         Kj+ImHsx/wCvTGHER9FqL/p8An23R+qGOWvc5CHVHW+R+ykEuDmuy9J4wf1zyfH6qi+O
         Gs2TXZp9LqWB5egeGOMgAOEohtvTQyd+H3PKbN/lROGY5lg+BgKlF3Fg2rLMrG4gcVuK
         M/0w==
X-Forwarded-Encrypted: i=1; AJvYcCXFtn8CoezEl9YkLk2/w/3TnajMPeishvGHf+KMQWAWZi4NhG0mrs2p9XiPrYnbsdI3EYt7kCIjlUr0CkFH/fgB2ZWyPA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwWNvwZec8vi8eF/PUNZoyI2nyO6OelQuKbMjGwpLyf56JZ+S85
	A2kJUAkr8Dh7zlhJ3DjBA9yS3W0FKy51nH6ADtBXbZ5eCNYhyFkA
X-Gm-Gg: ASbGnctiEd26zdyGjSQC4h3H/hohdJYAHoEJO4kocnUMvBJAznCoFB1XDcgKKsWfPIO
	9c1x8LlLfYhwBu6F1eLM/pzMJby+RDaHeRnOYcEHtwOgPi7eNKKIl2wQsTxDQWK6LAsFnpMuys3
	dLlPPV+N8myewN6olrHvR08Ye3vq42tbDS+LcVG+j/qIvJQFGscs0fugUeMRbv/8QyZGIXW3SgK
	krdPkbgKHf2IOe46PJNlD8eEyOLCWyd5oXjyrLMDuyXn6MYRJx+s05GtvPFmeHfCW9K9rmIu6Dy
	5/hjR6U/yw7KYohT03bXqq/xNmm+djzGYa0Lb88cW5Fx/WMx3tyl93UVMeo=
X-Google-Smtp-Source: AGHT+IHSjHX+RHqL1/RPrri4TfXKibji4sFCTL39MYugqcNiiBkHWbhLt7vmWGwVOUIhPwt0riovvw==
X-Received: by 2002:a17:902:d491:b0:223:3b76:4e22 with SMTP id d9443c01a7336-22df34a5d21mr26938355ad.6.1745994261145;
        Tue, 29 Apr 2025 23:24:21 -0700 (PDT)
Received: from localhost.localdomain ([103.77.0.13])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22db52163d6sm114169185ad.214.2025.04.29.23.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:24:20 -0700 (PDT)
From: Ankit Chauhan <ankitchauhan2065@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Ankit Chauhan <ankitchauhan2065@gmail.com>
Subject: [PATCH] docs: fix spelling mistakes in HID documentation
Date: Wed, 30 Apr 2025 11:54:12 +0530
Message-Id: <20250430062412.54133-1-ankitchauhan2065@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit fixes spelling mistakes in the HID documentation:

- 'triggerred' is corrected to 'triggered' in multiple places.

Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>
---
 Documentation/hid/intel-thc-hid.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/hid/intel-thc-hid.rst b/Documentation/hid/intel-thc-hid.rst
index 6c417205ac6a..5e0dc51c8d20 100644
--- a/Documentation/hid/intel-thc-hid.rst
+++ b/Documentation/hid/intel-thc-hid.rst
@@ -182,7 +182,7 @@ value and use PIO write (by setting SubIP write opcode) to do a write operation.
 
 THC also includes two GPIO pins, one for interrupt and the other for device reset control.
 
-Interrupt line can be configured to either level triggerred or edge triggerred by setting MMIO
+Interrupt line can be configured to either level triggered or edge triggered by setting MMIO
 Control register.
 
 Reset line is controlled by BIOS (or EFI) through ACPI _RST method, driver needs to call this
@@ -302,9 +302,9 @@ waiting for interrupt ready then read out the data from system memory.
 3.3.2 Software DMA channel
 ~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-THC supports a software triggerred RxDMA mode to read the touch data from touch IC. This SW RxDMA
+THC supports a software triggered RxDMA mode to read the touch data from touch IC. This SW RxDMA
 is the 3rd THC RxDMA engine with the similar functionalities as the existing two RxDMAs, the only
-difference is this SW RxDMA is triggerred by software, and RxDMA2 is triggerred by external Touch IC
+difference is this SW RxDMA is triggered by software, and RxDMA2 is triggered by external Touch IC
 interrupt. It gives a flexiblity to software driver to use RxDMA read Touch IC data in any time.
 
 Before software starts a SW RxDMA, it shall stop the 1st and 2nd RxDMA, clear PRD read/write pointer
-- 
2.34.1

