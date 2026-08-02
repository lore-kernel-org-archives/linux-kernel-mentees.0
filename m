Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4CF3C07A
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  2 Aug 2026 01:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785635417; cv=none; b=lYsbqX1IQWlRZtE2g9POcN+moAJ1MLHJQ09Yxbc15bPRO7mdNVwimiG06bpgeW/9McmZPS0NKYB+cye4wiGx2+x8E8xJEVph42RXt581WBDqW2s1BDj27I8Qyt6uaWiVXFBdYC589oK58oUXTbJCCJo8Tt/KZa0pn41yyNfPJBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785635417; c=relaxed/simple;
	bh=cCSwyeq+bUMJ6dCQDoQQXmGMX8EYf/2AqJF/E3NlKf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RYP+mPDLMBkJkIBPQ76wHO0pZ5cOHFSj/8jnpU4iFC20Iwu0V6MyU1HMjcG0u+lQ0m/cf8/LbNOY7NpONT75wyWXpISsODxeXArjJMHJteBzhsVQ0APxBQhtYG3W3fhZi2YzQCIg04+FqmRA9+udIWBMOfrLmWI6vYRSEf6UMQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3DgcIe4; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3DgcIe4"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cbb85186d43so1042470a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 01 Aug 2026 18:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785635416; x=1786240216; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z6NQeJkM6li/nOFCtSkjFCccdUvQQ23178ESjFjKpj4=;
        b=n3DgcIe4WPNZaUWI2IoyOeLs58pAg4EFq+iBUEnREJW11UyEZEnHFCsB4pq7nqZLK7
         XxeN2jclgh8qj1UAbCnN2T0/NY1JV3nuK410LM8Iu+S01MenmdHjcpIl6QI9OHRBxNWo
         yIaDqgbZ1Z/zsR4Ja3ojx/KflCrl5pyWx2TKKkG03mT1puGmAbkNSL/UbYGJwZKTbjsP
         F7Ediv4qlNokRs2u8Uxb6yHwEYa1ogBTR2Sn+hBNmG5AVUR+c2TxIiSt/ptBf0h5FXdS
         Bl6Os5cE0W06fGI5WzhKJkch6fgzW4OYwMYfam9NmXu+qakl4auKs75pOrrZf/xX/OL/
         JCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785635416; x=1786240216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6NQeJkM6li/nOFCtSkjFCccdUvQQ23178ESjFjKpj4=;
        b=rKR7Jc/aLsetddoCU70FF7hdRi8LdYAnPNK1iyHzHj9gnYbHMZDYtrYz7Y2sfrLhhd
         1oJCzmMcFmFPnyrxk0RZOKjIWBfaTT/QDZqmq6SA6u/GJl42ggc0GePV7JvN4TlPDlw5
         FcFxEKItKAVcjeyZlPTh0kwl2jX8rdiYF3vtr4NMTbFidXKoe4/Y6o4tdtRm1E2naAH5
         aRMKsfMBDgkb/lzfPg3YqmmsjPcafAEwI/pXNJ8echrqyE4RaZahfGAc3RahLA/hIT1P
         rxH69fdjR87Tamgoph1AjC8mSxZquz2Pk9diWWO1A750L48vQw/5F9uSlXLlEzk/mKvt
         oB5w==
X-Gm-Message-State: AOJu0YxTSFJW92OkaYKrUGOnDc4gze0WNHo+Nc2tZ8iG6yOSAtotqoIA
	IMnZKhgNAfLCzg1yNpNpI/CHLV5hX8BE5onL7DoBVYrrHuwrJZYrnK3N
X-Gm-Gg: AR+sD12qpxnOVGpcaxd5B2xTxUtV/PJ9JlpWb92cnTMvDEptQJzgeuDJTLbhWDNOSOi
	ghYC6/B2nNQdKZpuYL08dM/iz/FiuQpMJFsdAPgQ0aGDlvm0Dcze+JBWiauQMDr07qqABB2zU8Z
	lKjCnpidSdamwwYwqM3T1KeJ5vCIrfUTX+10plzTa2mOnaBEDe4LXOkBmgVcWYQnS9HfQMa1DCE
	WF9TdlTAuQoHB3AJNCh6iviUffPv1Vq0U2XAz12Bb25QXck+wnwut4SORsnFeIa1nQbj/+bnwL4
	2uWkydY3h43FcmlcVoIa0/g/Ohe4+7yfRbkhH6qUqkeNS+JEbCU/l3qGNsy7NbwnX/nQoUVgmqv
	CkLVzXue68ND0ozEGVYJsvIaQ29Dyfohmeswu7FGoAxHo2mSjYBxlA9Y7pbEsz8RyBjP7tPmnZM
	q5cgdPtz4dW1E3ZJE702r0z0wVjXHgq5ZOQpO8fGHg5K4+EyzaisnF9UdTq1c0WdD30L5qOqQ1q
	UIY87pX3aLXBGIMthF80SAX6uh3BAhtxnI76njg2PCwzC+mXtxJPQNihPEJlg==
X-Received: by 2002:a05:6a21:3086:b0:3c3:6544:6083 with SMTP id adf61e73a8af0-3c92a276a70mr5047352637.0.1785635415638;
        Sat, 01 Aug 2026 18:50:15 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e1886e7sm24654675eec.26.2026.08.01.18.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 18:50:15 -0700 (PDT)
From: Adi Nata <adinata.softwareengineer@gmail.com>
To: lorenzo@kernel.org,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Adi Nata <adinata.softwareengineer@gmail.com>
Subject: [PATCH] iio: humidity: hts221: Fix checkpatch symbolic perms warning
Date: Sun,  2 Aug 2026 09:49:45 +0800
Message-ID: <20260802014945.17221-1-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch warning:

WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
+static IIO_DEVICE_ATTR(in_humidity_oversampling_ratio_available, S_IRUGO,

WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
+static IIO_DEVICE_ATTR(in_temp_oversampling_ratio_available, S_IRUGO,

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 drivers/iio/humidity/hts221_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/humidity/hts221_core.c b/drivers/iio/humidity/hts221_core.c
index bfeb0a60d3af..bad98da100bd 100644
--- a/drivers/iio/humidity/hts221_core.c
+++ b/drivers/iio/humidity/hts221_core.c
@@ -521,9 +521,9 @@ static int hts221_validate_trigger(struct iio_dev *iio_dev,
 	return hw->trig == trig ? 0 : -EINVAL;
 }
 
-static IIO_DEVICE_ATTR(in_humidity_oversampling_ratio_available, S_IRUGO,
+static IIO_DEVICE_ATTR(in_humidity_oversampling_ratio_available, 0444,
 		       hts221_sysfs_rh_oversampling_avail, NULL, 0);
-static IIO_DEVICE_ATTR(in_temp_oversampling_ratio_available, S_IRUGO,
+static IIO_DEVICE_ATTR(in_temp_oversampling_ratio_available, 0444,
 		       hts221_sysfs_temp_oversampling_avail, NULL, 0);
 static IIO_DEV_ATTR_SAMP_FREQ_AVAIL(hts221_sysfs_sampling_freq);
 
-- 
2.47.3

