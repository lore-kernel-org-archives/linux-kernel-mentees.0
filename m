Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8266C28DF33
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Oct 2025 17:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759944333; cv=none; b=pYJb0XZ5Nh7SKU7WuFlJb0+1kqb4d/z/CU8np9+GQZ9+w2/Kp0yvdSCP8crSIqPTeZL0WKB4n+xygyaVICcFWYZ8yIA0tqJWXqfxcX31dnga4B7muGpdov+v162ZjyowfGFVxVZrI73ioAJqgC7Hv/wDoREkvY3vHqh9q7inRSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759944333; c=relaxed/simple;
	bh=OBWc87pQeSBPnNP9Y6+pBUc5uvdElUQm6oastV3iVD0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XSZUXheiZoSybCnbGQ25RV9bv3iEw9l3W/Mzt1WG8EmGnR5hEeLAfNQjYlGoCBjQvUYN0ZaUdwtmHVTnWZTcVEYAbHlHGuxyfod3pIutxYsYAd47gig0PpuD0BPiKeVwQQ1JDQ1FA6icmygxCAnzTO6LSc0QPn+Y8Ut9XuQoCHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDnTXlXl; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDnTXlXl"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 10C0240B1A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Oct 2025 17:25:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1j4VZGm2C3GE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  8 Oct 2025 17:25:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com; envelope-from=ankitkhushwaha.linux@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37CC440AF6
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37CC440AF6
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FDnTXlXl
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 37CC440AF6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  8 Oct 2025 17:25:31 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-27edcbbe7bfso928615ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 08 Oct 2025 10:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759944330; x=1760549130; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=41XZ0Nc+5i1FOapXe9kYQ/jcLvjFNXLmKvQlP4jYRDA=;
        b=FDnTXlXlpmQXCs6kuE6GNXYBAvl3Xx5hsTBgHQ6f0G7CgWAD0BV38qQ/WU0NumMB2R
         q4v7jXAVEavE6kftbRH9RdcqlLXYuaEdVtZksNGn3OFbFUBtlV4SsY28WYWePNtFEgWW
         xJ5cYlqd9eLKubJRlplrsCRjXpY9+98m3VTaqF9Bg43T+PgObm9u18k7FG4F4RABCfjd
         MX23WXpikrJV8DFvB6aGQ5/89bMXvq2sMo019CM8upQpernguP1jGYILXLEkxkkZl3m4
         ejK2TS+6thoe7uIy+wi5Rc5J/x0XLaElkikPAdi9Div2OwMVXbel0gkQGho70vz25ZCv
         XO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759944330; x=1760549130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41XZ0Nc+5i1FOapXe9kYQ/jcLvjFNXLmKvQlP4jYRDA=;
        b=s2BCPCXJly77iWM8jkqtA3jYelLCLcPmxlBw/eIoI4QLgjphDH4Jfr34SXGbAm90t5
         12depWvDNIcvVZtP3bLTcrmiyxiUIJH5bze8lBz6k281PP9IofXVtegS/U7C5EXq4+22
         eYEfAePqmhnO/FZhR4fhsIRw+p9Jy3fMhPkSWyWQWm+kHpv4pHvTunyWsDiiSl5MogtV
         ni3GK1EJPoPG3/G4dlh+nSAWXdyefArqv2A88y8P3BldHq752GUTr9ys//5/7XGHQG22
         ys18ROPQdQY61Lw8hMW237V00f+lpeiUpusM9aRCDjnTdvZ2nkmGbXY+w+U3rUv3X47Z
         2MtQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8nplV+cK7rEneG/8fbs+34aTDJZWPOX6UIOUb4X8tDdf+HtNxyCfxuvWeNIhBCw8np++QpX9ZWJ92WbvXCJIdzsW0dQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyQCMmHtSBw2tl30zJ3yiPKx/qMdHi617NCVgV3tBhxGpj8qHzI
	uE9XW6BOw4lLuzbOVCRkoTCYbFLaRPByDsMZcKZGFxSgqmpMSybiewLx
X-Gm-Gg: ASbGnctYhEc3duUqx1SJxyI+DkKYLMCRfNdzif6XhdbS3E839rZI373iZ9ijltPUN4K
	Ap9tJrW6rU9/hGsHn/5IGiiM36JcFqJP6pXVWexLWh+kDb3aUQHjkxOPkcNGX+yPkokq/RcApwg
	9JFC9vgYt3wkf4NWEZljH8FlJVDwZ0GJ9G2eW7CgasZx7sKeCMY+XwavJ2lAfhfJQoTCZDphGPa
	T8Qgt9nFnRToXKoCj2pepDVRfZOkp3uf4EsuzlWh2KmkbF32IiXglPmsmbVz7ynKvK2qsl5oh3G
	YuQ9JCT/XJSJvJ/9b7+k0rmaLW7/MTwbcA5isRy+DfR28lKQ8k0Ugw0HF5BL9SsjSREw8AOxX9j
	3X/hhKBjpe9lDj1tvqeo8vwFftp5l7JiEXsZYet4ijUd162C7mYQYyc17z6QUTT6Nbw==
X-Google-Smtp-Source: AGHT+IElTiSwjjSnRQ2YldSSmOA7Pun5HHGSGRiphAnOm/twua0zyVb25UTGjox4glkPR20eg3ChWw==
X-Received: by 2002:a17:903:3c30:b0:270:ea84:324a with SMTP id d9443c01a7336-290272c1898mr58357555ad.38.1759944330387;
        Wed, 08 Oct 2025 10:25:30 -0700 (PDT)
Received: from fedora ([103.120.31.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e2062fsm3039115ad.48.2025.10.08.10.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 10:25:30 -0700 (PDT)
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
Subject: [PATCH v2] ring buffer: Propagate __rb_map_vma return value to caller
Date: Wed,  8 Oct 2025 22:55:16 +0530
Message-ID: <20251008172516.20697-1-ankitkhushwaha.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value from `__rb_map_vma()`, which rejects writable or
executable mappings (VM_WRITE, VM_EXEC, or !VM_MAYSHARE), was being
ignored. As a result the caller of `__rb_map_vma` always returned 0 
even when the mapping had actually failed, allowing it to proceed
with an invalid VMA.

Reported-by: syzbot+ddc001b92c083dbf2b97@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?id=194151be8eaebd826005329b2e123aecae714bdb
Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>

Changes in v2:
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

