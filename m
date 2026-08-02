Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64A023BD1B
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  2 Aug 2026 01:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785633830; cv=none; b=qkpR87IEIJSyxgP7A4/xY7ViSvebO5fsVm/W8QmBEnAIv2yC4/upZtWQXKt3o89uOfzq1cHolsNZTiPz9nh/m3/8xBVZsVxBWorrkQdiw++PnlmAapQj5QH39nNfA5TPVJUOiu/CkoVb4Vm1OelbbRPvvke/OyD0h83A64NTE14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785633830; c=relaxed/simple;
	bh=Tkcyj1pIcSE+uem/7Raqyt4F4YMYHe/HbEy/1nXpsj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uvzLIbAbv4AVfxhGZ8o8+PQgl4Blu9KRxWygn3dpVwEl1byXkUhnnkFSc3W4f6d74Y41HXbrIcs/eM6K1KkMgc3IlOjrsjSo3d65ldnFCMcF7HN/iT6IDmV13Q1+VQsgg2ErptojEcHo3VtS2eZAKgu1LhWpofSrvQpL7IOVSQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J+TwP2lq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J+TwP2lq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cacf197759so32814335ad.2
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 01 Aug 2026 18:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785633828; x=1786238628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3pTsE0k2zb7kd5dP6EHONBGSxmW+mcist3GzpPTbszk=;
        b=J+TwP2lqyv47UgUocvpHZxEvlFVnkZo98bTq+SZhQ7q6uX4lsyzrMgeujJ1cuyQLoX
         CkjNjtN5jJWQTPyMiHHAjWG83EYnz0dxM9tgf6zC+MhUfWiV/demY71pJgtjQXFCc4Yz
         pu1I3OpmX2WcW2gk4AZCyOaJ+l0Q3jVIy2M9GEd8OF/rYReNK/Kr9YBqkfqs87I6RRAy
         /LRr8clN2bpFEFHpBfWGmQhJ+t7oeZiZywoYXghFMs572IBdSEb7sDciLY1DeO4rWIdk
         RHsJK4bvkTdEZCciygCi6tjq+/QhWk4O/XduPLHnBTcROvRVWSE5+GVJF7+Wd/2SEcxt
         tTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785633828; x=1786238628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3pTsE0k2zb7kd5dP6EHONBGSxmW+mcist3GzpPTbszk=;
        b=qzVZOuFGHlu/xcKn/XP6J4QPV28aAjY1jjCiUC7pNdN9XPC2B7Fc0Eu3j1AMvJbYwj
         JDTuE5cugUdbeB0apBrDBeqOtirf7IBKDYycMiGbdUS688NqEvsGKWDUly/srAxPJ4xq
         v1LigfFAr9cHFM0HQGoL5zPvWu2FLFFeBS9+ZP+rVcu9IpdTeRjDFnyFLvW+bu0hDHeR
         IBlGG9LEpMbTKqjtxnqC9Qj22dQ/XhgbdeRuQR9Y7oh+mNvqjN7iKCph2eP1Eebe1NkI
         mwfJWjyfR3TT6olt51O7dLK6Qz8frJVs6kBNQsSza3ROXL7JTxdQnTBjPROMp89kkvg9
         j8Ww==
X-Gm-Message-State: AOJu0YxVQlMX9zexpbOIMWCzgXFO471korG7hDrpnQZdQNm9zCCh2WvC
	jMr0+IUSetP0a5B3jZgbNBzQcApFmbqomm34xPzPiw1MVX17s2I/EUG6
X-Gm-Gg: AR+sD13cGCZQU/axpEaPEV6v63iVxQV/YvWGHWnjjt4iv0koDbA0mCg4RqRD55gxzt1
	Pfq1a1BtlaUyn/psVHAklcXeHmeleeh8caPJy24W9C7sy90QqhemcXt2RC+8WZg53AFO5jVA4Ia
	bYMh5ox5Aajl0+8KstMAKL/Gd6QFRYFq6SDKgIUHW92vOE7/nj3HL6IAcRTtjZT/fzedpUoDo43
	cKSIYmOzkePFOPosGqx3MyzVrVOQjbnnw6H/mHRLbSRQ+icMYd0SiOHgqE5/snIKOZLg+oHw1Ke
	qxDvDHulPEPFapoT519U/KdLHRDJxGjlSkB4DCjxuejYhDtka5OyLNC4SQb1WCAwTkgtPY77+AH
	lis4M7Bzqe44Y9D1WrFDSEBFNvm4LAcDdXtg9KrBrwRhp7jKJfI5ufQzMQNQnKT2qLGCIPCdsGM
	oD/DAoEPuP71Db/sLD5cqQTdW7Ty3UlOtRZKDEHKBGiKI/8qnFo70BQzeKZ6bs6YgvPMBdp68s8
	AOkkrG76O0Er1/E/1oRiD/LJXFWhBRpxB2yG2cjfmTTVs55/hJQ9/tuqpMIdw==
X-Received: by 2002:a05:6a21:6b13:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3c92a51e081mr5409487637.13.1785633827927;
        Sat, 01 Aug 2026 18:23:47 -0700 (PDT)
Received: from debian13.localdomain (bb219-75-96-14.singnet.com.sg. [219.75.96.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e114sm36906954eec.28.2026.08.01.18.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 18:23:47 -0700 (PDT)
From: Adi Nata <adinata.softwareengineer@gmail.com>
To: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	u.kleine-koenig@baylibre.com,
	adinata.softwareengineer@gmail.com,
	dakr@kernel.org,
	bhelgaas@google.com,
	mazziesaccount@gmail.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev
Subject: [PATCH] iio: humidity: htu21: Fix SYMBOLIC_PERMS chekcpatch warning
Date: Sun,  2 Aug 2026 09:23:26 +0800
Message-ID: <20260802012329.9877-1-adinata.softwareengineer@gmail.com>
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
+static IIO_DEVICE_ATTR(battery_low, S_IRUGO,

WARNING:SYMBOLIC_PERMS: Symbolic permissions 'S_IRUGO | S_IWUSR' are not preferred. Consider using octal permissions '0644'.
+static IIO_DEVICE_ATTR(heater_enable, S_IRUGO | S_IWUSR,

Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
---
 drivers/iio/humidity/htu21.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/humidity/htu21.c b/drivers/iio/humidity/htu21.c
index a9dbf08b4f1a..fe7192d142ec 100644
--- a/drivers/iio/humidity/htu21.c
+++ b/drivers/iio/humidity/htu21.c
@@ -154,9 +154,9 @@ static ssize_t htu21_write_heater(struct device *dev,
 }
 
 static IIO_CONST_ATTR_SAMP_FREQ_AVAIL(htu21_show_samp_freq);
-static IIO_DEVICE_ATTR(battery_low, S_IRUGO,
+static IIO_DEVICE_ATTR(battery_low, 0444,
 		       htu21_show_battery_low, NULL, 0);
-static IIO_DEVICE_ATTR(heater_enable, S_IRUGO | S_IWUSR,
+static IIO_DEVICE_ATTR(heater_enable, 0644,
 		       htu21_show_heater, htu21_write_heater, 0);
 
 static struct attribute *htu21_attributes[] = {
-- 
2.47.3

