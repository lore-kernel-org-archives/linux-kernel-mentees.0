Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B3D2192E1
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 May 2025 21:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747864143; cv=none; b=fIAGCtXRXNGoyXc5bWZgfHjklptdY9TE9M6N0QkeiROlSv5qIMlMtwVYnMdCelnwEnY2Vajvctz6r9VdR1dmunnwoDG9vV3zNqX4R6uA3byIu99n5gvzAbzNanITEdIDaZpKCrWldjNmtS3zNTJoGRcvnM3Am30C4RT61gy3ZUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747864143; c=relaxed/simple;
	bh=v6oyws5czAbNgfpmZs07oRxCWMBQkASJkZzDQDtqUhM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dof+eTY6XOoItwrPk0Pl161kGCGwri/CRHAqwNmIikiHJjuio5Lm5Ub9V1tuYhjt0EANEKePv06SlYB/clHMG7WC0dFTZDPdBasUOtzL5yjmxSjERN7lZtyycndoR9x3vMvkvpY5BnwjlOoxc+u5WGg2m2cou7GwRJ86LCNdUHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gYEAmUYZ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gYEAmUYZ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-601aa44af77so8487892a12.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 21 May 2025 14:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747864140; x=1748468940; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E7XZXU0VEJ18cU2BxFX9o9WteQEjbnzJPBFFWBFf2cs=;
        b=gYEAmUYZqf8LmAXnK/ezDq/2NERHtHBI0DdPUmHPk8Pe9iQUUYGia/g+VN0TWOvZpk
         ROahkskqYFHL1Ccanlqzn+mBb8YdG10r1U3JJ6CxT9ynblbAf3xjFOuJ6LMK+wkEkxjI
         qZKOLemDf6B2VPH229rhPiQ7g/wXpIwLY7x6AQDqI0IOh+tv192xy+u0tsTa8v1ZMaRu
         EICZ1jU+3N73wwxJuJhlZq0iIf+1ceRH7p+ak3BOd6eW9waaOluWf8SmCoCZKzsFUn/E
         /aKrfA1ZSIfoDv/e3bXQ4hc8uPfmY6l8X2SCPNEvWtCuaNrojgEe/mEvtp11ha7eYV6a
         2Nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747864140; x=1748468940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7XZXU0VEJ18cU2BxFX9o9WteQEjbnzJPBFFWBFf2cs=;
        b=m6FOFY+wyKGAWMI02l+P9/nu5sG9LcW+YisagBc9SXiws2DhJeGyM1P2huXRCAKnnq
         o/KbYWIW8CSwaCQa6iULBOeQfb9NCdp+QC5oMwZVBBmOh+wZO1axCfItp6Jg3lEj9Eff
         Q4K+rSo6PrTYuqxpP5BO1qxNgtFh5LvNLkEIh5YNar7sDnm4NQPnery1+lGKqcIcD/lJ
         ux1IJO2jt1aJotr7DClt/G1IJGZOaE20qW3eEeey3xLaQvaiiB6XiGwKVRlKWYeRjTQr
         x1eGTTwo42nlSLXG7mOTDG3Wivo8Qu7VLi5FAvbnc11ybxZXfDaa7bN3NXPEB25nIxdc
         JSsA==
X-Forwarded-Encrypted: i=1; AJvYcCUkAZPw/oWEURdYDl0ALbXWl42vaXGAEO7Rlw1DlzTiW6KCYgSzwAXx/OrUN4hECFWKIth7W8Pd1MM5IJq0v/wNdZatOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrEW3EPjLAAJ88L3zezMozLh0LUfQVRWWgYkpEb2xz1wY3cpfC
	o6Pls55CZB11vMvs/pFN3EcRhHNM38/APmr+MBcJ7mLEmO29eiZ4h9s=
X-Gm-Gg: ASbGncsrTI9zV2+lxcB4L6Wwk5JCtDNzvSyzsRnM0fUrzAV+VBupbeRSZ+P7sdFYw4Z
	YPXhjRlTO8qUC6bdv3jTv8u1pYC34EE618irOT4DpxBuz/EtSWFGodd9IWdwM3bQZx7yGpXIcjv
	BuGTSdxcRE8BzZn7WYgAgwsjs7K1NvhzVlamWx4iQacxCcdAlLviIeqqxh7DGqb7/TthNR0XDRw
	PsnMiukZx5arIjjVMipNkopkSr/Zmkfm/WicxrcdrHbjg/79DpGaBjb+drjszF+gzLnhInpBJo5
	IroTifBUECHdNnKs68y7r+FbZzy7rGv29Y4eJq4X8s3gMPawf69sJR/XTYvskSZBCyDxE3GtQFv
	i
X-Google-Smtp-Source: AGHT+IEGpGKyn2SjbG73jckuIvkuAriIecmkA7h43Y5pgW3r7LcfmeLczUiVBIZTzZhCpPXrY3HTfw==
X-Received: by 2002:a17:907:d06:b0:ad2:1a60:f83b with SMTP id a640c23a62f3a-ad52d443a2amr2108668666b.11.1747864140348;
        Wed, 21 May 2025 14:49:00 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:157f:5941:a21f:c1c7:6140:7de5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d4cc5dbsm957451666b.169.2025.05.21.14.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 14:48:59 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH 1/1] usb: typec: tipd: fix typo in TPS_STATUS_HIGH_VOLAGE_WARNING macro
Date: Wed, 21 May 2025 23:48:51 +0200
Message-Id: <20250521214851.386796-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"VOLAGE" should become "VOLTAGE"

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 drivers/usb/typec/tipd/tps6598x.h | 2 +-
 drivers/usb/typec/tipd/trace.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tipd/tps6598x.h b/drivers/usb/typec/tipd/tps6598x.h
index 9b23e9017..cecb8d11d 100644
--- a/drivers/usb/typec/tipd/tps6598x.h
+++ b/drivers/usb/typec/tipd/tps6598x.h
@@ -27,7 +27,7 @@
 #define TPS_STATUS_OVERCURRENT		BIT(16)
 #define TPS_STATUS_GOTO_MIN_ACTIVE	BIT(26)
 #define TPS_STATUS_BIST			BIT(27)
-#define TPS_STATUS_HIGH_VOLAGE_WARNING	BIT(28)
+#define TPS_STATUS_HIGH_VOLTAGE_WARNING	BIT(28)
 #define TPS_STATUS_HIGH_LOW_VOLTAGE_WARNING BIT(29)
 
 #define TPS_STATUS_CONN_STATE_MASK		GENMASK(3, 1)
diff --git a/drivers/usb/typec/tipd/trace.h b/drivers/usb/typec/tipd/trace.h
index 0669cca12..bea383f2d 100644
--- a/drivers/usb/typec/tipd/trace.h
+++ b/drivers/usb/typec/tipd/trace.h
@@ -153,7 +153,7 @@
 		      { TPS_STATUS_OVERCURRENT,		"OVERCURRENT" }, \
 		      { TPS_STATUS_GOTO_MIN_ACTIVE,	"GOTO_MIN_ACTIVE" }, \
 		      { TPS_STATUS_BIST,		"BIST" }, \
-		      { TPS_STATUS_HIGH_VOLAGE_WARNING,	"HIGH_VOLAGE_WARNING" }, \
+		      { TPS_STATUS_HIGH_VOLTAGE_WARNING,	"HIGH_VOLTAGE_WARNING" }, \
 		      { TPS_STATUS_HIGH_LOW_VOLTAGE_WARNING, "HIGH_LOW_VOLTAGE_WARNING" })
 
 #define show_tps25750_status_flags(flags) \
-- 
2.39.5

