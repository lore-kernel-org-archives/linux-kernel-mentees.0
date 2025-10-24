Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0BB2A1BB
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Oct 2025 18:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761329761; cv=none; b=i6ANK/mDA4fWl30ecCvS1a8pnV0JVkzyD2o7SI+XkbhlgLiCXP8VNJjUk2LEK9qdhmIMqH4ENhwBJi5c9iHPrb6KD7hl/9RXthZVt34bt/0Kkne+xKwG60HZRrtJQfe/IfZh8GhvNFZ9H08arOt8JCidWI+fXrEgREOCCNhHi7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761329761; c=relaxed/simple;
	bh=P76X8fvD2MPpFKEqZ6KTULh/PtWaUcgqMGqGoPlTXhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Js8M8ZNnd8GNvOZtKHvHCWcZqSqWdIN5P3C7zlm5759Qu/1cXDfEymxctYDBaUWxWECuY0BITcg6+kclYDBWYKlw1wYpQ7zKwPyVMi4XPJE5aDOkBGwpo9zAekgMNbX+u2YdV/my7tj27Uaayzkur7YedP5g61l3TytVmzCPR60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gjc1XeP2; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gjc1XeP2"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-78af743c232so2362871b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 24 Oct 2025 11:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761329759; x=1761934559; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bw6e/G1JuUENm9jQKnlNnUfVAgZw6BFTm2ZBl0ARA9Y=;
        b=Gjc1XeP2FBUCu3Fo3027uO9xmgaLJQhjEnKIEuVTUChxxfC0NLy5HpfUDAZ2JutTUh
         6iYbiGTAg/oPajEFWC8O6MP2fBwQoZx69tKuTAE6PpsHh6CIjyyADAqNans9X3o0ZfIY
         3cxoQRjNEjA+qBLBfh2OEbRZTWc9/pZ190qQ0LMzB6D4ys/X81/+hIcd9bwVAYTxuzJB
         Hl18kkNICMjrnJHw6FynNKSrhWm4j1XOlqVsVfZZ0Dz3UuDc4DcyKA4GR+WuLSWUYfMd
         7mzNSmbSw+RXC8DZWSBKfF4EmCnY4zy8NA/XYYPIfhXhi/zp8pzaTX9eoh8tz8C0GZa+
         FbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761329759; x=1761934559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bw6e/G1JuUENm9jQKnlNnUfVAgZw6BFTm2ZBl0ARA9Y=;
        b=XqSRtCx6KrmJPBt9F3WyNMFMx6kP4WVcOOag0C8Www174j3M3UpBWYG9FyXPtodkMj
         LBC6uHhaw19SpaHhb51AacTJuvPXBHKDi69UBF+ktMpfslhZQ+fK8gA8DYC7+nZYNRNm
         QKm33wyewn0P0w9xfaGvCs4+FXjBKo4pbzIVQx9ZV7dQsksSaN1IkmCbyH02ZYMhuDWq
         1EbLSoeSclZQN4wZ+rIRgBw3XVGYHbfeMpE4ZUfNtlnZFAn5ElLIAly0RbvIY5+Gsphl
         16G8da0Sv85idvQTeCVLi3e1oYr6sUHNJ5p1jCnyvEG1IuQ5/eW3uhiLbhcfi6cRFlzU
         B5rA==
X-Forwarded-Encrypted: i=1; AJvYcCUHxKNLj8LFaAWzsajG5LngtQqhtdOj3oQPYLej/dP5ukwYvVicwgsxdqBqbH7MBvpQXcnmhHDinObrRh802wWHNLGeOg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYN9M43AxgtGP1ZkI2k0oUbhNnKgMZctSR/Gue890nOT5F3ZwJ
	griHQo0+SqrJ5a6H1lTffexTOIEYnnqz/FCqdTer8sex47qvwwVV7kKe
X-Gm-Gg: ASbGncv3UxEewxrLn3urZP7IifrStjT0ImCjLq8fww7ZaAAj6umYPBpHrSWcwonDq/l
	IsUalQI0BFTyiXFAgNKgDNQzBbMJIrdOZO/6RLhP/pRFqjqNxQw6P3PAHUvsLccAXHKjC4VO4hP
	N/SHoxivKtwdPDoCulSHsv3ZlVbJ1x5h0Jtt0Zlc71GnkdNZVzgw0WO4rl7y9LfpHo8Lk8s9Fue
	NM16+VeZ+EJ5iPdJDBLA/JqaoJ4siCMFPxGTaoO2zQ+LGhkNFdjfKJ88YHhBsjXERRY7EzkjNqK
	9RqUHnIFrVlfk9e7kiZCx0UgKmPu7bmeaS0+Qbn5H4GSwojxN890rKksnwueOS2P9yWYAAZ2SOv
	J4aGP2UNi5bWmwI/TfSqNsrXTlbnJ9LPAAscyqtAGxpcuRs+kVadmTratSIplHKleTfoHEfXamK
	Zkta9oHA==
X-Google-Smtp-Source: AGHT+IERA4tLz/ey+sqksaDd8O95SOQ+ftiTfmWz64Iw16YMS2qgAAmuUfqe+GtaoobHM8lLLXWy9w==
X-Received: by 2002:a05:6a00:cd4:b0:7a2:8343:1ac with SMTP id d2e1a72fcca58-7a286765c7bmr3304816b3a.2.1761329758753;
        Fri, 24 Oct 2025 11:15:58 -0700 (PDT)
Received: from tixy.nay.do ([2405:201:8000:a149:4670:c55c:fe13:754d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274b8b822sm6724210b3a.40.2025.10.24.11.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 11:15:58 -0700 (PDT)
From: Ankan Biswas <spyjetfayed@gmail.com>
To: ajit.khaparde@broadcom.com,
	sriharsha.basavapatna@broadcom.com,
	somnath.kotur@broadcom.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	Ankan Biswas <spyjetfayed@gmail.com>
Subject: [PATCH v3] net: ethernet: emulex: benet: fix adapter->fw_on_flash truncation warning
Date: Fri, 24 Oct 2025 23:45:41 +0530
Message-ID: <20251024181541.5532-1-spyjetfayed@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The benet driver copies both fw_ver (32 bytes) and fw_on_flash (32 bytes)
into ethtool_drvinfo->fw_version (32 bytes), leading to a potential
string truncation warning when built with W=1.

Store fw_on_flash in ethtool_drvinfo->erom_version instead, which some
drivers use to report secondary firmware information.

Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
---
 drivers/net/ethernet/emulex/benet/be_ethtool.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/emulex/benet/be_ethtool.c b/drivers/net/ethernet/emulex/benet/be_ethtool.c
index f9216326bdfe..752f838f1abf 100644
--- a/drivers/net/ethernet/emulex/benet/be_ethtool.c
+++ b/drivers/net/ethernet/emulex/benet/be_ethtool.c
@@ -221,12 +221,20 @@ static void be_get_drvinfo(struct net_device *netdev,
 	struct be_adapter *adapter = netdev_priv(netdev);
 
 	strscpy(drvinfo->driver, DRV_NAME, sizeof(drvinfo->driver));
-	if (!memcmp(adapter->fw_ver, adapter->fw_on_flash, FW_VER_LEN))
+	if (!memcmp(adapter->fw_ver, adapter->fw_on_flash, FW_VER_LEN)) {
 		strscpy(drvinfo->fw_version, adapter->fw_ver,
 			sizeof(drvinfo->fw_version));
-	else
-		snprintf(drvinfo->fw_version, sizeof(drvinfo->fw_version),
-			 "%s [%s]", adapter->fw_ver, adapter->fw_on_flash);
+
+	} else {
+		strscpy(drvinfo->fw_version, adapter->fw_ver,
+			sizeof(drvinfo->fw_version));
+
+		/*
+		 * Report fw_on_flash in ethtool's erom_version field.
+		 */
+		strscpy(drvinfo->erom_version, adapter->fw_on_flash,
+			sizeof(drvinfo->erom_version));
+	}
 
 	strscpy(drvinfo->bus_info, pci_name(adapter->pdev),
 		sizeof(drvinfo->bus_info));
-- 
2.51.1

