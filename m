Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0497543B6D0
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Jul 2026 10:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110265; cv=none; b=r61OVIxnIwhKOxN/LLMkWNu1A55zMvOitPnTLpvaPm30qvUBwbdCeV7K7o+/tIgiWN2gA33EvaKpdEnsIeVtPv2b6qaA6uKrigy8qjB1TZci7jfLH3rmvXhMHTfikmtsBXK8h4ySU01fZefYaS7bGehNuWcBdSSdJ8+ZqhJa1NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110265; c=relaxed/simple;
	bh=yXQameaNSRa+QXBKj6CBG0heh79Z1cjYE9sx8sHKO3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dbVQ1fRZJYj4VQrNJ1Y0jzTEDvHD6MK4wpOaKNjlUZ2HfB0X5yTMnPXWgFe2zWxao55dhf/8+npHu44CyRrhWO7kSMzIrwJfvpXa+U6X94HVQvluORJbdkKTP86aA21n3yjVAx2EAZqzes+vEz3rKj11cIBowRv19Pz177ByBMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILV5xsjc; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILV5xsjc"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381ed661712so5725429a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Jul 2026 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784110263; x=1784715063; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gBNL9jZr+BjLwoEnPOS4tAnKcJKl6B6YE59NAlSHzw0=;
        b=ILV5xsjctUTNBtSbUevF79n07xcEoqJpz+WynphxGMBdZlT4/mZd4lJ/5HZW+1xw1Z
         m07wn//J3V/Iw8oX3bBQ6vL+3bSABZH1Egtk/eGjbhQd61fNuusgBHXEpjR83rDzk4SD
         cpY62gPfGxwq2uqrLTIhLjxa7JzZy5RHpzX4ocntHGgHJS97kXlyv3nu7BKdOLnTlDKW
         3lnJnuC0lbJUpmWzWk+GW0dkq9pYN6pIlguamGlwd23xvoF08EyLfIT/ZSJqCDbvWDAh
         oqqFRAWb85/lM7jiQ2NxSi6U3dVJr823tNtpxuEawlhJAtnmt3JghX+Oe7JuEHfxqAzv
         M6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110263; x=1784715063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gBNL9jZr+BjLwoEnPOS4tAnKcJKl6B6YE59NAlSHzw0=;
        b=mmkwHHM+kZ3LFg0OOd20X/8ZsCCkRsK75ZBeQcaqZPpY3v/z99tmXqeq5gFB2oFOX+
         wLkuDkiYMZge7Mt1Rly3SqsyCCvs4e+G4w5bUSIJ0qsGsaBgohy9fe1/Zc1D/6FisGHO
         cc8GpUxJNSyAm3x49vm7eapIIbcR1HABLmLD9xcw01dSgqG1RDstm5asCZZjsuDKyFi2
         pe5U4PKkCcwSU5bhXKSsBTsfsua/Ykx8UJFGkQT3VMF1De1EyU6Vj4/6KBpodVnTeZpg
         pKTeuz99ZP3gy4m/O6IuyiPGK5a40+toxfl4/aaduxoqfxoWr3KN/82xGU7Rg16FSmSw
         n03g==
X-Forwarded-Encrypted: i=1; AHgh+RrvNfCfAuwlY5GCjW/uqLCYYg8q4mA8hYO7BMeS8BT3nFvxm9h/gxwbdW9gsxgcztK3pzo3XTYHzLvRcSe3OtM/nuHO4A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyK0MYVxu+5rdKXWJk5zoQIG5gQuQWa57Bc2q9R0hrGxeg79Q6P
	noqJPxmrM8vdedbIATE7bgbP+KJiQwuN82fDXAV4PBwYkKPBte5fuSKA
X-Gm-Gg: AfdE7ckTXoy1Nv6SD0fnOdGaLbKgzOtDLmAvf+aO+pgIFbfUJlbiQyzI+khuKKvrZZd
	0OqwW5qoJGXiTLMfqgXPts4scdtbEa+vvFm+vydd0uSJquhHesX/0DIt+Bv22wLXyNANp10XDtf
	PNnQ8lXYin65A2TiO1p0fNepwcpM/Ue8dR8871Zdj96B1a7ZcnV8zHUcY9V55hvf7uOS9t0tC+x
	2mVeb0wqlPrvvB2EE81RzFzNXXbL5jC7ocwsPmlia1NAeEtsSlRf0ovXHecXeTvx2nj/cumO4nV
	r3e1y2bgZCVjK27pJsiGdfJh3AyEX5cYKHyqcZI7d7Sdq/+9ZCVOyLqcdAYJYO3UOqnrPtuWeA+
	A3znDn9nzRi1wVOqDjg4QiiTsoV8nogJ1qujUds8LMACtXsXLAB/QgftLcBLYteo3qnH8M7zYKY
	CDi23HTgGerslroQ2JXEQXs8KmPaZfDl7I2JLgq6k8uXJJvhGIfBo=
X-Received: by 2002:a17:90b:55c5:b0:381:77cd:38d1 with SMTP id 98e67ed59e1d1-38e1ae2679fmr5266216a91.10.1784110263189;
        Wed, 15 Jul 2026 03:11:03 -0700 (PDT)
Received: from primary ([223.181.23.34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm62079757eec.25.2026.07.15.03.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 03:11:02 -0700 (PDT)
From: Vidhu Sarwal <vidhu.linux@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Per-Daniel Olsson <perdaniel.olsson@axis.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Vidhu Sarwal <vidhu.linux@gmail.com>
Subject: [PATCH 2/3] iio: light: opt4060: Fix pointer type passed to div_u64_rem()
Date: Wed, 15 Jul 2026 06:45:43 +0530
Message-ID: <20260715011544.281148-3-vidhu.linux@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260715011544.281148-1-vidhu.linux@gmail.com>
References: <20260715011544.281148-1-vidhu.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

div_u64_rem() expects a u32 * for the remainder, but
opt4060_read_ev_period() passes val2, which is declared as an
int *. While this has no functional impact, it triggers a pointer type
mismatch.

There is no behavioural change because int and u32 have the same
size and representation on all supported architectures, and the
remainder is always less than MICRO, so it fits within the positive
range of int.

Use a local u32 to receive the remainder before assigning it to
*val2.

Fixes: 0c6db4506ad0 ("iio: light: Add support for TI OPT4060 color sensor")
Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
---
 drivers/iio/light/opt4060.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
index cf6f69e5be35..e3aabfb14d5d 100644
--- a/drivers/iio/light/opt4060.c
+++ b/drivers/iio/light/opt4060.c
@@ -713,6 +713,7 @@ static ssize_t opt4060_read_ev_period(struct opt4060_chip *chip, int *val,
 {
 	int ret, pers, fault_count, int_time;
 	u64 uval;
+	u32 rem;
 
 	int_time = opt4060_int_time_reg[chip->int_time][0];
 
@@ -738,7 +739,8 @@ static ssize_t opt4060_read_ev_period(struct opt4060_chip *chip, int *val,
 	}
 
 	uval = mul_u32_u32(int_time, pers);
-	*val = div_u64_rem(uval, MICRO, val2);
+	*val = div_u64_rem(uval, MICRO, &rem);
+	*val2 = rem;
 
 	return IIO_VAL_INT_PLUS_MICRO;
 }
-- 
2.53.0

