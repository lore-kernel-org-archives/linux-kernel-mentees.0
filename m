Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042B9259C80
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 06:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759820050; cv=none; b=QRw197XtbAl6vpbCK4XHndzz8YcCsKEhI0DzWiN8InjGYTRl/yA3b442z9vNhYdX0wUMGlEGGDpqvHbUjUZ+i1Jt/StS56bgf3CwJKD++pM59JjFU0eiMN5M9mmYqy3diYZ4jIAmvBea4rqdJS/gZ58dFa3Rpb+VznY6SaQMF3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759820050; c=relaxed/simple;
	bh=TTG+AhssdA42D9C9zLf9qT/1ySGtIas7NJQm9lzkZ40=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P5cdWnYcei+0tsg/3IYSLCFpI2/tr4a3HKSWyWAXX/SgW9TNxUXzBkSyr26WolzHKzX2JiR5QXKdGTgRY37F8j2Y9sXOJcU9sq7F8PQL59FoCPHNqhvJZciOPLScIQfZAr3uPhCuZXj8CclX4LNOdBmKlRDZFtNxmcljv7nrXMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZZSXZPj; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZZSXZPj"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D5A7616F3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 06:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UyfeXdi1WF5r for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Oct 2025 06:54:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=bhanuseshukumar@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE1E26161D
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE1E26161D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RZZSXZPj
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BE1E26161D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  7 Oct 2025 06:54:07 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-32eb76b9039so7703438a91.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 06 Oct 2025 23:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759820047; x=1760424847; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mswOKIOKbhdl+VgGK7vEvPqN70bAqxJl6ivwxQMTkZ8=;
        b=RZZSXZPjKTuReG/gDDorifqq6IrEpqNQ2Mt1rj98S/kWiK5lE3WuC8LQn4IKLKitqD
         ib5UaOUHKlFAEGmzdNZau7pNSZntZnT/sg/hQ1a9K4nkCL2WvgJbcqtPBROqB5+DRyO5
         zdaNQzwPrnWJ+3CsqhtNVoLsDUr4aFR2CHjO1T+g8aM7JHhU+1q8hkeV5Gkja/7MqNBt
         ZinHz0gXkEpckvhj2PjIF2kKkjDm4aDs/Az1z11qqx6vxL7U8WFpNQlksvzXSdXpWs3C
         YveWnjS1GWMYdmGcPAGa2krM7peFyawJ1pfH5334+YfRUS0cHMJM/nwoEQNqcwzfnQPU
         dfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759820047; x=1760424847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mswOKIOKbhdl+VgGK7vEvPqN70bAqxJl6ivwxQMTkZ8=;
        b=G2iTcAr/yIywWHhOJtoR0+i8QOoueBcv2FobOT4ltwj/OIB41RUCWhEq7SXuiLo7Uf
         xM3ecSNMtZrlumlZts+S6HxIF3mqzojg0U0JWnjmRt6JhqbM9NaNuK9r2VpuGexx3MLd
         4seaG1Oe4s4IAYC8wJnGvpeAE1S5Au9BVAxMKMsUE16eOJSzGNu+eMFty+ClJNtryiTa
         TzVoHWTi47OFxB7ABuypx6TZgo/JPZCnWbvuhPZixGWkRJ4CrUHgCBNGrlCKJV2PkFeJ
         v3bzNg8xFV2M7CWHi1epTb4G2uX18CX9wDpryv5Xwb1a1AmDlXhew4OsqHuse9BS3Btf
         sXdw==
X-Forwarded-Encrypted: i=1; AJvYcCU9ZpHQq4OvrEAHjJB2Wu/QO0/ahLBHrf4zFXLJQtc+NOELkw3SC/iEpzT486GkcFB42kMuvQX3ONc6nVEQMa5yxBCJTw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzWV/y+rfA88Lqtct/6Jgvf7KBFRxhdSBjMmGvb+XR/M+lVvNI/
	uu+ruFp8kb4Vy0ylSVCJykgNLKtJtS5fTPBDKniUQfSlz7BMAYcos+yb
X-Gm-Gg: ASbGncs2nnsokKifViBnABpSFFqGF8nN4GZBoDYosI0g81qAX5Ab0x+DWgGRtAHRsRY
	FTaLTBboNMJPD8lPAqA9ZUV+LtUaT8NrGjd19WkXy9YnsT4drPuZhcSXtkY+M4tERfUAeCvEamA
	WnLIPH1g2rO9bUApuGYIhZsZbdoEUi9M3cxUCjO34TkLxCtO9q2AgljGBJe++Ea9zXLxXRLt+KR
	j2jmB5ZKVz7BI2mNHWmSYaXRJlD4R3+Pbwz9mPA0/rfSRCFGbfJIchcKco099De9d4P1kshDZjv
	ItbB3Mocd3PG0CdwNrfqEcKjOR/aYriUsAcN0/x0Hrw9NSsiV1q5PlRqaLtIL3AN8vWhgjAce/z
	g8Oe3I56bOadjntbdfTAiYtdS3lnY/kR8QVJLO2j49/oewNIDphR+pQPX/THeD9AuOQXcLb0=
X-Google-Smtp-Source: AGHT+IFOWxg9dlREBFVestaXMYXB//r1bQveRFkHWcW/v8RP8fcHviNaQLC2YO5f6bIdAK7/nqQmyw==
X-Received: by 2002:a17:90b:4d0b:b0:32e:43ae:e7e9 with SMTP id 98e67ed59e1d1-339c27a50ffmr20351680a91.17.1759820046589;
        Mon, 06 Oct 2025 23:54:06 -0700 (PDT)
Received: from ti-am64x-sdk.. ([14.98.178.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339ee05db08sm824666a91.2.2025.10.06.23.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 23:54:06 -0700 (PDT)
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
To: Don Brace <don.brace@microchip.com>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>
Cc: storagedev@microchip.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	bhanuseshukumar@gmail.com,
	cassel@kernel.org
Subject: [PATCH v2] scsi: Prefer kmalloc_array over kmalloc involving dynamic size calculations
Date: Tue,  7 Oct 2025 12:23:45 +0530
Message-Id: <20251007065345.8853-1-bhanuseshukumar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As a best practice use kmalloc_array to safely calculate dynamic object
sizes without overflow.

Acked-by: Don Brace <don.brace@microchip.com>
Signed-off-by: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
---
 Note: The patch is tested for compilation.
 Change log:
 v1->v2:
  Updated commit message to refelect correct intention of the patch to 
  address James Bottomley review in v1.
  v1 Link : https://lore.kernel.org/all/20251001113935.52596-1-bhanuseshukumar@gmail.com/
 drivers/scsi/smartpqi/smartpqi_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index 03c97e60d36f..19b0075eb256 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -8936,7 +8936,7 @@ static int pqi_host_alloc_mem(struct pqi_ctrl_info *ctrl_info,
 	if (sg_count == 0 || sg_count > PQI_HOST_MAX_SG_DESCRIPTORS)
 		goto out;
 
-	host_memory_descriptor->host_chunk_virt_address = kmalloc(sg_count * sizeof(void *), GFP_KERNEL);
+	host_memory_descriptor->host_chunk_virt_address = kmalloc_array(sg_count, sizeof(void *), GFP_KERNEL);
 	if (!host_memory_descriptor->host_chunk_virt_address)
 		goto out;
 
-- 
2.34.1

