Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56556391E50
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  7 Apr 2026 07:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775545271; cv=none; b=hpTL7BcTqgeE4t5Xa9gkq/1DfKOktALGavehDrwLwmrv5QD3RX4jav9Pp3i9dDdRhW8GD30VGQoGwWN6a1HY9sgzuCJ0B+0ndAc0JgBU69y579EHlc2x85puz5f3O48eV4Ic28hmrXgApmd08qJAtLcC2jn1KtYXXNmDom1V7mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775545271; c=relaxed/simple;
	bh=bMBU/Sp/Hd+8dWJzIBSChhEWAq6h8QnFVVi6t0Td8CM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GSGTUK2cymTFd310b33EnCSovIEHVA7IMaNJ8vuCp8XE9DFo8o1i3sVVn30G1k1vVIyOSc4GAwqIfHu4tSZDZbdIGroIum6qhoVV1L8f951bqJ618J5iog5EesO7CPVqb6E0eDx3z9YngW53gY8J+uYoqP61az/SJqxd65R7rqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKA+2zmw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKA+2zmw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so61949845e9.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 07 Apr 2026 00:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775545269; x=1776150069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I7ul7R4AdJ4kZnhxBsfC1ozDk40Au8wWcQ7o5oSGrE0=;
        b=JKA+2zmwUplma8nawNguBKDXF6Ji1/zn22DT/7nMBQK5hVi6udwEkOSOVOCdW0NpsT
         8t1DzqHXLbwELV1woceZdQLMBeE8attG7lHhMx9NC44LdSbS1/Qb1S9C0VfbdypSzPMx
         wWEQr3JFeFGp5VcQPbhNScBgwLoJd4m56Wrc0yZHKZRTaO9g0ppkbb2T1slpqTVtshak
         gdnA1tmPPMY4Qe5VWaEVrg6M/jbNSKfm9TJFHeG5f+Hcitdd3nxhGGON1bBaRde7sW/o
         fFs2ayQle31brPPUV8e1l3v/9q5apLzLa5QUAgKamUARigmh+HJfTSS2VL+cXtMBnXQE
         3k6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775545269; x=1776150069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I7ul7R4AdJ4kZnhxBsfC1ozDk40Au8wWcQ7o5oSGrE0=;
        b=PREEMZxSJrYhRvNDJBmwRiSm1HEn8IL3A/0H+i0IXizJxuTYOtry3P9GkT3H8MszEX
         ZlLZa7bNwfRH4s2u3UXIfrGVha/XR1C6gxlgcA9j6GmDPuNLfdmz6oeJo/TTVO9m2kvf
         hRxPc/n36H/s4nwc4/pB0kcR6KPmjO8OHZA+OcfXs8Nd+ZlWql2p/W1aQNnc6GENNQsB
         40aLBFq8SuH2zdC8BTtRJypaBBFjfUGKP7nL3WEtgBoTT3pjfgu4+IcJjpWPyaFiIyWi
         M1lDU52ROHA6tkF3oPAows5jY9wF18Egwu46ty0gOEE8ZyI7dyOn9gfM0OC4OKoXZ9KL
         kASQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/r9XagKkdj5qxpQaZSULv/MOyKR3abFPR1frICzW3hQmrc2v5WctA3DBFy8ZFDST5yGoTG+q+lRK8Jwi8TV1gknFCHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOIYO1wrdqLuFwJe1Dhz1Z1G3AgIOP9mcP5wjktHWim3DDt2Lj
	f+CxXYjTwG+OizunJsHOALpd3wVJmCdFjrKTjO2yCV83epiZQeYFd4e8
X-Gm-Gg: AeBDieswvfhSFVFfnVOLVZCjs90fV1oDuP5qdZCpJL2956ts778SL41WxRfOfZ7oxiV
	QpgfS+EtllfFVR7hI6eDCtAXUhqlJOgBGFe66dqMJVfinwIYWHdEWLthaz4DcodOwjJWPU0YI5u
	GkjmogBy2ghi2BQdqSq+cgY42MOqRE0la2GXYN18t/S9ikAkJc4h4ICDNCxjd5s4aqN3Wjzj+5V
	TiUC+qnO4Q+Ckym+XcMEMjTM14nUyIblmjuw2V01ECb0boBVO8dITJV+AaWUTolAY6+nypEwdqn
	elD/R7+ywf+1KRN1IqZwZopSGgMzxI7T0cV8CSqGT0uDQcrlsiT9Chgd4GGZhDkr47uH1Es2ceV
	l5509ISwYG+k0Wtv4PatzEaoLVZeeRx6u52eUyuFIqb9VTFrChVWzLA0ILmbij8odzCvNpnjbi7
	yE/KuBPxX2s8x5K7N4Vuk3bP/BzwoO8fdffJ4Un4fy4z+TslyAJKWi
X-Received: by 2002:a05:6000:400e:b0:43c:ef4f:79dc with SMTP id ffacd0b85a97d-43d2927ff7bmr22786558f8f.8.1775545268585;
        Tue, 07 Apr 2026 00:01:08 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5253sm42167576f8f.9.2026.04.07.00.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 00:01:08 -0700 (PDT)
From: Aldo Conte <aldocontelk@gmail.com>
To: jic23@kernel.org
Cc: ktsai@capellamicro.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	daniel.baluta@intel.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 1/2] iio: light: cm3323: fix reg_conf not being initialized correctly
Date: Tue,  7 Apr 2026 09:00:52 +0200
Message-ID: <20260407070053.9359-2-aldocontelk@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407070053.9359-1-aldocontelk@gmail.com>
References: <20260407070053.9359-1-aldocontelk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code stores the return value of i2c_smbus_write_word_data()
in data->reg_conf; however, this value represents the result
of the write operation and not the value actually written to
the configuration register. This meant that the contents of
data->reg_conf did not truly reflect the contents
of the hardware register.

Instead, save the value of the register before the write
and use this value in the I2C write.

The bug was found by code inspection: i2c_smbus_write_word_data()
returns 0 on success, not the value written to the register.

Tested using i2c-stub on a Raspberry Pi 3B running a custom 6.19.10
kernel. Before loading the driver, the configuration register 0x00
CM3323_CMD_CONF was populated with 0x0030 using
`i2cset -y 11 0x10 0x00 0x0030 w`, encoding an integration time of 320ms
in bits[6:4].

Due to incorrect initialization of data->reg_conf in
cm3323_init(), the print of integration_time returns 0.040000
instead of the expected 0.320000. This happens because the read of the
integration_time depends on cm3323_get_it_bits() that is based on the
value of data->reg_conf, which is erroneously set to 0.

With this fix applied, data->reg_conf correctly saves 0x0030 after init
and the successive integration_time reports 0.320000 as expected.

Fixes: 8b0544263761 ("iio: light: Add support for Capella CM3323 color sensor")
Cc: stable@vger.kernel.org
Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
 drivers/iio/light/cm3323.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/light/cm3323.c b/drivers/iio/light/cm3323.c
index 79ad6e2209ca..0fe61b8a7029 100644
--- a/drivers/iio/light/cm3323.c
+++ b/drivers/iio/light/cm3323.c
@@ -89,15 +89,14 @@ static int cm3323_init(struct iio_dev *indio_dev)
 
 	/* enable sensor and set auto force mode */
 	ret &= ~(CM3323_CONF_SD_BIT | CM3323_CONF_AF_BIT);
+	data->reg_conf = ret;
 
-	ret = i2c_smbus_write_word_data(data->client, CM3323_CMD_CONF, ret);
+	ret = i2c_smbus_write_word_data(data->client, CM3323_CMD_CONF, data->reg_conf);
 	if (ret < 0) {
 		dev_err(&data->client->dev, "Error writing reg_conf\n");
 		return ret;
 	}
 
-	data->reg_conf = ret;
-
 	return 0;
 }
 
-- 
2.53.0

