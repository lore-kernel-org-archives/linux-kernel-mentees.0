Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDE443B6E5
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Jul 2026 10:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110264; cv=none; b=Hg7WP7gXQ5cKQe4jdT9XAlvimN4/XnFQpKJe+6IGRO+WSfZnNw1p/zzieZx7X6tlGSXqsV1s8TI923/PZpiUGGoXy7eCRaz2IfBENLS2qQq5MOrTh13U7weT3vT8kQ4cCjqv8LH7oQRG/LkJB1THj/iNLt7hxzDPuCKnAX6uwFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110264; c=relaxed/simple;
	bh=DO4pUTloSCmd0KOmrWJsUS2U9gK6DNRCgmxLFrZRTyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dY1TPm6PKFoAQFB0g+HD2eHPHBEQpB9WrJt/jFLUqjLfx2LPOaDSBK+cIRJBHlKbOLdSd1OvaBzwWMp6oBoCOCnwI3lNclugPxItkzQUQgb9m7p1qynRDPtZ/LQ3cif/QVaxP7G1I16vwQCPRrMC8+2YCqyP1l+yTdgsumefQag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvY2WH/e; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvY2WH/e"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1836617a91.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 15 Jul 2026 03:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784110259; x=1784715059; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VNXyVM0mnowONm4346tNECsZGvG1q+nnKtqJNufizQw=;
        b=JvY2WH/efVsOTYZF4l9QDnALw+pUTaBKj/96kJcecszrirU5Gssh7Zo0Ce/JzjHWsb
         YIkhqhbOtKaD5QapcDilTf+cu8P9RbW0tV8990djadGoVaCtcxeCZyn0JW01ne1btg/1
         o8iNyzsHRAOfxA1uP6dEWaD1t9LeXHdrFVVRxdO8EaP94iJIamXbpvSMTG9mbJbtwIte
         fcSYibdZUDa3BW5K/c58jWylnajy+3PrZzkpsrOp79zmd7EnuE1QWODDbWrPQqZIv3JR
         nTMjk77QJ/+QYU5lSLNA2MVPU2qevvTBP+Y4ElnoQOvayrEoalYQB5y6WdfXD9Y9sBXe
         nVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110259; x=1784715059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VNXyVM0mnowONm4346tNECsZGvG1q+nnKtqJNufizQw=;
        b=CdbOd0LDPXW76p0Kq0fhJzKll1edBeQzf+nJTbaLOsx3ExO2LLLcOHvGx0HH3O8ZCV
         kvZJm2S5CD4yYsutlTeQWEYWnf/NHk1alsgXa3RXriIQn0nbZWRBD0c4gkLchDLZU4K7
         EQEF0UtAWOszoQycX2+QPz3vEkbJ2u29uxB1FkAhCuJ6k8WnTjhGwS9TvFqNgRTNYynu
         ms0xl2WYx6nYOhb7kmimvgh+VJFcoiTZwgWCQcpcq94Nf/XKwd1EoZ69gjJ8a8zfbR9R
         2mTtr787JKk+cAtBjmnv+nHyCJg66UaiHDEa45geq1dzXLGi1quAdZnlAJmwiQnnEQG0
         4fRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqvc5N+g00Icy3MPajYzu0Ekpd4Hx7x/DzplNkbFRVaJzYoRmlFbcWjav7nGYqNeSvJlNH8J4Z/qij+wSIYnpJUawsAPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxohsT05OXqww4w92WRNFtW0x/nA7LMrHfKpGgGm5FPcK0xDdH3
	N3JCGWagobYoQ149Lc+g8Ya0qvhJ3r+GeJiCo2/VAB2gWCOg/mw4tZKD
X-Gm-Gg: AfdE7cl+DJQ8Ny/qpEFzGyQxMRHDDSilMw9yrdjwih+jljZwtyzffQ9+hqyBd6UqGKb
	q+/39SzwoWyWWcJDo4CmQWRGr42Aqeega1XZGI8SISssDsLqJwzqmOdb4za5/JXNCcHeAdB5QFt
	Lxc6jEveo0CYQLHNeTEcNAEO/ErNLIOt+zwnYUxzgH1C/kg50U36xS+c+wZ+POB5qPTkm4+Nx3U
	o5s1/UoBdmXIM3Za7eA3koQ0P4ffMrVH3ZZqgVg9GqMylCCwJxaPzcQaAd1khZElEsuc9LHnESk
	Ikazf7z9F5QKOJWA+d6wvxmdFKaLkhJaU+mj2CjHxn75z1tAiuihnW0UfMK5+BlacP6uG+6rej1
	5hAKUeF7jMCWJgGOVqEFHFS7o/jWj3scmsRZqgZReauQkb5p3bXNcvw0CI01D/UZIKl08uLrTwI
	3IpksKHdQvLq3dfqmpt3/TxNSk7dtHND9lKYH7DSU9
X-Received: by 2002:a17:90b:2b43:b0:380:21b7:e727 with SMTP id 98e67ed59e1d1-38dc7a494a6mr16685376a91.14.1784110259262;
        Wed, 15 Jul 2026 03:10:59 -0700 (PDT)
Received: from primary ([223.181.23.34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3119c2a7bb5sm62079757eec.25.2026.07.15.03.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 03:10:58 -0700 (PDT)
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
Subject: [PATCH 1/3] iio: light: opt4060: Reject integration times with a non-zero seconds part
Date: Wed, 15 Jul 2026 06:45:42 +0530
Message-ID: <20260715011544.281148-2-vidhu.linux@gmail.com>
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

When setting the integration time, opt4060_write_raw() only uses
val2 and ignores val. As a result, a write such as 1.000600 is
accepted and programmed as 600 us, silently discarding the whole
seconds part.

Since all supported integration times are less than one second, any
non-zero val represents an invalid input. Reject such values instead
of silently accepting them.

Fixes: 0c6db4506ad0 ("iio: light: Add support for TI OPT4060 color sensor")
Signed-off-by: Vidhu Sarwal <vidhu.linux@gmail.com>
---
 drivers/iio/light/opt4060.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iio/light/opt4060.c b/drivers/iio/light/opt4060.c
index c391ad3271c6..cf6f69e5be35 100644
--- a/drivers/iio/light/opt4060.c
+++ b/drivers/iio/light/opt4060.c
@@ -632,6 +632,9 @@ static int opt4060_write_raw(struct iio_dev *indio_dev,
 
 	switch (mask) {
 	case IIO_CHAN_INFO_INT_TIME:
+		if (val)
+			return -EINVAL;
+
 		int_time = opt4060_als_time_to_index(val2);
 		if (int_time < 0)
 			return int_time;
-- 
2.53.0

