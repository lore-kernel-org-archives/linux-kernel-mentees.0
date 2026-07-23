Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DBD47A87A
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Jul 2026 16:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784823557; cv=none; b=HUX69LNOTJeUK6FtClVE5MSAvMUePH8fpGkl5/s+gwzS4IexiykFfEOBL4m+QZz5WHJFgR1qvs6/FzuJuTQrJXR8SWEfg++YOj3QOisQ/6B3KXMEjQ4GNdst+CcCBVkl/EzJmuipqA6jRIyxma85xivc2QZbmzDFtOZIwjzJzFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784823557; c=relaxed/simple;
	bh=ig76kvL9psH3DE91fqVWlMTnKGxSch2e5BZbLuGTwtw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l5wPlpiia2VrAlT9w5nFPTA/G5tEDP/jfYHR7A4tsk129lEtqFaHkinrfw3AhxxJ1zaKRp1GrU6MDsZy+2ge4sjvjCsX6ujBxc8ZASGzNQ0Fe4XDunOiVyPlxUP6nX/nCfbZD4sB5d7H/gRP/9fgd78U7sR3EjP/dnKYFPIlAnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F4NgWNqL; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F4NgWNqL"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso690182a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 23 Jul 2026 09:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784823550; x=1785428350; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lWik9mcOvPSWmwo9ZWauI742Oayf/83cjlLhW4ZICxA=;
        b=F4NgWNqL3XrgT7gkkWhhsFhDv9w6/8YP6weH/JD4yKSoiosfh0H2Cp641UZVQbRFdM
         QAY1ZVuYLhF51zCOs3s/3tGKwZEs0l1WekmGw2HdJ/QAUAtdCPgpYesh5n+U+GRcTBIO
         vJqRq00/thzINILwykySHCjtgNKgdOJjjBQ+bdaXqTnD6wGbyDydneG1OMdu4vpIxS1R
         8ClfS/fIb6OfakiimH0Hn0DZp0388RmXbXoIU0LNf6zi3ZLOsSP4m5+XIOgvAwTElIAZ
         9SUrXy9QEszsC4ULWQ3NkzKJjjhAXLK70R2Ixv3bb6ITvCFt8LttSRscvcTpyPliI3Ty
         b5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784823550; x=1785428350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lWik9mcOvPSWmwo9ZWauI742Oayf/83cjlLhW4ZICxA=;
        b=TxUTUrcllpUd0+UhJHGEU/eSRtcDzOj//XkGOJNFkCsGTuOnJ6MlluBYMBi9I23DZl
         0a19jyR/J8HYRiHpjO2zgoTWjfCNKitHEo6dWKASoY0REqWMT00dqE28g5dn3ofK+s4/
         WsGxyMboS3b5DmISqjGyJwVTqCLMUiWafcQM6CwYtarUwoGrbYFeAOZxL1C2xiGz35R0
         OeqmLadmsaZe/V/lvC2vZ2QcoGWXXqTwjdw0ShB+zN0hp9quiFf7R+Hkfh60+V/10+8n
         2rBXqQYMevcnZTaKjXi6r+oaAYvP/EVwEQwe6Npz9Pgbe5GMW2GvI+Xzg9j5tFk4EvrL
         aXBQ==
X-Gm-Message-State: AOJu0Yxqcbmp+uXj+++XUBVmrzzsrbGGo7k9AQJj6CSKyxK8pS2T6855
	gfpMoPA1GqM8X7SZl47uomzUkKnuYN8yquu+1WGrWS9WaijJZPLszyLh
X-Gm-Gg: AR+sD12iCUo1M8FLwMJ1gx+TtnM1nY3R/aelFnmTdZIpfMmBLik1r1vWFt6T5Cv3z/h
	uut8H7TF9jUmrcLwkYnaF1+1/rTETUUt+ywZgnhFRYQwmHoC9Tb8NznYLzk3WxXnqrGYjoueiFa
	0VpI8LLpUd2cfgxjD38PB6fECNBRzxo8EwSUYETdkFz2KgXHBne5kNzv/+Ya7YAnlb5lBfvdMi3
	aQizKNcmr5tufIUn752bvACB1AGzgFi0M6sDzX+MVyzYAo0XfbgbrAZdRVFxPN87WdXaMYAcFkf
	i2Na5n3w6IHQJXv/uyNdYVgeEX8zNQY7r4jRa8q3+5acC64W+0TeNSJCCcGkSJaE653De////Ci
	YZxvKJa6DTN7hJkT2P9lSSdTfEQz7WJ86Tjx0j4ItzdxtaWKk2wBU4ajwP3dyLRjNc973LTyFCj
	2EBNeFnXGkpgv7fQ3ut8m3Zk0a04mFKLqjC2Zmy10m+459xYWfYOVdI1e5ZGtXKmg6oAuXSqVAp
	QM=
X-Received: by 2002:a17:90b:1642:b0:37f:f4ae:5f25 with SMTP id 98e67ed59e1d1-38ec6a51c61mr3504827a91.20.1784823550345;
        Thu, 23 Jul 2026 09:19:10 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ea47f4d31sm1910241a91.1.2026.07.23.09.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:19:09 -0700 (PDT)
From: Adi Nata <adinata.softwareengineer@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	u.kleine-koenig@baylibre.com,
	email@sirat.me,
	krzysztof.kozlowski@oss.qualcomm.com,
	mazziesaccount@gmail.com,
	adinata.softwareengineer@gmail.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] [PATCH] iio: chemical: sgp30: cleanup codestyle warning
Date: Fri, 24 Jul 2026 00:18:49 +0800
Message-ID: <20260723161851.21722-1-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch:
FILE: drivers/iio/chemical/sgp30.c
WARNING: Prefer __packed over __attribute__((__packed__))
+} __attribute__((__packed__));

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 drivers/iio/chemical/sgp30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/chemical/sgp30.c b/drivers/iio/chemical/sgp30.c
index f10bbebc29e4..c33592a1e0c9 100644
--- a/drivers/iio/chemical/sgp30.c
+++ b/drivers/iio/chemical/sgp30.c
@@ -82,7 +82,7 @@ struct sgp_version {
 struct sgp_crc_word {
 	__be16 value;
 	u8 crc8;
-} __attribute__((__packed__));
+} __packed;
 
 union sgp_reading {
 	u8 start;
-- 
2.47.3

