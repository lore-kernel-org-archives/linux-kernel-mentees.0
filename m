Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FF22BEC2B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 06:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763016589; cv=none; b=s4nW59hQ+v0jlvGZBKwv0dxakNk7bhozuoZsE9fHMPVpxVVG8jp6d1ipj6gzprgC0aVhwOjqxVEkRzf0c3fwCM3FAnZAy25wO+PHsEbg4oNlxf0Y2pOItKS0hAQYqDlDeRfp01Ucn8xaSUvdzDRGMKyPm0k7EkMbzWxSdycC/4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763016589; c=relaxed/simple;
	bh=29nAki8ESaO1fL9aGhOKACF0bJg24F8USzUzT2R+14k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L50ORnqMQ3gxW/RhHprS/Gg9MRPK565xfsKu47xxbw2vXHcT6gQeKNdDmmC7UliHWIHt061tn1/DAQnAUizXlXX20aNfxd42o2mrsgml1FrA3Mmuinx3AqntoEjYY+mBgHmOjaCivWb1AerhGPhGM9aX9Ko5hIjGU8MxDqstWTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJpi0PZ7; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJpi0PZ7"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0103740850
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 06:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYhaXhGEfOCc for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Nov 2025 06:49:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3D111407E4
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D111407E4
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BJpi0PZ7
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 3D111407E4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 13 Nov 2025 06:49:47 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-343d49b7227so582718a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 12 Nov 2025 22:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763016586; x=1763621386; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T84pQ1+9aq8AWuzbsa/zDb8vuVA7/GAGMhFUb/seRIk=;
        b=BJpi0PZ7hB+ZzYxDphY9QRg9qVddtCUI/V+9E8/RWx3MwyB8aAysbjbYpPP45HL3rr
         XftoIe/nBltnG9DNTkSDpu57QCvYqjKc2mfiJ4wq/5uod2u4Tyc0nufV7iGMGHlTVMpC
         tVEWAoVa7Dmx4I48TrBEU7kNJpkLrPryl46w1CkaoGS5OHsLkxWOy4zNt2rMsJiyUgDR
         Ln8eeVB8MQsV92rVcqRHsTzfnBTH0O2vYIZ0qt8cnthOhUzm1nrBtDmzCAdbk/SjJk0K
         nscI/8z5ZupxY/FDcubkJe0yD5XHNr6NHOdY8Ei7T9iNJR38vb7xUCgvigXSCnE9bgg2
         dzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763016586; x=1763621386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T84pQ1+9aq8AWuzbsa/zDb8vuVA7/GAGMhFUb/seRIk=;
        b=JH5blXPP0X3UwCGNfPHeZ41BPWrSuv4cN2qbLyR2X28jE85gGuMhB508LtDdqiQa4S
         8qL5WNJFGdxNw+BQNsEdmPJtHCaszLc7x34knhyWOgI7h7FNrP/zgei8pGWoBdYZb17z
         gbtez7Yum43eo1ZJfSTj15/23OAaLucFe1vKHI9VUSQi8WrIOOqcXpk5tI/ld6xG6jzZ
         6eTqhXfm1RhWI3t1P9e9ed4SVbbJZ/amtaPGHCEiEPJ8U86UScOvdSAQlnFc+OFxKDzm
         ldDCxZam79auXkHUgpNsnRUI4dNjEyaRsQ6P1PJFjGEYgUvQO4cRCTc1R3ZA85QBnyST
         YFtw==
X-Forwarded-Encrypted: i=1; AJvYcCW7556gU8kacujJJCx6fY149lqrpyx/6IP6gVAD5xxrzAwLhj3er7TGYFGcvr75ZuAuxNh3QuoT4lT+wugUUfFxjj17Rw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywo7QIsBsR1LzZiFws6x9YhFfYxEZd97HPOmYafhGMjFFDCZCKf
	A3e6pttp/eNQg0ru1jy+h4TZlC0lFR8VlqRb5NsFrfg0BavqNwSt85eF
X-Gm-Gg: ASbGnctX9+s0CFg8vRzlnkbK0XZNsIqDaG3pP/hmUV/ouB3NcZSV+ZeCYvyRAYEx9wn
	4rnz0hjChLu7J1o0PQRTEQsYlwznIJQP9SgIvu2BzW2tfuxe5Zlu4MtPM0olcUDNjSXZt8poQOF
	leOilGjQNdRNSqsWJ8aRIH9ArfVFlcPkZwNnlsTkpKZBCqjRddzTXhtfygQd7hHhOPzYrypKjxN
	gSi9uqvLlyhiskyopFLC2SgErL3kbIrARXiPGPL05LjhXUhN2bmLFiCeo8sp3fbejeP06s3su1B
	dILQZqRk5RUTSxSOxnmUDE5d8UR14Fd1gErW+W25SS+CxVixrWCcwcLlyhAIL3u18ql5hwlCc09
	HRzGI9A66cLhMd2qtSxu1BE+7vuR9jXjuSPMJR2Jp42l75Hdl2gNqRxktSzSilHtNaU+7EhhDC0
	TV01cdHaD0EeZ0xWb/hyo2UU/0
X-Google-Smtp-Source: AGHT+IFcm/7eA7OM1o0lYGSXbMuGwXv23lCAu3vI178c0WrBUNLFpdQ0EvMHjhKjzvOvGwj6jeFaVQ==
X-Received: by 2002:a17:90b:5487:b0:343:c839:21d2 with SMTP id 98e67ed59e1d1-343ddef34c5mr6162819a91.28.1763016586418;
        Wed, 12 Nov 2025 22:49:46 -0800 (PST)
Received: from ti-am64x-sdk.. ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e07156absm4838126a91.5.2025.11.12.22.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:49:46 -0800 (PST)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	bhanuseshukumar@gmail.com
Subject: [PATCH] docs: dmaengine: add explanation for phys field in dma_async_tx_descriptor structure
Date: Thu, 13 Nov 2025 12:19:37 +0530
Message-Id: <20251113064937.8735-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the need to initialize the phys field in the dma_async_tx_descriptor
structure during its initialization.

Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Documentation/driver-api/dmaengine/provider.rst | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
index 1594598b3..f4ed98f70 100644
--- a/Documentation/driver-api/dmaengine/provider.rst
+++ b/Documentation/driver-api/dmaengine/provider.rst
@@ -411,7 +411,7 @@ supported.
   - This structure can be initialized using the function
     ``dma_async_tx_descriptor_init``.
 
-  - You'll also need to set two fields in this structure:
+  - You'll also need to set following fields in this structure:
 
     - flags:
       TODO: Can it be modified by the driver itself, or
@@ -421,6 +421,9 @@ supported.
       that is supposed to push the current transaction descriptor to a
       pending queue, waiting for issue_pending to be called.
 
+    - phys: Physical address of the descriptor which is used later by
+      the dma engine to read the descriptor and initiate transfer.
+
   - In this structure the function pointer callback_result can be
     initialized in order for the submitter to be notified that a
     transaction has completed. In the earlier code the function pointer
-- 
2.34.1

