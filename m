Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581841FDA9E
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  6 Aug 2025 06:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754461657; cv=none; b=Z+bCnIKjbig53qO377AoO+9y2YiTIatEw5bMMTuTN3znD6EtJzCPk8dTPZZBnIJmbH0n0sZ0S7rzJbFYP+SVN+zw5qOT+0DvgMqJUet8GOolw9vqo94hpGVxhOvne9nGoRMTdlQLzbXQB1j1ZUraQcqwnzUZVcwJxKrSr0e3rpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754461657; c=relaxed/simple;
	bh=ArxsUmBRLlbSgLLVtSCRW2TXy+NtPKUl63JAPtSukp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BbbVJUQgepmLRXKuVT/S9fQmuFnoiIDlagWgkPPf0L5jt24/qlTmO67kPwD2+Vi5PMfRszMOIUWvVaVdFAbdm3raE0SYoMyVhZDeIKyeDSVxsoVcFbgX8yg5VG5t8B+8CZVNTcdQ59LohKXJzdEytv4ZgcM19wYgtJcCrcoJtU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OC0XvoKf; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OC0XvoKf"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b34a8f69862so3792072a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 05 Aug 2025 23:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754461655; x=1755066455; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v3VgAx1fS6I2c71PvMh+h8E4HzTPn+s88CNs629QlCA=;
        b=OC0XvoKflPD44rr8sCvxFuxtzay7rJ41A20qpzSB4FgHdxOpkCXlpfinvJpHQBzvUw
         3RJ95htlJxtb09/QGEB62COYDkaTZ4UxgOhQsAMDTYacgSi4CI6J/gRleZU0yyd4wzyx
         pzLPV+Y5qsHoDarNg0aavPViuRtc/SWJvIrhFcDVOeRsk66f3+e41DWdjFqmY9IjWkZc
         xkpIIn1UDrE9/xjZsQVWAtb4E8q+8xS9quuOdf1QgRPdvmn6Y9PAEyn/2BWwsJcqYK/I
         a3kMMbU+Q/tmCG9cavcoUnwriqkvXKIhAVHyFGJ3P2p+a1cagfNrzwPSACOyJvCY9CQa
         Q95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754461655; x=1755066455;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v3VgAx1fS6I2c71PvMh+h8E4HzTPn+s88CNs629QlCA=;
        b=J8zDRLAT+W7O7U0rI88/iUFCjX+++Bw6EtXPC8f1WxsUdzYamUn72MA5obfPOGYZff
         Vfo+eBHEYAIUQm1h2EVzSgGpfFDb6GYNx4WMaNuJ4apTitdybpjaHw3DDSrvszY2K46y
         46t4mocjzU+tfmh4dU8BET1HWXNU+RcOQ/6Dlr/KjPGlrvrqJ7xcH8g1EB7T3qCZV7MT
         5on5x/0xZXYleJzlVfBB8E5JrDY80Aql3OSg3zgvJgIrqf/gH3GsnwpaTMyeMqygqf9P
         ueA/Mmkza9i+iBqHHja/mXzlztjZZW7gdEyKJr77AxppwXDz1aCDP548AwRkUUmY40hh
         QdiA==
X-Forwarded-Encrypted: i=1; AJvYcCXPGMozaa3if/7LUSg6qisPczfXyWEpxdQfHfRC/l49NujMw0SscZ68l27Ds+ZXyGwZsd5f3x8gWOGzAGRLNTa7AlHutA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwEBhnxV+ujYB1eGwEUYFLPiknv25r/Fe1J1vpcK13kq30XCYMa
	yn/PzIBGNMoCR7vVJqIRTDk8jp52ILqjQNDItrWz9ZsL74jFqZNYWMit34XAN+SM
X-Gm-Gg: ASbGnct2KcCcePXDt8AOZe7dheZpC0HQbvGlc+laWDYwwFd8MF06xwpMfEHxubyXXpD
	1euhaaaUWVMODKrK+iaGHW2em9Nx94DlAodssDkL+kvdLebVcJrXApLATGbu6zCKEhykplVjwA/
	jeL5toJJLo7REw8dW93UVv4UxV3jJa4Pw+ArCgaZp8sc0QxRQMd7zHdwJv/tZGgjMp5UnU7i7or
	FEoCcttoLdOiwVMK2LNx50nwjnz0TosqUIXdJuT8z0/cquJCFYRL/UwNRXwxjMJEHFeCg084HBO
	GnRpY6tsRMMtnm5J1w2U+vWTRAPJs1vEmMfN+73CNBdRZgqWSPVxnOhu/QWYzuge1yMrPpWP0pt
	P7DaEPFJq/lWskbGRMUFaaA==
X-Google-Smtp-Source: AGHT+IEpNrcd5b5s+6Lh0/TxzBSctjDMFTnSnsB9TlfDEOgYkwSscobfkMZxY34y1QWt3oSEck/+zw==
X-Received: by 2002:a17:903:b86:b0:242:9bbc:3645 with SMTP id d9443c01a7336-242a0bfe727mr15011065ad.55.1754461655477;
        Tue, 05 Aug 2025 23:27:35 -0700 (PDT)
Received: from localhost ([106.105.221.248])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-32102acbc56sm8223370a91.2.2025.08.05.23.27.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 23:27:35 -0700 (PDT)
From: Nai-Chen Cheng <bleach1827@gmail.com>
Date: Wed, 06 Aug 2025 14:27:11 +0800
Subject: [PATCH] greybus: svc: use string choice helpers instead of ternary
 operator
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250806-greybus-string-choices-v1-1-3e1c91048b62@gmail.com>
X-B4-Tracking: v=1; b=H4sIAL71kmgC/x3MQQ5AMBBA0avIrE1SFY24iljQjppNyQxCxN01l
 m/x/wNKwqTQFQ8Inay8poyqLMAvY4qEHLLBGtuY1jiMQvd0KOounCL6ZWVPiuRCUwdbt3Z0kON
 NaObrH/fD+34t4QiOaAAAAA==
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 linux-kernel-mentees@lists.linux.dev, Nai-Chen Cheng <bleach1827@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754461650; l=1226;
 i=bleach1827@gmail.com; s=20250730; h=from:subject:message-id;
 bh=ArxsUmBRLlbSgLLVtSCRW2TXy+NtPKUl63JAPtSukp4=;
 b=P45rsFVpVU9VMZHYEQEdptLJC7YPc2z7ZQPoW7edIi9BkJs4M4LOUBYu43c+mYI0vGXbDVG4z
 b0R0MX8eaniBGUB7JAcRFB+nCLiXQC6Wsaaw72giYI/Agx0YVHkLkxx
X-Developer-Key: i=bleach1827@gmail.com; a=ed25519;
 pk=jahFPRplw20Aaim8fIt8SxlFMqkHbJ+s8zYBGbtHH5g=

Replace ternary operator with str_enabled_disabled() helper to improve
code readability and consistency.

Generated using Coccinelle semantic patch.

Signed-off-by: Nai-Chen Cheng <bleach1827@gmail.com>
---
 drivers/greybus/svc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
index 4256467fcd35..35ea7147dca6 100644
--- a/drivers/greybus/svc.c
+++ b/drivers/greybus/svc.c
@@ -10,6 +10,7 @@
 #include <linux/kstrtox.h>
 #include <linux/workqueue.h>
 #include <linux/greybus.h>
+#include <linux/string_choices.h>
 
 #define SVC_INTF_EJECT_TIMEOUT		9000
 #define SVC_INTF_ACTIVATE_TIMEOUT	6000
@@ -73,7 +74,7 @@ static ssize_t watchdog_show(struct device *dev, struct device_attribute *attr,
 	struct gb_svc *svc = to_gb_svc(dev);
 
 	return sprintf(buf, "%s\n",
-		       gb_svc_watchdog_enabled(svc) ? "enabled" : "disabled");
+		       str_enabled_disabled(gb_svc_watchdog_enabled(svc)));
 }
 
 static ssize_t watchdog_store(struct device *dev,

---
base-commit: 7881cd6886a89eda848192d3f5759ce08672e084
change-id: 20250806-greybus-string-choices-e6d53d2382a6

Best regards,
-- 
Nai-Chen Cheng <bleach1827@gmail.com>

