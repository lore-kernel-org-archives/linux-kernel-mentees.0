Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B9014A4F0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Jun 2024 10:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719312976; cv=none; b=XZmRBlwsfIsQ4h6IMO/g/oRdurrOu4gnF5t1LhxqVGXitG54hRLyqKGGmUxHZ/uia5C/L9uaTIOB3aIPfHMiYo8pclH12bLP4X9vKHVxNyQpu0yGcVJkhguPHYjxTuATHSf5JlrvxijRvI0mt+ioOZztiBzO0cp8di3Q658lAZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719312976; c=relaxed/simple;
	bh=hTNAj3/Oja0HKxdIRA7PqTbQQGTuCEMxvkrEXUfSFao=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QUjKikJTIfUHqGvLtxFLZv8mHkG0dX9jeFDKnVZctpANVnccOj13dSNZOwe0ENQORVnjqu7wg/Ghg0uafyYyqOY/G37lC2pmejvaEf459821M2YnPFCDyy+P+ub0VaL0SX6PIBCfnrbpI2mPF0uNYaJvlSb9NtvDE8vAVZQ89t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGmxUvrv; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGmxUvrv"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5E2681E02
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Jun 2024 10:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4d8LNBYFtAT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Jun 2024 10:56:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::e2d; helo=mail-vs1-xe2d.google.com; envelope-from=luis.hernandez093@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E652881DF9
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E652881DF9
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IGmxUvrv
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com [IPv6:2607:f8b0:4864:20::e2d])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E652881DF9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Jun 2024 10:56:13 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-48f48ab80e3so976614137.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Jun 2024 03:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719312972; x=1719917772; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ppyxY5z+fhazOwe4ttxmX4yNRD5oIeZ1CdOSpo77Chs=;
        b=IGmxUvrvXvWk8v6ObpOYqAvaC2SJ6TuoiBVm+C3vOf5WuUUlPUCspNqlJqtYZDzHar
         hAjybm/M9yg3um7LutkqQVrJGnjqAFu7MCMBtbc3IxKuncvolwSaSC9FpKmMzWVs4Byt
         wkKgOTeiMiUQqSXP3o3w//gpTxKPVQdM4GBOe2f5z7q5uzKcnKhq3puUTDuqygf4r6J4
         CV9hDumc1u/VPMNpdMx20nzNhJeYRedChwI17JXQHkTynKnkub6K4VkzxLC6FVYXxPwT
         GjTF8Gq3tpM+0Q8UF8JdvOqqcFTpxOr/EV/irbhnBDGXBGrwbU1gc14QQuKXoxqFs9+8
         FqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719312972; x=1719917772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppyxY5z+fhazOwe4ttxmX4yNRD5oIeZ1CdOSpo77Chs=;
        b=pXdlhuFTf3kgDcgWSSXWZGUUHErNVAgNQMVhbg6KIpUaP6atvt6uSw3Ls/J4gUztzm
         isMw9aaDfoUpW/ilohM1xq72/rDwHiCnrFS4QSWMlFKFW42K3WKLPE/mj/fUawWYm72h
         FHmPDEgGysEk8AtNTi0PrWa0NC4yC+6ropFgMiqIz6bhTljVC8o/5wdlB2ZHVanY0Zuz
         reNxyHC8z5wXYisC6b2gof49hl8PVoCNcO9/fc4eibnd4n4LurNs7PigLV+hYCHPcXqh
         CYw2P8X1/S9US4/Juh4L7malb2+yQF9BW0qgWo0/S4W1B9KfT+te4bIRsW6EQAszA70P
         WVPg==
X-Forwarded-Encrypted: i=1; AJvYcCVLlirLwyAeLry8KlBrSguU7uxHmcIFcZgCGRXD+PFw2p+MrNlUPAcUUu29TEIxdipukBns/8peHp55CiWeDsDcSADlV5YAbK3PZ5oLr0yYzQ72voD9+o4uyhO53yea
X-Gm-Message-State: AOJu0YwyERFWfAF2C1fqlez10vDHb624IrzQCcBlf1sqfmyx83VfZidm
	ScZm+RfXi+u3MfhdrgXROuRjuQlmOvMSeCeKJZEhOzxEVxCuHm/D
X-Google-Smtp-Source: AGHT+IEgeMrXNRaNQ180Aiaut0pkPbBUrOhOWB98dPWzqkh+hAlX0ONFQcOtPzs5digetMcmsz4k3A==
X-Received: by 2002:a67:f84b:0:b0:48f:4218:4cff with SMTP id ada2fe7eead31-48f5295763amr6688347137.4.1719312972490;
        Tue, 25 Jun 2024 03:56:12 -0700 (PDT)
Received: from x13.lan (2603-9001-5c02-c5bc-0000-0000-0000-1b5d.inf6.spectrum.com. [2603:9001:5c02:c5bc::1b5d])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-48f6946f67esm387996137.29.2024.06.25.03.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 03:56:12 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: Luis Felipe Hernandez <luis.hernandez093@gmail.com>,
	skhan@linuxfoundation.org,
	ricardo@marliere.net,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] hid: bpf: Fix grammar
Date: Tue, 25 Jun 2024 06:55:51 -0400
Message-ID: <20240625105553.50830-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* spelling fix: XBox -> Xbox, lowercase 'b' as per Microsoft branding
* rephrase: paddle -> paddles, the controller itself has more than one paddle
* rephrase: replace usage of "those" in favor of explicitly making reference
  to the paddles
* grammatical fix: report -> reports, use present tense verb. 
* spelling fix: interpret
* consistency: capitalize the first word in bullet points

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
 .../hid/bpf/progs/Microsoft__XBox-Elite-2.bpf.c   | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/bpf/progs/Microsoft__XBox-Elite-2.bpf.c b/drivers/hid/bpf/progs/Microsoft__XBox-Elite-2.bpf.c
index c04abecab8ee..858cf20ebe2c 100644
--- a/drivers/hid/bpf/progs/Microsoft__XBox-Elite-2.bpf.c
+++ b/drivers/hid/bpf/progs/Microsoft__XBox-Elite-2.bpf.c
@@ -15,20 +15,19 @@ HID_BPF_CONFIG(
 );
 
 /*
- * When using the XBox Wireless Controller Elite 2 over Bluetooth,
- * the device exports the paddle on the back of the device as a single
+ * When using the Xbox Wireless Controller Elite 2 over Bluetooth,
+ * the device exports the paddles on the back of the device as a single
  * bitfield value of usage "Assign Selection".
  *
- * The kernel doesn't process those usages properly and report KEY_UNKNOWN
- * for it.
+ * The kernel doesn't process the paddles usage properly and reports KEY_UNKNOWN.
  *
- * SDL doesn't know how to interprete that KEY_UNKNOWN and thus ignores the paddles.
+ * SDL doesn't know how to interpret KEY_UNKNOWN and thus ignores the paddles.
  *
  * Given that over USB the kernel uses BTN_TRIGGER_HAPPY[5-8], we
- * can tweak the report descriptor to make the kernel interprete it properly:
- * - we need an application collection of gamepad (so we have to close the current
+ * can tweak the report descriptor to make the kernel interpret it properly:
+ * - We need an application collection of gamepad (so we have to close the current
  *   Consumer Control one)
- * - we need to change the usage to be buttons from 0x15 to 0x18
+ * - We need to change the usage to be buttons from 0x15 to 0x18
  */
 
 #define OFFSET_ASSIGN_SELECTION		211
-- 
2.45.1

