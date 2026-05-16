Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22333E3C60
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 May 2026 15:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778945033; cv=none; b=MYT6glStj3ySTpjIhApUNexuv/kc36oYUwo0RzY/hTqeHGjvBDPKnkFfF+C6vaZ1vQKBrOHmHFKGyJNZvlox2xl2NVDnnb57y3psQlhsNETE/PQDBWkUDX3dGajZxFsBOZtJfZ6nEvYMCc4aNhblXJ0CnVrSu198m0UH/UnNuK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778945033; c=relaxed/simple;
	bh=4yj2+aZhJwSDPYMZeTnCB0Y62AmfW8gQ5CSgLzCMCCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Btj5AZkGiZIYK1CYySY+eP/VMQsvEuPwnRjMRsp+nP/wBRwuKsnjKPzwERDZvIJGeChWjWkRn31EfM1KlY41Y0B8ad7gJHI2d8e+FGeIhYIZO9N4rWFJRZUr/qb7DlscvBesYWkF6pzpYSDB/pO8do0boEDb3Vt318J0ZsUGIaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GDEFDHR8; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDEFDHR8"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso290346a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 16 May 2026 08:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778945031; x=1779549831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BMSAU0/i2Bq1LOGi6eUSuoT4IlBYSFYcL23EMvbCK2o=;
        b=GDEFDHR8kc42jaU69WwrSnm7O9PzmHQ5ZL4kdegj6IfkPcsXHqsex4GXYoLNutPq68
         d1ZmnehYToEO3Jc6zcLGgExfSGtUBw+P+3jsk/ZuC6IZ0bYzV5u2h6W6LE3GjYk/Dmjt
         l8GyP4C/JTJAExqJz2hy6nPf098V762gv+9BoQR4N0NmoGs+zrIJ0Im5Qbbg/asfle8d
         H8KZaIHo6Zl4WmPz2vwrjOVxUhsSVlKbZyX07vafBFAo2vtqNxtahoTRN93b1G4ldmXU
         hp5SK1WwpA0x16wJErshbEH5LwN/ec06jD45gttI8Ax14mA5NggKdMMZVFSaPlY1ZoSV
         6Xvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778945031; x=1779549831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMSAU0/i2Bq1LOGi6eUSuoT4IlBYSFYcL23EMvbCK2o=;
        b=ZxdSqhPu4wSKtqhqgUBsBFK/wqZFoF1V5RuPtSlRB5D1r7sVw1+HtIMXTCqa5VwIq9
         h9S/fO6G/z1NbsnHE1PfdNWKEa8So2A6eLuj6HdkMigfeF6+nx0EJWuKMXtfAg5o7PWl
         swlnVv13BO9zRFQvLX+ga1jBet2y9vxqcHzDX5yGZl5L9+WD3USqgRxRuuxtpiNdjYlZ
         RHfEkwZRt7Vn5oNIpdjj3hb2Fw8S0N7IPQSuS/T0wt7/3ZaSWFhcFTTZb1OzqIFiYtpO
         WwLuVCA4HFXWnp50IF4uX70qGutlgMRxbUIDDxGjAE1fecbfCUPXMoPHX/wUX7eud+rZ
         TT+Q==
X-Forwarded-Encrypted: i=1; AFNElJ+HKgrbkcCWAXmI9U952jEJAbZK3UoIc10o4Nyj0ItPMmlcf7K9RIDGtUPG/HslCVYDGf2Jwcr6MpiNE+wqjdZgJqVA0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKokIN509wYXrxyMUaUX0sbKnl//rrWNPyZPRgsvb/yATBwcWB
	7HD0jNuZpJtoFpPrQdtU6qHCsQAis9rOfrr5hJNM5VtuhBXa2cg83jA=
X-Gm-Gg: Acq92OHoDW8LPiltSQOgWXOW/EYxXoYhLJ/uGkL+QeXAqAkAJ8wvi65gnUwf8AB1C3k
	O/f3Puv3qdDP2cHrYJnhIqGGyfLNCw0JQYZWAdGHM+G3pX/wIpx4ZWmb5Qj8lmTh0cZQSmUIV9F
	B5kebZ4LEoifqlnBw4aQUE7DbT3CaIpY557UideBwN8YwRqH4baNgpLHNfUk0G1dswQ5YNFneIT
	Z/jhFTDE2SQcGqCKQJkVsyE79KNsXK96dW8P+2V+RKCp48aekayJfz8YJ7DQQXEWeWq7JEX5K2B
	eCRUZ3HbDhtgdDuxjAW5Sm9uPHJD8Vl3TODEXDCYZAcizGDZmwDyLgl1yIu3TIi4X16KMux6Xl1
	ilzOGXNqpd8ThEYahHWn/Bwap+qAmDbUSH8RpAIAafLPyCDFr/GtqQ1yFrJ3l6DYZrqjp+4Ihjj
	RP0yQIsQUTIFVdf+lj2Jjdsama4LDrNgvSd5LiX9wkdQ==
X-Received: by 2002:a05:6a20:12ce:b0:3a0:bc61:62e5 with SMTP id adf61e73a8af0-3b22ee0239dmr11096033637.44.1778945031334;
        Sat, 16 May 2026 08:23:51 -0700 (PDT)
Received: from localhost.localdomain ([1.232.225.242])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb06875bsm8438364a12.3.2026.05.16.08.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:23:50 -0700 (PDT)
From: Jinseok Kim <always.starving0@gmail.com>
To: amitk@kernel.org,
	thara.gopinath@gmail.com,
	rafael@kernel.org,
	daniel.lezcano@kernel.org
Cc: rui.zhang@intel.com,
	lukasz.luba@arm.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] drivers: qcom: fix typo in comment
Date: Sun, 17 May 2026 00:23:16 +0900
Message-ID: <20260516152324.1863-1-always.starving0@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in the struct tsens_irq_data comment.
Replace "uppper" with "upper".

Signed-off-by: Jinseok Kim <always.starving0@gmail.com>
---
 drivers/thermal/qcom/tsens.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index a2422ebee816..5e19c7588e03 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -27,7 +27,7 @@
  * @up_viol:        upper threshold violated
  * @up_thresh:      upper threshold temperature value
  * @up_irq_mask:    mask register for upper threshold irqs
- * @up_irq_clear:   clear register for uppper threshold irqs
+ * @up_irq_clear:   clear register for upper threshold irqs
  * @low_viol:       lower threshold violated
  * @low_thresh:     lower threshold temperature value
  * @low_irq_mask:   mask register for lower threshold irqs
--
2.43.0
