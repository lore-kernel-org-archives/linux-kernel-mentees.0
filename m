Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3941725BEE5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 04:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759985676; cv=none; b=JAGIScmP5a57KLcjtwsNuvSvc/eDghiQgPs/At9sKrVbdsDTvTXrcn3mxAankuacZ0gEHTG7rBmf/l8eDMZlkJCIBVBAC5575c+geXF+Xt4bqqWA1pnD3yt0L/vsJago2XUKzCM0Uao/oyZP7CY2zsIv6jRfMCLiW17Az64D3qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759985676; c=relaxed/simple;
	bh=w+Kuafgc44tEvaLcNgVbY1Detnyn1TP+rsKy11PWdGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k+TK6S3Y7CZLOLK6T1rpA1s+hfb1NPasiPUVbxzyvmPTREFg3y/MlGEjSK1bsLHfnP534gyp3arsZkCIQtXP3Q36m7ZmDYDu8fT93uB/VPYID+FBNhXgSWtXAtvaTKl03pmz/xJpmCwLJ9VsRvuq0Vd36dCvje0ipxx6Bj4uAts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kd6Fo4A1; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kd6Fo4A1"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C03C740F34
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 04:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c213p0JkSebW for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  9 Oct 2025 04:54:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com; envelope-from=ankitkhushwaha.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F03A40BEA
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F03A40BEA
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kd6Fo4A1
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1F03A40BEA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  9 Oct 2025 04:54:33 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso420966a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 08 Oct 2025 21:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759985673; x=1760590473; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Tfw9ZfkVYbFeFtQQO2RdnGi20hC7pdXgzL0TwKkXK4=;
        b=kd6Fo4A1SaCUcjyauIdLNA/4XUs+TBlq2Vk74Dbd1vrn9MxJIv5wIdyt4d8NdsZDl5
         rEGzzJZl6W2cKjc58PxsX980571S2YTSnQa0BOKtgpC/Z2TikqDR0FUaxMgSZLHj62eJ
         PQWrZlSplDX/I41O4GX5gx+25+Q/jYoQ6Eh0UvwOsnC/UzJ+GcEaEJbp/u+yelk2WD62
         7V83qe5v+zEruqIk0S/TNNFe00OK3sN6DHnm73nFC0ztJITNHVdMj2au8i72Rm2mPYFx
         X4fMYYTCzOkuvQFHVC/EBm/iX5Bgt38Foi89M07S7EuPr9xH+1TxmlFJRZN8VSucnsvQ
         6/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759985673; x=1760590473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Tfw9ZfkVYbFeFtQQO2RdnGi20hC7pdXgzL0TwKkXK4=;
        b=TKIio+CswqBJWY/5sHJ6whQ/zd0QYRbVhJ/iocx4hofviJwfNi9mRdErbOYoI2B9LQ
         hhel4Wki+9nz6NYQSDLYqPm6E95m+iQF5bBFOAUT9RR4Eiyc0jXj+EGjBZ+3SpYYnz8T
         pOMjbvZbtyDr7fJqTpqIkNysm+W1rfXm1tQeXnrrhhBZWHUJSEw/0/ossqJinQbe9ZFL
         pASWGlmNreVqL0eco3HyPlN4frK0dxf9Lx5VAu+D2Ctfnb1bvp4PYuAVfOQPYoEdm7cl
         ZVALf3UKXUund+KFLOm2qofyxgxBLYJmE2SA1/i6ydBDu4ANNOujxs/imj2J6dr0icPV
         y97g==
X-Forwarded-Encrypted: i=1; AJvYcCVml7Wz7pABg630pYWmw0ngiJSBji+GzJ0iTBT95IMgdtnyfSaM/s2e+0HaNwvlOt2lGOuXwRVmjWBZHvfgVV5/bC3sRw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzazVQKXFPdWXkkrcMRaEuSQ8PJmru8SMDx22QpTHvo3dGJvFSy
	dkM0bL8L7PBlczIwF7vrtZAgfFdmu+PEICXef2QimeN0mzHuOQRkURaV
X-Gm-Gg: ASbGncuh1Z3n/3FkiAMvmA5iCvihwq6uyFC8jIQBS4yKPxiY3zSdTwkPt3Jep+oCuPu
	zmNSrdppo5JcfxLfM6QcQPQ/ijJxclp6kiGQ0YhWk8Uen8hSUWlb9s1A4EoR1yHVZpKfAd/2P5c
	bvpJXhmhtamkBnxQVCDGonSyj8Vdc+jvuhUj1fuNez2T5EWLMk1541w0+aD02xqOMSRdHq0T71E
	8Ut6Jf1+JYtOCusA8ifskFEp8lJfHjo/szztQ76po25eWxDhZa/qvuHUKaRDzvsc7DTvXMLJhpy
	ebhtEGulUPz3pXA3x2uKvURlZC6C7jVgxv6kJ5z6MVxH2CB46sjfO81DqDnhQgPy4SgC6XaZsJz
	aBn3v/wKlUl/u0pkS226W2XAD4dP5CemSKvELlUtdQAcEoMT87Xrcw4qGEs7zi5ghhg==
X-Google-Smtp-Source: AGHT+IHs5oQxzgPYgvjhGgUXIMHAfemFYJF0eBPmSz+QPLzUbxC4cmQvyXqohxlvHOS0JXDY4GoQVg==
X-Received: by 2002:a17:903:2d0:b0:265:604c:17e7 with SMTP id d9443c01a7336-2902741f0b1mr68383795ad.60.1759985673202;
        Wed, 08 Oct 2025 21:54:33 -0700 (PDT)
Received: from fedora ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36cb1sm14161475ad.100.2025.10.08.21.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 21:54:32 -0700 (PDT)
From: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: david.hunter.linux@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>,
	syzbot+ddc001b92c083dbf2b97@syzkaller.appspotmail.com
Subject: [PATCH v3] ring buffer: Propagate __rb_map_vma return value to caller
Date: Thu,  9 Oct 2025 10:23:45 +0530
Message-ID: <20251009045345.8954-1-ankitkhushwaha.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value from __rb_map_vma(), which rejects writable or
executable mappings (VM_WRITE, VM_EXEC, or !VM_MAYSHARE), was being
ignored.  As a result the caller of `__rb_map_vma` always returned 0 even when the
mapping had actually failed, allowing it to proceed with an invalid VMA.

Reported-by: syzbot+ddc001b92c083dbf2b97@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?id=194151be8eaebd826005329b2e123aecae714bdb
Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
---

Changes in v3: https://lore.kernel.org/linux-trace-kernel/20251008172516.20697-1-ankitkhushwaha.linux@gmail.com/
* Same as v2:)

Changes in v2: https://lore.kernel.org/linux-trace-kernel/20251007171256.20884-1-ankitkhushwaha.linux@gmail.com/
* applied minor cleanup suggested by Steve in v1

---
 kernel/trace/ring_buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 43460949ad3f..1244d2c5c384 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -7273,7 +7273,7 @@ int ring_buffer_map(struct trace_buffer *buffer, int cpu,
 		atomic_dec(&cpu_buffer->resize_disabled);
 	}
 
-	return 0;
+	return err;
 }
 
 int ring_buffer_unmap(struct trace_buffer *buffer, int cpu)
-- 
2.51.0

