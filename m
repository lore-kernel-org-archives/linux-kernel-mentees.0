Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264EF42A80
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Jan 2026 19:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769370660; cv=none; b=Xrz40dZc35QIHl387S/eFf62SzZkoKzjEoXlkPtgzQujYZGT1AO6eo0bK7Bql7J24rh/f+5CR1dvzkXKXTLAIIskBcOThM2wA7rwTedQsoX6m5OMGEruCjGXUmlCIaCCJPXpXNLLHApLaanoQMYadDIS7OSOmqetwvSFU0fZ/3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769370660; c=relaxed/simple;
	bh=1eQZ1BvIUAEXInQ4ISknBwPDqAZYOWfR6F++B9GxeP4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z1ASHgf0ck42jtPxMh4+PCLjt+5dGDd/nbwgLZTN6N5/ueruILSy/nJTvySJ/gMVTYNofHd8YLt7MdRkVZXC7NGWb2kO/bSm1oxppMtDq+iiN0a837GGQcxpTqfuuXx4NIn9rL6i7QBoNRZbzppaZHvzu8k7k/AWYVvkNuK8Bq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+jJd7eA; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+jJd7eA"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6D4F81132
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Jan 2026 19:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CpHLPLTHwmS2 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Jan 2026 19:50:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1232; helo=mail-dl1-x1232.google.com; envelope-from=rodrigo.gobbi.7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08D7A811E9
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08D7A811E9
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D+jJd7eA
Received: from mail-dl1-x1232.google.com (mail-dl1-x1232.google.com [IPv6:2607:f8b0:4864:20::1232])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 08D7A811E9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Jan 2026 19:50:57 +0000 (UTC)
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1248d27f2b9so923043c88.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 25 Jan 2026 11:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769370657; x=1769975457; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G4Ej3LXmpW7nr4k8wJqt8GHACMgcTRVuWYJx7Htg8E8=;
        b=D+jJd7eA54Mi2icuT9nutuyX3IrlpxwAzZQmepoY/B9RVZTPT2fDDiYESHRbR4TazG
         wShP//a8rSsy38kgsAeTSZi6g0lc5d9e/xEJ1RAzA30kMsabUjYw9JZO4egzy+p4oOE4
         NsqZrCqN3Q+Gdaa9fbI7dHHF0b503kMySbdPu/SHFhwQIXLoNw7VrwxgceV2DVQQTsnG
         LT5up8ChE2/LQvK2vIimpIGQhrlLmhSsIw0dNORRmX4ZpT561cmxJpqKJW3fVqe8Yxvv
         8tHhAX5HVRiTfjy+VOPW0pbU2n/3LdUuF4wTu43vgGS/pOL8iH4/xvd3XEaIBxI7pK/d
         v9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769370657; x=1769975457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4Ej3LXmpW7nr4k8wJqt8GHACMgcTRVuWYJx7Htg8E8=;
        b=WUon28NZVAcWGITU/3qnPWAHG50rfuExuYw+AGfbNyhiZtnTSSIs/EB3taeIfSj0V3
         kgiqXQU6Sgxevcq7N7xeFkOkeklXVrKRI6xuuaPLSOImQx3swnia4/MG3kQoFv8TU+3H
         vHPIlwUbAJRAEPH6e2E2dzGPESPwTuNzIB2WCbZlsP4dMK8GWnc2ni001q6p3dku9LFj
         ZPZBRkweJI6u6RVGRH+Djz4IpZzebqdZ0aL6C1fKGnonIe90Ryg4Oltb916zmTCh+oFo
         G4jcy7TslhxexDUrupgY39h4JOaB1i3SAQpMU4ZT5F24gcyCh1dRiY3KNhWRirsq7NzM
         DKZA==
X-Forwarded-Encrypted: i=1; AJvYcCVGdww681mwaHm8rOJy2sqSig8kImZKlguHmo3rw1nTUB64A8CtlQhA40dI2qs19Fmr9RrSPKGYBUNt5+WrGQQ2Lb/Nzw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxvXSMx8PZC6rVeFSnaAPrLtdU1s2Ya4xzbpxQpihmyZT4Onkj2
	mc3r+N1ajKlcECO+6IW3BvhLckWEHrsTiPhPm6PdnJIgM48EFGuiTLQKg93l+w==
X-Gm-Gg: AZuq6aKVe9cBLSIzfcZTlItJiR+lWE3Rpoa7+/A39BILwE80DXtinpJ+nag9bu2J8pJ
	rv6sqyg7tE+4EaAJN+Rbzou8CJdGo2mzl1OcFg3qreAso+Cj7mGBDb5UKXyskOb+4Y3VeU2oGxN
	rjvOJbKfY8Hg4ooED17IvipxuaYZBf/vds/MWgiLe4gdi93p8L6GkfyRSuMCMjsiSUruHJKhgoL
	UN8e2+vHjmCKJlYm+Gui4ZGK6oSXdX+yrs9/9/tsmoqR/BakZ6MsG89UmUcDayjKZCBN9LRnjM5
	K6/OB4kSH9KDz8wY6X3UfAuKTrDg7aourgHg5tPo4X48xtJVprqk9zfKkYs7JVeoRCRGAwL4292
	BFBqkiy24WkOhdo6QpUOHA8mq+oQgrb1xBfgvHR0CG6jOyZHDVXHPUs0Pz2bly8FnOaF44rU2Zi
	GKmtPMwMZI2/wuz0DkMZuaLSCX41o2pKWHKgxDSgWa2HoZKzdPar/BaL2UZaLMfDhfEf2I1lVwv
	H6b
X-Received: by 2002:a05:7300:72cf:b0:2b7:3678:2d29 with SMTP id 5a478bee46e88-2b76451a9b0mr1016315eec.29.1769370656507;
        Sun, 25 Jan 2026 11:50:56 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4c64:82a2:7b0e:b65f:500e:5949])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7410615c0sm9446912eec.0.2026.01.25.11.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 11:50:56 -0800 (PST)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: skhan@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] Makefile: add a custom EXTRAVERSION string for LKMP
Date: Sun, 25 Jan 2026 16:39:09 -0300
Message-ID: <20260125195049.25230-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a custom EXTRAVERSION suffix to allow easier identification during
local testing.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Hi, all,

Tested this patch at QEMU/arm64 as part of LKMP tasks:

Booting Linux on physical CPU 0x0000000000 [0x410fd034]
Linux version 6.19.0-rc6-to-skhan+ (gobbi@yoga) (aarch64-linux-gnu-gcc (Ubuntu 14.2.0-19ubuntu2) 14.2.0, GNU ld (GNU Binutils for Ubuntu) 2.44) #79 SMP PREEMPT_DYNAMIC Sun Jan 25 16:20:12 -03 2026
...
# uname -a
Linux buildroot 6.19.0-rc6-to-skhan+ #79 SMP PREEMPT_DYNAMIC Sun Jan 25 16:20:12 -03 2026 aarch64 GNU/Linux
...
# dmesg | head
Booting Linux on physical CPU 0x0000000000 [0x410fd034]
Linux version 6.19.0-rc6-to-skhan+ (gobbi@yoga) (aarch64-linux-gnu-gcc (Ubuntu 14.2.0-19ubuntu2) 14.2.0, GNU ld (GNU Binutils for Ubuntu) 2.44) #79 SMP PREEMPT_DYNAMIC Sun Jan 25 16:20:12 -03 2026
KASLR enabled
random: crng init done
Machine model: linux,dummy-virt
earlycon: pl11 at MMIO 0x0000000009000000 (options '')
printk: legacy bootconsole [pl11] enabled
OF: reserved mem: Reserved memory: No reserved-memory node in the DT
Zone ranges:
  DMA      [mem 0x0000000040000000-0x0000000047ffffff]

Tks and regards.
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1465f715786d..3604b5a07cdd 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 6
 PATCHLEVEL = 19
 SUBLEVEL = 0
-EXTRAVERSION = -rc6
+EXTRAVERSION = -rc6-to-skhan
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.48.1

