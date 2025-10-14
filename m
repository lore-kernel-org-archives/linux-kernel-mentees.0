Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911D930597D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Oct 2025 02:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760409693; cv=none; b=V7kJblvAiFLk1+A1o+Njn2q+WneHY8AIWafC/iqsUrVTZLcirL8MbOugSFOAOQIVP4Lig7yRfp7iAX/L7uUdZzbYkaDb8pKD8jIwWWANN2UjjbFF7sWqujcnP3X3P5hSfVrk6H9a9PYtsAcej0JT8yP3Ydkek7+7b8BEgcBhIok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760409693; c=relaxed/simple;
	bh=jM4VfDDT9o/5KEiX8vxhJ4DNOc3U9+2v7a2kcqEcNmk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VPpY3fabswOY387hYAbMtTVyUg6hgGKpcEOaPfTlSuzLZpjJTA9T1p3TyTMWJdQZafd4Pw2n89rRWdQYPYsuR+cpK+fnf2/IHplbtR8uMIzrP5BUFCequViD339k0ybb98pLgImeAn/QyKW4W8xdeNHlu0rNfKY3CVxVQ2zAiPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRxyv47z; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRxyv47z"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32E2B830FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Oct 2025 02:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hr6i_jkN-0S for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Oct 2025 02:41:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 58AF6830C2
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 58AF6830C2
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eRxyv47z
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 58AF6830C2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 14 Oct 2025 02:41:29 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-33082c95fd0so5950679a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 13 Oct 2025 19:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760409688; x=1761014488; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A1AsgWZdoSmBmACCUATUp5pGfSqbvQlK72tCjitQTC8=;
        b=eRxyv47zeJwlo0BiVR3SBp7rnZDr9yfCv+P7sIsBLqr8xRwjGChPGNK37MkArcO0c0
         Q8MCcGlOym2PbABj215jxsv6j2k3AkRaZROPTRmawY/d1yn5ilvaGpdS59QK+yduRMjb
         d46TMhYrN1jFsO7J0u7Jhey/aMdp293LEop32PXXbF9ZsSs+Y4DKd5mfa+lToBhazIeT
         15grZtmZA/2YCcCXjS8qDD0alkW5LLG7RtT0rsrAqnxN/yJ7X5GlfosrTLJmBRFE1fvk
         nGSGPt0UQsD9rRF8wa9CtFMc6+WdaVeLNtZ9mM766fFPNJGok6Jm2p+BQOUSg+mJv8iG
         pDIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760409688; x=1761014488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A1AsgWZdoSmBmACCUATUp5pGfSqbvQlK72tCjitQTC8=;
        b=nCLG1aL29jskiZibKSV/qf+KElPk/L//6+SaOE9opsIFPgH1e/MBsN++NMWBFhZd2b
         gOUzMzvPw35E/q7XaQP8SZ11PELzHiXg8s4OLN0qfBcrae6NxHJMAVBYbe7WHVLbbpf5
         W16raXDblf+ErYNWfpvV4kb9bDALLuJ2/obHmycBBrKn1AiflZZinlGR83D7Jco7+cpq
         cnfPlkHP2j2sQKkMqU+hTDJP1Zm57Xgo9A70luizLLDyp7TyYJrqMXCbQVCP4/UMIxvE
         74fVBl7tjRmz3DRDb07I0kuDVkdDrZ7noVztJ9MaBfjO2qvtI6CshxZgyug2nufgz1ng
         FTHA==
X-Forwarded-Encrypted: i=1; AJvYcCVP9sa+a062kEjA8VcPO6W81+92NvSB6VsvJA+AUXfzWW0/+G20TPNx5eXSkZIZsW7D8IBK3nOkOv+dAU92pH1/qFVQzQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Yz0tZq1XB9XKuNWbAWMw/RAcmoSc/swMNaQCM6hrmOFzwlwmonZ
	xn907JkDKlpO9C2dXZTCZHa98zXXsHQ7Zd7Ow+ri1dGOHdzURRocSka8
X-Gm-Gg: ASbGnct0wUB6tVp3RGbkDSmh/llPOcaT8FmOXJXmv9yVHHNkPFqp3zDyuACcCb2PHSw
	Qh86MGAO4dhsk1yhWEsYAuilDUqmh6FUL8edPFbyxymMi4GccW+gMTP5zDtBJNSC+MVEB+scDHz
	YmQRDbf6w+aCIT7kvmwI+rSrtaOds8nUzu2O6GzfoGVNk9vAy2OsYlss6EdxjeJ8aNg8KTrqqfg
	yl0lZ8pi+j4hs07TSHSBk3ojx0ihEULt4wAr/lT+aT4sfEyJNHkmFgzL3MUc7n/0lId7Me4XE4K
	Sht/0y5hOw4Br6ISZU8anbCBXM3Y/nLLCYmK5QcGpKeUAFPK688kLbhN6YRVoTxwkwERONgWEQD
	Ov5omHBNrXN1Yy/c+ZXpA7IpVoOnhpJXaTEKccvZh5Nk/o6ZMSKZOA65NzCP7Zw/K88BHqhYQKx
	FtWjRGIw==
X-Google-Smtp-Source: AGHT+IG+wGyTO6i418tFyeF5ZIBvx56+NdDpnWWC78M802A2HC3tEEKBP08Ixtj/5cmGK53IKP9RxA==
X-Received: by 2002:a17:903:4b50:b0:246:a543:199 with SMTP id d9443c01a7336-2902741e471mr303964665ad.54.1760409688398;
        Mon, 13 Oct 2025 19:41:28 -0700 (PDT)
Received: from ti-am64x-sdk.. ([152.57.140.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f8f9bbsm147442065ad.121.2025.10.13.19.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 19:41:27 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Niklas Cassel <cassel@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Mohamed Khalfella <khalfella@gmail.com>,
	Christian Bruel <christian.bruel@foss.st.com>
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	bhanuseshukumar@gmail.com
Subject: [PATCH v3] PCI: endpoint: pci-epf-test: Fix sleeping function being called from atomic context
Date: Tue, 14 Oct 2025 08:11:09 +0530
Message-Id: <20251014024109.42287-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When Root Complex (RC) triggers a Doorbell MSI interrupt to Endpoint (EP)
it triggers a warning in the EP. pci_endpoint kselftest target is
compiled and used to run the Doorbell test in RC.

BUG: sleeping function called from invalid context at kernel/locking/mutex.c:271
Call trace:
 __might_resched+0x130/0x158
 __might_sleep+0x70/0x88
 mutex_lock+0x2c/0x80
 pci_epc_get_msi+0x78/0xd8
 pci_epf_test_raise_irq.isra.0+0x74/0x138
 pci_epf_test_doorbell_handler+0x34/0x50

The BUG arises because the EP's pci_epf_test_doorbell_handler() is making
an indirect call to pci_epc_get_msi(), which uses mutex inside, from
interrupt context.

To fix the issue convert hard IRQ handler to a threaded IRQ handler to
allow it to call functions that can sleep during bottom half execution.
Register threaded IRQ handler with IRQF_ONESHOT to keep interrupt line
disabled until the threaded IRQ handler completes execution.

Fixes: eff0c286aa91 ("PCI: endpoint: pci-epf-test: Add doorbell test support")
Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
---
 Note : The patch is compiled and tested on TI am642 board.

 Change log
 V2->V3:
  Addressed Bjorn Helgass review points in v2
  - Rebase to pci/main (v6.18-rc1)
  - Add a space before each "("
  - Remove the timestamps because they're unnecessary distraction
  - Add "()" after function names in commit log
  - s/irq/IRQ/
  - Rewrap the commit log to fit in 75 columns
  - Rewrap the code below to fit in 78 columns because most of the
    rest of the file does
  Link to V2: https://lore.kernel.org/all/20250930023809.7931-1-bhanuseshukumar@gmail.com/

 V1->V2: 
  Trimmed Call trace to include only essential calls.
  Used 12 digit commit ID in fixes tag.
  Steps to reproduce the bug are removed from commit log.
  Link to V1: https://lore.kernel.org/all/20250917161817.15776-1-bhanuseshukumar@gmail.com/

 drivers/pci/endpoint/functions/pci-epf-test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
index 31617772a..b05e8db57 100644
--- a/drivers/pci/endpoint/functions/pci-epf-test.c
+++ b/drivers/pci/endpoint/functions/pci-epf-test.c
@@ -730,8 +730,9 @@ static void pci_epf_test_enable_doorbell(struct pci_epf_test *epf_test,
 	if (bar < BAR_0)
 		goto err_doorbell_cleanup;
 
-	ret = request_irq(epf->db_msg[0].virq, pci_epf_test_doorbell_handler, 0,
-			  "pci-ep-test-doorbell", epf_test);
+	ret = request_threaded_irq(epf->db_msg[0].virq, NULL,
+				   pci_epf_test_doorbell_handler, IRQF_ONESHOT,
+				   "pci-ep-test-doorbell", epf_test);
 	if (ret) {
 		dev_err(&epf->dev,
 			"Failed to request doorbell IRQ: %d\n",
-- 
2.34.1

