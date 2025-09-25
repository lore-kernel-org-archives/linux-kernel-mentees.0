Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573CC302CA3
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 15:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758815966; cv=none; b=PDeL5UB3E2QgmX28N6NEPQVFz4UdIDzGKtbZBn8VAzk14w1cYJ5FCWtKxa1x/NmQJEQKciZ9PQ/DpOZRZZgX872CM/9X05fDI7D+ep+trXhO8PzYyRh7xVRF4QIAtm9SqwIrkFPYP/Gc1GzGDI9saDo+pn82NYqn5iReJFVyM+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758815966; c=relaxed/simple;
	bh=2eZlHWvOxIgL3EbW7gHH6le+1fHOsCXZEgZKoMQwuOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LW/xd44iQZqdihWsBLfzHr9yDLTnPUEWUBTbzYpgTDr8+Es29Hz4vx+OXHA+I4y3nPNfDm3wZHRQ8cSZjQ/ULMPgp+PnGx1Zh0htOORZvUZXdjjTcKSV99dzBUddGrYRgRleTbalS4vmv4xyfpGPr8qPyisZ7dCSEJgqVwUC6Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXEkS9f7; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXEkS9f7"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-77f198bd8eeso920451b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 25 Sep 2025 08:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758815964; x=1759420764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0haNpnskPhHv+Hqq/prkArlkxvbNwI7IdrC7Jtj5DeM=;
        b=LXEkS9f7V+Hr/xTAs0hOkccIMF2ZdR94aAEnA24xvmOtxRpCjkh9AjagrSfRWCW5tb
         ttNldsb99Z9ffZkrovyYKH1AdT056tV5zcaqAchbqM/OotX2Q9JhCwlcedWpJ9Gx1csp
         ntoKFJKRbq5Eg85p4Xoq+se/J+L/1evSltVO3tz4Zn+Ss4oXZ4gfmXySMi34HXGSAtkn
         UBNfZovWV6+uqdjrvUMxca53o2hW9nMNOQNuj1Ki6FrP/ktyvWFIsfoZZz641JtKjdkY
         KpurQuH7bYwbL4xhTr3kMAI1j4DSuTSQFuOGjIjwnpKHWez5pBzetwJDQgIVj/0gV9LQ
         dvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758815964; x=1759420764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0haNpnskPhHv+Hqq/prkArlkxvbNwI7IdrC7Jtj5DeM=;
        b=g4ULUeBuCsWd5kB4zLqfYetgNo0y+qOViOtWVB9zU+hk6qSB5/w2XauCyGZyAyBhwk
         jgJ64lrCTgf5p+o3MovM4YmOsEgADqBlcow/HRNwBzz09OdXGZuRjQk6NeHTb/PVTztG
         K7olyZvHKCQzm1qnmK1EISH1moDSjv+dhBXRWaEoMvfkVujUrK9d7w5/KwMt8iVFWkft
         TUrRiAMPPUFRyswe12WP4HBd7LOsFdW1xwra8N3PHELfEJjMPXnKEQbz3mpRVQogEfiA
         MRRDPi1aHZu3XtlkELUMjeKBnWMzwfYnpo9zrR15jx4g6HQOPgvL0gvQ/yKEFt6dg4AK
         gqww==
X-Forwarded-Encrypted: i=1; AJvYcCU2/2t5zw2iBF7WmDgMJq9A8W8/MP0wbwERokdtFiluGqOpO+O1DDJdNZQXYOc17UI7BBjz1C2dZ4FPu9nnqRPcWnNmUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyXGjA24zTT0SPVyBxikYt2tyo4+DvMmczXsiLBnAkTGZ6hgj9Q
	V4OAPg858bu9SR5e8wN6RnUrPrRdNRLKZp5MF4P+ttyIMxXj7zw/MUC6
X-Gm-Gg: ASbGncviHqARAtTYdMtZcrc8joqDwrPMZWJuUdoe8g1wthLEv7qd4j9/YsjIhKmGr9e
	732f3MiW1dwSlGeQnhc7bGK2scADBzMGxW01C0/qdhszYVuP6YVsCvDjCHOhm/zi7LR4pA6JE4M
	xoPgrjTRqWe91SqQkiVcbPIvOTeXtD1NBLbDah6Yf/4gl++ykMJMrGHMTUjYf9K24jYNfyy09if
	/JJbWJ81CEC18ioQTQyODLDz4kX+QsZaVv8LVn+K91vsApbvoWwW7ysFOGCvRxLX0S1jxwbeDx/
	xkxcz8YzZlRQym7poOdRygSnO101OzD3H9gV2PHtyr9hnHi2jJ1hgQhfzSKPu+TfEGYrjzaMl2u
	bcSaZ4crtV2MPESM8WrCv+RxSEWQHOCqo4MnfNFxclJsPs0NtRs6nfEuCqrK1SGqN63K9dB/u4W
	qA6XhUTwkeLxKP
X-Google-Smtp-Source: AGHT+IEhAQcRgo74RGno0MIUNQs86Uz784EwSabYzAQVGz1THpiA0aDqQT0LiijW0GN3h3wpllQpcA==
X-Received: by 2002:a05:6a21:207:b0:2ed:997b:44b5 with SMTP id adf61e73a8af0-2ed997b52c3mr1885758637.37.1758815964344;
        Thu, 25 Sep 2025 08:59:24 -0700 (PDT)
Received: from debian.domain.name ([223.181.105.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238cafasm2320354b3a.4.2025.09.25.08.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 08:59:23 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	david.hunter.linux@gmail.com,
	I Viswanath <viswanathiyyappan@gmail.com>,
	syzbot+94d20db923b9f51be0df@syzkaller.appspotmail.com
Subject: [PATCH net v3] ptp: Add a upper bound on max_vclocks
Date: Thu, 25 Sep 2025 21:29:08 +0530
Message-ID: <20250925155908.5034-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported WARNING in max_vclocks_store.

This occurs when the argument max is too large for kcalloc to handle.

Extend the guard to guard against values that are too large for
kcalloc

Reported-by: syzbot+94d20db923b9f51be0df@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=94d20db923b9f51be0df
Tested-by: syzbot+94d20db923b9f51be0df@syzkaller.appspotmail.com
Fixes: 73f37068d540 ("ptp: support ptp physical/virtual clocks conversion")
Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
---
This can be reproduced by executing: 

echo x > /sys/devices/virtual/ptp/ptp0/max_vclocks

where x > KMALLOC_MAX_SIZE/(sizeof(int)) which computes to 1048576 on
my system

What would be a reasonable value for PTP_MAX_VCLOCKS_LIMIT?

KMALLOC_MAX_SIZE/(sizeof(int)) is the absolute max value for which the 
memory allocation won't fail

v1:
Link: https://lore.kernel.org/linux-mm/20250922170357.148588-1-viswanathiyyappan@gmail.com/

v2:
- Moved the validation to max_vclocks_store
Link: https://lore.kernel.org/netdev/20250923160622.8096-1-viswanathiyyappan@gmail.com/

v3:
- Removed RFC tag from the patch

 drivers/ptp/ptp_private.h | 1 +
 drivers/ptp/ptp_sysfs.c   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_private.h b/drivers/ptp/ptp_private.h
index b352df4cd3f9..f329263f33aa 100644
--- a/drivers/ptp/ptp_private.h
+++ b/drivers/ptp/ptp_private.h
@@ -22,6 +22,7 @@
 #define PTP_MAX_TIMESTAMPS 128
 #define PTP_BUF_TIMESTAMPS 30
 #define PTP_DEFAULT_MAX_VCLOCKS 20
+#define PTP_MAX_VCLOCKS_LIMIT (KMALLOC_MAX_SIZE/(sizeof(int)))
 #define PTP_MAX_CHANNELS 2048
 
 enum {
diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index 6b1b8f57cd95..200eaf500696 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -284,7 +284,7 @@ static ssize_t max_vclocks_store(struct device *dev,
 	size_t size;
 	u32 max;
 
-	if (kstrtou32(buf, 0, &max) || max == 0)
+	if (kstrtou32(buf, 0, &max) || max == 0 || max > PTP_MAX_VCLOCKS_LIMIT)
 		return -EINVAL;
 
 	if (max == ptp->max_vclocks)
-- 
2.47.3

