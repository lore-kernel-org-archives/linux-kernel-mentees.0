Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB6C2E3360
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Apr 2025 00:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743468476; cv=none; b=db8OngqOA5+ChnczT/8zEnw7brGdtRo0kSaqmo1HAfTRVlb5u6UAPkT98JGjhx49dRvqJl1a8LBr9HQXo+yuVPR6FWLu7ffScEbUKL7TbvhSIF9GkaSIBdQB/dUnIwPzwQFcwnNVPMC7jCuiIf2pZqGpZZDJx7EA9M/yWUVLhSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743468476; c=relaxed/simple;
	bh=N+uagIN7EEAgHqcoRNAIUMi1f1toRZ7xxzYJ51D1KD4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=qdY1E8lw1Bpqiwddg34jTJBl4iBDTXe3xBW52/tiKwFxgAFJbZnkwKesfJmtITXLbSEB8pJRswiHMAQCk0sXbdFErha4MzvG2uDdaGvvaqUROhaC2OeMJluyDm4ZzxzC/Q8MOCqmKh2SyX52GEzXIHkhxiDI0e3aDccms0josMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUWuF3Cb; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUWuF3Cb"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E400A401B1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Apr 2025 00:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abvzS8X8ZvW8 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Apr 2025 00:47:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1AAC940116
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AAC940116
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eUWuF3Cb
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1AAC940116
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  1 Apr 2025 00:47:53 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2241053582dso75518285ad.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 31 Mar 2025 17:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743468473; x=1744073273; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ndbVkIth02lM2moYzGnZClHCA37EO7xQlyVsyVkRQU=;
        b=eUWuF3CbXjt/I72/LfvAnMT/uWP03r1L04/McysSi0+AJoQ51CAZd5lTr+dOQWmVkm
         +P11Q+yvpEbwFHkp7o/5wpUFYjFV4WMoeuZJ+ZiwvZQhnU3N+c51Meb+Rxz7dSI4hLjZ
         YxnzHCOPF2E8DCUaCmSyfqUk/o/ymhLVMfM5f/0Gy/C1gV7tckk939UDuIO/Pz6jeokf
         hrbRk7iP2o7POug+BHeBtpyHx53bBrWVLs5m01AxBjLVxB7TbPUrDJNzNP6tY21nVlPL
         rQooC/pO9eOKL5hRReo5RcpjijPT3xTvRVu665ITR+PJ2Hm65gs4RdmhFElCDVjpKwrx
         +ikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743468473; x=1744073273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ndbVkIth02lM2moYzGnZClHCA37EO7xQlyVsyVkRQU=;
        b=ikNFHke8uPvIB1J5aVToNHe0WyO9v0NZWthlP5TQOcr3IDhGaFzUKgkZQuZvsPJiV5
         rD2IgRTFQV21s9YOek+ytZPxyDPDu+AiqDCkgx4rk+n2PYNCnFsyVJ2ZPHNG+VAGdZQx
         l0o1TZo0mWa/mCMQYVQxBgHVfavOaF+KfME7X/A6vpCLCe1rYasylm6MyD2Z961zDn/+
         lskLyIzR3c6iRyhZyidx63PpMhuFoApyfa2aUc/MK1bMMvI08BFj6nz5EuDgWmV48LLb
         yp6nTJLjF5EopOdB0pPyzyiDCMJNCmnYGjJv6JpU2sL8NQSGIRJdN+xy2eow+9kfK/ax
         8l1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWYrN68jpPP9xFrKPM1CFvvVUApKwQ6Cy3ObXyaMVFIkDw1awiPPTp+cLkzMX/BYawdq4L21/BqzU1tXmqq4vCCqwa1g==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz7b56ujioqpHfCdEDnXnCnjnD9YRgBLSKC5lTDz1e/ruDMwEgc
	VfOH5T0d1OFXO/5jFuE/3d50aD0RFJACIkKZ4mtEZ9TeODtf6SJ7
X-Gm-Gg: ASbGncuDbk/ojfYvxNorgkgF87mfuTjh0G7UWeQfveTVMmvomETcEDfQbgDzFCQHYu2
	vcY1YmXfv0Hj3+q48HOCkNlgCmhAtOOMcJXXzSmmrYQAX4zg/9dfHl6pxVt3UBRV1oJyVzewadI
	7O/szPSVA9zS0YsjYI2Ef9bKowztKfSlmQ6Xz/ALZjB8LgsyvvajfvYsv8ivdRIDU9OIxsV6hdJ
	uPaOAaVRPydIfuOhxKrkO0oHcLJcL7hzNz/cbC6ct78aAZJ0Ic8y3IydXCLxeHJRUHFnVuGg2+I
	Fn34Qhx+0BoErVHTxZcOzHsilAYzPryz2ma6UWoRCw++
X-Google-Smtp-Source: AGHT+IHl0OKCl+ieQEesHXPE0XcY9RNckdx+U4FTJvC9MtJqicAkeQEEKpxjGLMAuFH/wqC/yejKzA==
X-Received: by 2002:a17:903:22d2:b0:223:5379:5e4e with SMTP id d9443c01a7336-2292f9423b7mr201070135ad.10.1743468473284;
        Mon, 31 Mar 2025 17:47:53 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1ce283sm76093395ad.126.2025.03.31.17.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 17:47:52 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: linux-nvme@lists.infradead.org,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] nvmet: replace strncpy with strscpy
Date: Mon, 31 Mar 2025 21:47:28 -0300
Message-ID: <20250401004748.29172-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strncpy() is deprecated due to its lack of NULL-termination
guarantees and unnecessary zero-padding of the destination buffer.
Use strscpy() instead.

Link: https://github.com/KSPP/linux/issues/90

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 drivers/nvme/target/discovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/discovery.c b/drivers/nvme/target/discovery.c
index df7207640506..c06f3e04296c 100644
--- a/drivers/nvme/target/discovery.c
+++ b/drivers/nvme/target/discovery.c
@@ -119,7 +119,7 @@ static void nvmet_format_discovery_entry(struct nvmf_disc_rsp_page_hdr *hdr,
 	memcpy(e->trsvcid, port->disc_addr.trsvcid, NVMF_TRSVCID_SIZE);
 	memcpy(e->traddr, traddr, NVMF_TRADDR_SIZE);
 	memcpy(e->tsas.common, port->disc_addr.tsas.common, NVMF_TSAS_SIZE);
-	strncpy(e->subnqn, subsys_nqn, NVMF_NQN_SIZE);
+	strscpy(e->subnqn, subsys_nqn, NVMF_NQN_SIZE);
 }
 
 /*
-- 
2.49.0

