Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372321F3B8A
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  2 Aug 2026 02:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785639124; cv=none; b=YO54VeImxfom7DSgcrwT+u1O+iTC9LdMPpPc/aev3YzVmE2ao8DczpKSq01aCn3nzbUAamJna+Z8C/ABaYxzBCHZ0K4nOWzDYM8Yx6R0QPLdPPA7St40ZPAP5ORcK4Xz9brh3Jjv+da4UZmNnXnjuBibxWbG34ddurmUFJH5AXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785639124; c=relaxed/simple;
	bh=UPRI0r3DoBTzPZT1PoU35E3d26DOutcvNUNGRfbh7TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OoMpqKv/dJR0MnJRP0jYsZR6z8BXJDPjBdb9Lk3oV6grNjNgObi3ylQpAIG2f003TGeoCnCy0GJrGHT6dlM2Dy6zk7BHeKAL4asFL6Lj4XXdMNmLPrJfkpkLltr6aLzx3Th02WrFXWJZaz+QdPU23qAgR73EXUI8aUyXf+kXPdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a2m/52Iy; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a2m/52Iy"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so2086134a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 01 Aug 2026 19:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785639122; x=1786243922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=elZkS/aYURa0ZPHqh1a/2YjlLP3po0YPtp2jV5sHCWw=;
        b=a2m/52IydXPjIzAyqboOq7q7Zaqke9VhOVTdj5a0sSyaYpNSJ9H9muS8DSspCzdhaP
         uRhL75ahgxRY5ZlKRAPJc7Z5I06U6NqRAaLJPIUlblinNAXDoRLedGJptfxQU18yY/6E
         6hYH0Xuk8w8ncDpeQ9hbbCOHEZxbzhIka0v8XWhy4OVY9P/iKBh859H0d/qKgic4xQoe
         N0Za2k9C2t9reh6fBOXaTJbfH3GFw1tdoClhdM9RdEDzh2E8uwxpvHfZaOzQnLJOiDy1
         A+huO3HZI5B1cT8AWJ//pnutElSf/t025m5P9O89IhGNkiKq4163ctG4fhMG0FJbAhsy
         cFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785639122; x=1786243922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=elZkS/aYURa0ZPHqh1a/2YjlLP3po0YPtp2jV5sHCWw=;
        b=K5eHtmECkL3i9dbFlkFjVKvNeL3ybIkNqWdOU4HmHzMs5t2RRmany+91LH3gWzniSh
         p40WWYhV/Y+h93JbWuIBnF8Ix1vU96FOv4BLHyXjs+Uc/VEyHsTqM1dVC8Bc8pjMxmh3
         5XTjgHmoAPgALW5EQiFcDC1WlNbD1MkLZdOZfrU+02G2mhAJmpw6igePdVwCFi8uM5Dy
         HaHKjyLhXwoDFoGE0uRTn+xtDv4Blbwz7K8O6WzrUo2e2bNnXoi6pZGvGBHrEfA19WOF
         CEF5/0SF4+ta7u6cUtQA6h4ZtFweTJEyShMNk8PPUKlJvELtAjsaSYePlXdjl2LKScjG
         Nlog==
X-Gm-Message-State: AOJu0YwAcIQsku1g42cCF7z5PR2Te+HjYaM4Pgd11Rhi4agf0NEM0MUj
	t6S/eIm+f/AavL6G+NjzE4pWJZ6aJ8vDFtqzRdMq8/PkPmt1bk3TjG6F
X-Gm-Gg: AR+sD11qO8FGW3vNfiBX83Shgw5kutc20ze3cKgGmOsOKV6DaGz11soIqrZV35lyXa9
	PfbkpqamYvVNJZIVYlhBUuFkEbm1J+C0WsegErqxIf/v6gdcMGDMYPXorUYgbcmns7pIpswjblf
	wVtpl3leHckt51tSPmHIt8/kLELQxTFvo/2eYL013V76ZI8eJLBPLvrlmMsKEQGt8LFqB7rKwXW
	dmirBwMZeVLL4B8/eX0MkvxyureRZr/+7qsgXFVS2tk6isQ2plXe9uOgzgnRZ72WLZ9iioT1sDY
	tWO9kzX35k349dhzywGPD2ErXTeAYhsScxD663xsG7/Og4oW3qPl7TUU1HBloYN3eiWM+oj5wSf
	WIE+BUFgxCPicodcbOdXlEz1sSv/IxQEa4Wqv+v/L6jK+HMqkQyOkpRHjnk3seNfUIRFNqw2hwe
	tkl5dOFra5Ee3BwPKRkxNGpuyvxmJi8ahVzRB4oFeHYKjPCgdReihUYWNYpNRP80ZxtuUv5BsQ9
	DH0y7GDvSP1uUZ5QdPXc0Yddg2J7zH/hNlV799geRhVXOUo7qjQnWMOb3O1GA==
X-Received: by 2002:a17:90b:5305:b0:38e:5dc:af03 with SMTP id 98e67ed59e1d1-38fbc5b51f4mr5664911a91.40.1785639122499;
        Sat, 01 Aug 2026 19:52:02 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4cb51asm27904804c88.9.2026.08.01.19.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 19:52:01 -0700 (PDT)
From: Adi Nata <adinata.softwareengineer@gmail.com>
To: joshua.crofts1@gmail.com,
	jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	u.kleine-koenig@baylibre.com,
	email@sirat.me,
	bhelgaas@google.com,
	mazziesaccount@gmail.com,
	adinata.softwareengineer@gmail.com,
	krzysztof.kozlowski@oss.qualcomm.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v2] iio: chemical: sgp30: fix checkpatch warn to prefer __packed
Date: Sun,  2 Aug 2026 10:51:31 +0800
Message-ID: <20260802025134.25319-1-adinata.softwareengineer@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260723235542.152a6a25@systembl0wer>
References: <20260723235542.152a6a25@systembl0wer>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change instance of __attribute__((__packed__)) to __packed per checkpatch.pl warning

Reported by checkpatch:
FILE: drivers/iio/chemical/sgp30.c
WARNING: Prefer __packed over __attribute__((__packed__))
+} __attribute__((__packed__));

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

v2:
- Rename commit title and message

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

