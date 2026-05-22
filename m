Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB75D38BF9E
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 12:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453272; cv=none; b=pm2SVGog1O2XpA4M0QobBMT+itlsG95SyIk5WfRdJQEsUa9x2RTvG7dTA81DemykXyB53vll0ZBK+X2bS+NB+JDYgDvxGCvhOloTt2WPwRrSArTDGZdsvnb3myeyGW7niwes2sCs4pla8ooCbxNCnrccIHWR+xs0tgrg3PQVfk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453272; c=relaxed/simple;
	bh=HrONuiDMQBsyQKK/Qw9EDIlYqlICs8puzZEsFzw3q6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtC1pflSvYM6HtoFo+EV81LNCEllooM8bRZ4+Notu/TWA0/ywsFCrs60z4R9Y6cINls4ki9R8yb2Uz452YcCadrpT2SfOttoMTasEI8NnTk3D3CeUe5E5KWWiTvc6e+q/7ChwR7UPI7OXSoyIXsItNsuTw5e5qUsK8Wmw4cpa5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NpalVHw+; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NpalVHw+"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso84296005e9.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 22 May 2026 05:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779453269; x=1780058069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhPK+WD3x7b1l7d6v6GZpCF931oi4rpE7Ri3gLPt+mY=;
        b=NpalVHw+1xCkVrj+iUnbUlbAVqjYOapUx5mDMYW6YFutR94Brr9vQN2Zh10GcOmZgF
         8PHVglUOkqWANVhyMGv2UThIEQTdda9eqvytO9fB9Qjb92cBBOWuXRMN3JsMWNOMue9F
         HvGfLiwOPpuG0/CQ0swJ3qVJa6+cLx1fXnAkTci7yWoF1YuzQbvg4QHBjxe130O7HY/s
         V/4z5piO5N2mGbcbbrPlzW9qav4I8LaMcwXFq4dfSvreAww4P2OCQw+afDmnoQ7ewGdL
         ORpExvNMI5sLHHnfxLZw2VEiUtgJerVMSdqCxGWWKR2fkaaMNT3oNcsqLztAskIcczu6
         4qaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779453269; x=1780058069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lhPK+WD3x7b1l7d6v6GZpCF931oi4rpE7Ri3gLPt+mY=;
        b=Yrod7UCTly6FHKTkBCMNTCD3uRAG7gRC56RUQgYj0XxOe3nfNnpvF+HX0C9x6cGie8
         PIL1Ag45hyOL2aDjyEqVlb22mlY58z8k8r8UTvRKq0GnorpMHXXLC9fxwsErY8wb5vTc
         EmznvfOgFs6odAspKl2L04yrAE36HnNdPVgikZGpQTDwClkQkxUAJK9cYmCrHugAbTQ1
         RtefaJ5y5NN8NOAENu3UwRxLI8uGQ4fi8Ngb5ZIBDchQn+2wiOoLEzm8NRQzeOgZow4W
         uFnDzxMTAXqJcSsndDe+2H9vcjdFTsXITAMs1Zx0immpbxza/v+IAbS+XzNMaWm7jVx3
         DZqg==
X-Forwarded-Encrypted: i=1; AFNElJ88NhBCO0STF/iOpEzl+C5l1hV+DPvbzTWZsaDjI2a+eYwSJc6bNRxowxw+pucYDWVqG5QAow31SBil2nWf2r2yE+Pq8g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxpeh11iQatP3emwoQOQMxmW3Qv8NWyP+3VwQU54vShxFC2B25M
	/eZ+5MFlceGjVrME3UWDzddNrmdO+QpSCLwdlbFikcdbjrjG91QzyMLN
X-Gm-Gg: Acq92OHXoVPYPZqDHpP8DjyIax6CfZyek9B8G3+SRPz6nS9V9hQ4bnQ8qSTTYPSr5KG
	+kRNM/eryegdVwgG0sbBhItBStIvHZHeBjKgVfAVjYTuIiKkH0i8bGO2iB5MeskcOPzBfA3NAzd
	CvLZyKXUyjCsORCTSz0nEsAUcodWm0U+kSXkCWfECi20GMvhZWjYvfWAau+Dw7zfcSVdTzvRC/W
	p9OslZ+vIRcqfuD1dt89eeZoKroTRfPJ6JSMlXPh9UXvfKaboSNRI9Tme+zVwCURpy0IMFTwUxE
	45t32qfg7HvPi20D7+lixpwmSLsMQfez4ObzYAgn/8SnKkfClCmL8AVexFRegD70yqrZaDvKkos
	sCYCzIjPkZk21+ZXad1LXxVGsYJ9cwGd3u/Ru6CJ5JdgD6R2PnR1zypaygE+jXikMkUcnxvz+Df
	hEPfC5uF5BPqq9ldOAhUerRGODtC6Kc0UUSrDWnlZ+jDjVN4UGVjWu5cvvashja1M=
X-Received: by 2002:a05:600c:1393:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490428e5b31mr47285995e9.27.1779453268890;
        Fri, 22 May 2026 05:34:28 -0700 (PDT)
Received: from aldo-conte-t14.tailf68ad9.ts.net ([217.61.173.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042af0ac1sm14760175e9.31.2026.05.22.05.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:34:28 -0700 (PDT)
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
Subject: [PATCH v3 7/8] iio: tcs3472: move standalone return to default case
Date: Fri, 22 May 2026 14:34:18 +0200
Message-ID: <20260522123420.45495-8-aldocontelk@gmail.com>
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

Move the trailing 'return -EINVAL' statements at the end of
tcs3472_read_raw() and tcs3472_write_raw() into explicit default:
cases inside the respective switch statements.

This removes the need for a separate return statement
after the switch.

No functional change.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>
Signed-off-by: Aldo Conte <aldocontelk@gmail.com>
---
v3:
- No changes.

 drivers/iio/light/tcs3472.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
index f74e6633db45..1f597ca93697 100644
--- a/drivers/iio/light/tcs3472.c
+++ b/drivers/iio/light/tcs3472.c
@@ -166,8 +166,9 @@ static int tcs3472_read_raw(struct iio_dev *indio_dev,
 		*val = 0;
 		*val2 = (256 - data->atime) * 2400;
 		return IIO_VAL_INT_PLUS_MICRO;
+	default:
+		return -EINVAL;
 	}
-	return -EINVAL;
 }
 
 static int tcs3472_write_raw(struct iio_dev *indio_dev,
@@ -204,8 +205,9 @@ static int tcs3472_write_raw(struct iio_dev *indio_dev,
 
 		}
 		return -EINVAL;
+	default:
+		return -EINVAL;
 	}
-	return -EINVAL;
 }
 
 /*
-- 
2.54.0

