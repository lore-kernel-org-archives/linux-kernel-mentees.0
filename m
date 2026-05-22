Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D283BCD32
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 12:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453272; cv=none; b=lqWTW3F9+y+sCF8CRqPm+JdgP+PXZjxPvKs8usw2UCENHklPW5wz+cwL0mVdAOlzFJJcGwq4EDhkc65MsHBm+7lPjom5GWXdtCbDwQIct5YK2TXHCnhuPxY4hY/+ZaYoaVUQWVMFiHhTMzrFVxZ0Xc4wmRDNmFzD8X9r1l0DO/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453272; c=relaxed/simple;
	bh=HNVQB1Sx2eQiNy7XgLEbGRhcVanUAKDqdo7tkqRq+NY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HaCjyPs/jtDGgohnpQdWS/kVVIn7uyEWAGIx1KbD3HY39gcyOSmxmQA/FZ2o9fPP/09RBs3G3+OYsT+NlRXRZ2sF00SlcjOC+9ko9lFJaEXwhpzxBrymcJSjwpyZ0xxhTEaisxTPgk51Xm+mW9EwYaLSYgbyhZMRFk3GSA9rEEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ld1r2i0g; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ld1r2i0g"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so56632815e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 05:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779453268; x=1780058068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMlIJr0UEjBMHNhPJ63udc9c/uXuEqSnqN9pM/ii/fY=;
        b=Ld1r2i0gAtqYOCxRzvESCWvDT9jy6RrlN0CyXITmfU6zV3HVbqC1xKLmAXiLbNJCi3
         9i8VXkvhm692PoaPlRemfAKtxig7SDluQjWqC3DvQJOfO5ShMxrglTj2pLE/7qKM5HEO
         UpKP1NdtGeQJstmN51aAARmtyFcxLYvhJwDVwnpvMdJn/h/qj97dmGQgoGTgorMNhxl7
         yRFYzur0nbul0vu01B57IChiDSjlMa4h7yKrayAVPr/0hT2C9wpk5K1LI/Xb8EJGRT9I
         c0hsqDDA15v2L3v0pGmdmoreC0JnH+z6eboQG37Nqfbew40vYKXtf/bd4H6jeJp22Pzo
         xhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779453268; x=1780058068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vMlIJr0UEjBMHNhPJ63udc9c/uXuEqSnqN9pM/ii/fY=;
        b=qymJK1K92kJRxcpNPvWi3bYmAHkRzT4cwzpsv+e7tluRyBm38jP/SXU3nt0dkwodGB
         PH1Fi2vokN9VptySxFp3PX4nIXU5DkR8W23/u9OSS1KMWGZskr12XRfXkyPfT1AN7Rlm
         jxs17Dy/OgULA4EbddeEEauNtiTbx0j5isZBcAOT/cDtLuiimfag5+egKbo+rTqI7eim
         J3oCOL3M69EhtSFj6xzEDcGMo0JlqsmAmf6ThA7zd3LHe8qVx1O5I3YB+u2D7g/8tU/W
         aGIxxrRMtMiJ8fakbhIZ3oE0FnwrLzoaxu1NgoCv94ZtXSXqYuH6aZcPZE6pklPXYLFP
         jGvA==
X-Forwarded-Encrypted: i=1; AFNElJ9wUQRezycgwfDs76tP2m0gdUKg7dcT+J3C3ch0JfuZeYWvvbdClf3iFgVEcZxb8wmkTlo0zLlww0FZaTFxcReoKNeg/A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/sMgYF35mhx6UqrUhYEWOEMEbdt0usjZgQWHTTsBqJP7DhfIi
	16yDhQV1pS6oPOCLj4ABQX7e63FUQuu/ghUq9dRPn6yYMjoBk7oqON//
X-Gm-Gg: Acq92OFF/j12V5DTMY0r63DpSmuVVplk5vCbm7UsztR4+3lrRLJtlGohWR7g8v5BPOO
	q5Nuw9mn9WIdzInqtHZOyA2SDAhGMJB4S6j82Ofc/8T7bi1m25ZncSo7eXp7yxJYAoRlU13ukc1
	prP/c78PFyqEloPDsMZoT/dA2qMPbcLDED5W16kFdhqNBh/ixGM/nPoq5iwxAwLktxvwi8DHXnn
	pdVoL7jrKp33ZNNeYYr+FT6xJ+PTW/3UaUtXKR3QwKvf06PzId2Er5gAlDChkxbYHTB+Qd+Itsk
	fTf9izjuwqqFCHj79tmGQJdi1K+i9fexlwk/bK0PxuPky/A1EdD/nGpndJoIId5WLgFE44iIFlj
	uuk6M0/QksAlvDxVz+mmVoNWvCN0DoQ54ZwKOOD1cGA2STIXnG467UFE5hvj0KDv0kiJ4e8cUCg
	4z8gFhvym2lwUb9rFHzQOw9G2gWnE+TFmi+58qveCj1k/3O/j3mzY6MRzv8wUT2K4=
X-Received: by 2002:a05:600c:4ecc:b0:48f:e249:4094 with SMTP id 5b1f17b1804b1-490426d4bf0mr45733275e9.18.1779453267839;
        Fri, 22 May 2026 05:34:27 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042af0ac1sm14760175e9.31.2026.05.22.05.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:34:27 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	shuah@kernel.org,
	joshua.crofts1@gmail.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 6/8] iio: tcs3472: use local struct device * for remaining cases
Date: Fri, 22 May 2026 14:34:17 +0200
Message-ID: <20260522123420.45495-7-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522123420.45495-1-aldocontelk@gmail.com>
References: <20260522123420.45495-1-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the local 'struct device *dev' variable introduced for the devm
calls also for the dev_info() calls in tcs3472_probe(), to keep the
probe function consistent.

No functional change.

Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
v3:
- New patch

 drivers/iio/light/tcs3472.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
index 4966abf83c18..f74e6633db45 100644
--- a/drivers/iio/light/tcs3472.c
+++ b/drivers/iio/light/tcs3472.c
@@ -480,9 +480,9 @@ static int tcs3472_probe(struct i2c_client *client)
 		return ret;
 
 	if (ret == 0x44)
-		dev_info(&client->dev, "TCS34721/34725 found\n");
+		dev_info(dev, "TCS34721/34725 found\n");
 	else if (ret == 0x4d)
-		dev_info(&client->dev, "TCS34723/34727 found\n");
+		dev_info(dev, "TCS34723/34727 found\n");
 	else
 		return -ENODEV;
 
-- 
2.54.0

