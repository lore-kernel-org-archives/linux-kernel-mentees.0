Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43B3188A3A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Apr 2025 23:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743722682; cv=none; b=PY71+GIcSjeW3yAGQJnvT7avB1aQXhyRkBZXGPxSAe7YuzqyyVnZWsLXR8D+PirXBzJEVEU9qpc26r5skfXgnD+pLEfjag5QJJw+L79MKK+QaWuMzA9QNgRNYqDpKpJREmj/23MN6WKVIiWCy5nvhwJtpc3sLimTGAHQMcvA1AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743722682; c=relaxed/simple;
	bh=yNnj3R3VFGMoAxrzwrTaH5KsZnzVRrzxoEyTH2RyhyI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=dTOEVBRdXEiitg9QL1mmCjz+bTJC9iNEiKSxyhYlOy+jk+TBLurZFpPXGZnPN/U1y3pB0MUI3wmP6oQXJmr7TncbN7nTklDN36xxcFbkFYfDjBYTu5Okz71EkUXOXDZFlHFr0TzpJ5Z4WLWgO8l/65MStg4jLqRS790NcU9y2oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIT3VwDU; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIT3VwDU"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C07084056
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Apr 2025 23:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMbSiIyDoF-y for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Apr 2025 23:24:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9194084046
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9194084046
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DIT3VwDU
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9194084046
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu,  3 Apr 2025 23:24:38 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-227c7e57da2so13616415ad.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 03 Apr 2025 16:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743722678; x=1744327478; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Q1HJbhWKpyuQLE/tjeRz5EHmjAiJdcKFzsKrfzXyKE=;
        b=DIT3VwDUh3+oRKR1S0m/E63hOPyPUv6rRUQ3kenbl3ha/WJAnUrFfmedEAcHtw/EXD
         avctdx4oqNx3D8OWNgv4e2tLjgqmpoMre9kxwYdqxMGQry9jhzwCMHtTvp6tu+a5Khhf
         osduJ4YbDwX1zAW0Knxl7/rYpktPYHyXWHNsiUTgROnCiUhTGPsd0x5IcROWyHScDN2s
         aOziR54b/VHi/NFwFa4/pNKCPHsFu35pdRHZatWnsAeT6+lnbAlUiy8Rhq2t8X9Sinyj
         hsevQSP8mx1Rx8vfI8775Xi2Ox+MqxiLUg+tB44IXUF82DeYac7aGDrIw78H38uPh2dM
         FS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743722678; x=1744327478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Q1HJbhWKpyuQLE/tjeRz5EHmjAiJdcKFzsKrfzXyKE=;
        b=rmWUek3XECTdYYMtEKjkCudw7RpNWtCw0q3DCSKIl6zbRfptV1vGZ6pZfNmA4NPXjy
         FvJ6TRFPCl5Qz42ysLdtmmTO+sX0QAaGbp2J0x/XZNRP7UpdIMj464bIsidAgzza4lHE
         XIrXPPTZ+So7ns/X/ZGHtl0PjrvTkNyN1xAtd2lwPB9aQ78/W7a6rKmpy9iSN7FIhB0i
         qKfvo6vxFd3Q2JpTo4wvc1VLzpW4fAKHxU9zY+RZsk+2fIoIMTt/7R4wrfVTNro4bpWs
         Wu+/0E8jc/Vs8CI4d0Joy8+5O6Wthp7dP+q1u4R/9rAhkkEIVnT/fPPiYLX/IVG4zB5z
         AtvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB5IANBcTi7M26XNUruco3TYLMxcBpVo5wQc2hzFhIMApLXvqDSZ39NRqcfdQfrSv9LZ3ONlKZmoDn/Qqne6/gBJ8itQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwxHHc1egHTqwIwiPmmwoXb14S2He4UijEjmwspBSxLb7vsixIb
	tLyFYABaYY1/52bjqOlwFelW5JshSIIdv6ogbtNquk6cpeA3as4X
X-Gm-Gg: ASbGnctUBaCfAfbLTBuQzaCa+biuldKJd56T8pIRhLRgfHT6mS3ZnKprNC79GZpQkdq
	RDzVyLhSP4J6c5gFmXaCdWqlXQaiOPiomIb7keetbnQ0H6P3PqB1d1qgxmjZWjSFyRueJ0XbwUI
	wCZO+RQe09BM3dnaWJmD+RFTrf/YunnkKhMpsnjqi6I7XcmFVPw4C1fFvshLpSu/6szlubWo3/j
	r3qsoSeo2TCVIeFippL4pv5aD0YXKBiB0FI0YPwvAhglH+lnDL7k1qyrQ3yEcenw7BehZ7ICsU9
	Je7k7FZFuF1KZ6kke+ijoAT8QF3EJc6opi1wx/Q4aOzZ
X-Google-Smtp-Source: AGHT+IE9AV4Ouxje8y8MO1JFpgcDJYYxSVrmCuAmlacRE3v5vT/XRLmaf4o6IKCXeWbbNGcPd+jszA==
X-Received: by 2002:a17:902:c40e:b0:21f:4b01:b978 with SMTP id d9443c01a7336-22a8a0a3630mr15347415ad.36.1743722677760;
        Thu, 03 Apr 2025 16:24:37 -0700 (PDT)
Received: from fedora.. ([2804:14c:64:af90::1001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297877273bsm20108635ad.220.2025.04.03.16.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 16:24:37 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: linux-nvme@lists.infradead.org,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v2] nvmet: replace strncpy with strscpy
Date: Thu,  3 Apr 2025 20:23:56 -0300
Message-ID: <20250403232432.25255-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The strncpy() function is deprecated for NUL-terminated strings as explained in
the "strncpy() on NUL-terminated strings" section of
Documentation/process/deprecated.rst. The key issues are:
- strncpy() fails to guarantee NULL-termination when source > destination.
- It unnecessarily zero-pads short strings, causing performance overhead.

strscpy() is the proper replacement because:
- Guarantees NULL-termination.
- Avoids redundant zero-padding.
- Aligns with current kernel string-copying best practice.

memcpy() was rejected because:
- NQN buffers (subsysnqn/hostnqn) are treated as NULL-terminated strings:
  - strcmp() usage in nvmet_host_allowed() (discovery.c)
  - strscpy() to copy subsysnqn in nvmet_execute_disc_identify()

seq_buf wasn't used because:
- This is a simple fixed-size buffer copy.
- No need for progressive string construction features.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
Changes in v2:

- Added references to where to find deprecated strncpy.
- Commit message with detailed rationale for choosing strscpy.
- Added explicit rejection reasons for memcpy and seq_buf alternatives.
- No code changes from v1.
- Link to v1: https://lore.kernel.org/linux-nvme/20250403042737.GE22360@lst.de/T/#t
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

