Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87A95012A7
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 10:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676448; cv=none; b=uIa3wuSBfNSYOrc855bHvwgXgNJzh4Quo/TIEG8jGr5FZZ0FKDGvoVr47Udw8mW0zcT8gUBTD2B5dOQnPDKm7qKhXYEj6iaDHy6GB/MdydVRWGcKvskqtAj+j1hzEEsheNOsmZcBpRbGKV+axJI0gSCfrUle9C9e6nnWLSL0xp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676448; c=relaxed/simple;
	bh=KJFLEZ1v4mTD+m/l/3qSuOzDumZPPFtC6lZTh/jPfDs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oNb+eVMN6jXcC9j3bP/tlRk/6fXf9nQIbqD0BZcjCQWKfp1Qs3vAAAkfht3Tk3yPG5tlDSa3hUM8NgIzC5Rj9qAfI7sb3GGvMm9i76a3sOGNG0Wlhzp+h6pekLOALGBlsZg/0W4zZ8WqRq+TGui/JH3MR1BA5e10IvY5SrrkA+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gp6lF/H1; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gp6lF/H1"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd046b87so2859907c88.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 29 Sep 2026 03:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790676443; x=1791281243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mMSM/kY1l4Gzn1BlIvdJFdJREWDCkpXwh6FxH2SOcxI=;
        b=Gp6lF/H13d5TaDgGGG3tdysvxiKKNOIAnecaF6wqJ12y42hSzCS3gEF+tSsHLMZN7D
         y0VbvaJqNELeFKLnQ3LEvXR4aD7NjV5fDv9N44zzfnweE9t/XSczcpRIuJbdRbwzHU8V
         WPeDkRnYmFpxCwFo52srETqLY8yjPPV8rvjUNkHqLcM5H49c5PIQaauc9/hQfAHR2zOv
         sQS8QOo+ZRms92hd2/+hUXUpSwnQdZZtCnZ8KbK/jq01AOckdH6bLM3rAoC9NAyQXP1v
         9bKMHIdJiKbqrzbmsB/PZO/JqpSKoK/segemqsz5yKLJQKa7rXymbxz4GBWf5XMY8L2e
         21Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676443; x=1791281243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mMSM/kY1l4Gzn1BlIvdJFdJREWDCkpXwh6FxH2SOcxI=;
        b=pCJ309WgqsbiX/PfZh1tqlYtAVecoFmpQzT3aaJxtzSsRXdBDRF9Oo+hhvicB8jSSM
         X+04H9N+2dVMuwF0w7Op8Wp/hIKoIUatVgzLxde5X8tCgISNFAGKFOhN3rr/zhepFCNS
         5L2qM2iJgSJ57faGKoAKHCgGTOzyyme+pVQqliSshDa27ewPwxoj2ZlTXKwfO2ULrAla
         mj6rqKfgXUl1NGgAKi+zaAypF85Kavv7aXOxdX5N4eU/uMvCDXrnH7ZX9N74w7QF3wYE
         bXsImXyvMe0DkCveDGBrmTTqJRjM/JsC5lIayxBBXpS2I6OaiY5YMllfETapgSKnFAt9
         vL5w==
X-Forwarded-Encrypted: i=1; AKwUvBwyVx+Dfu+1KhMbWq0Ume+5EVFoftjabyj4tk7IYnYh/FrznR3A4USxyZDcJ6kpDr19wL+SDbePU3Emrp6T1CXl/4WUWw==@lists.linux.dev
X-Gm-Message-State: AFuF++k3B3wKxhiDfnbd8odpZo9XKsvwYLW+oErJ1v/QWYpep4ENwfzO
	4w3doHnCQ0XKpcIH5cExrz7bq/Gt/YKtTaiu4/bm5quxjObRtPlo8tD8
X-Gm-Gg: AYBFou0HUfuFxHajNoOGqiyRSspof5yFRo8XiVkxoilXr9rIqi3lOWJttlSPJAaZG5A
	cAZ1Q5YllMWxleBw0mCZ46oVZ1s4Pw23Wdgozn48+Zj0ToHTMHWumSNpf0+7RULxTzZCpXy5x8T
	R14xQoCUXzcNrkpjMOO3IkVSZVQ0sLiT8YZ70RJ1aohlUUZJ7Ej8E8rllFB2DSjcJq23cGvTzKV
	fiEhEI9WKFJNGdPemetY6MKwyELSM9EULso4K0uIrpLDY5kwg6mIS1qu1JvzfdTB7orOD77YVC0
	j1Zd7hypOq0UMemdh1oun4ITooNIRJchrRO4vCGbu7mLZRzhtptCzBFG6kW7nB6PCLng8EQ8Xwi
	BLYFoDK9v0+BSBvuZ5TF5jPp/O820d44t/GXikesztuy3Gbq3LD9R4RTJHRGJhRoVmyJXWBsQRZ
	8aM93RAdsSuYvT1qV143MwAFN3RT67vU4ITez7/T+nDdw+RgpK2AHutxpS7Q==
X-Received: by 2002:a05:7022:289:b0:14a:33d:f581 with SMTP id a92af1059eb24-14a033df628mr5250637c88.22.1790676442638;
        Tue, 29 Sep 2026 03:07:22 -0700 (PDT)
Received: from evangelion-g ([2a09:bac5:40e4:11cd::1c6:2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34141a4a5ecsm36445307eec.3.2026.09.29.03.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:07:22 -0700 (PDT)
From: Ayush Yaduvanshi <ayush37735@gmail.com>
To: Edward Cree <ecree.xilinx@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-net-drivers@amd.com,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev,
	Ayush Yaduvanshi <ayush37735@gmail.com>
Subject: [PATCH net-next] sfc: siena: fix kernel-doc description for efx_ptp_timeset
Date: Tue, 29 Sep 2026 15:36:24 +0530
Message-ID: <20260929100625.50380-1-ayush37735@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove excess @valid struct member description from

efx_ptp_timeset.

Signed-off-by: Ayush Yaduvanshi <ayush37735@gmail.com>
---
 drivers/net/ethernet/sfc/siena/ptp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/siena/ptp.c b/drivers/net/ethernet/sfc/siena/ptp.c
index 0b723a127364..d643e41ae773 100644
--- a/drivers/net/ethernet/sfc/siena/ptp.c
+++ b/drivers/net/ethernet/sfc/siena/ptp.c
@@ -196,7 +196,6 @@ struct efx_ptp_event_rx {
  * @wait: Number of NIC clock ticks between hardware timestamp being read and
  *          host end time being seen
  * @window: Difference of host_end and host_start
- * @valid: Whether this timeset is valid
  */
 struct efx_ptp_timeset {
 	u32 host_start;
-- 
2.53.0

