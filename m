Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769848;
	b=mUfZa2Nd5lCubW9ffNGS8JGnTe1u8ZWEDFqlvK5xpyNbpcBgSHXMnPsMVHus7Y84xO2u
	 J1hWelknHTXIiIVlxRgdhZUI3RUPlZhuZOgHbdtYhukLEGvbX6cT4ktrQyACIBsY6QDDx
	 ZnsJJrm7AzCvf4SIG8qMf1WSFDUnZnl7zNp7ES4Iqb2IFpeTkzDI3bKaMdWy1xnEWjZV3
	 jAh8+L82n8TWDLDGlAV63rxWKPCBQ/butikp1DQMRbwzP/Z1TOugMrm0PowFnmsxVjev5
	 RI6/GG5GMpBfAYMzUUR1+QzPXBGALL6V4oKaJZsLxvlkK9Ugg+mltqpLv6xh8zGW48Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OnY6t7V3w0nQuA9lKuKMyTP41xIzftjI8cijsOZx7nw=;
	b=XyB0kQKeJViI3XbzkGQnqF8iGxBOa00JwIyQ4D2H9kGxd44RsmIaIVCAzgUf8azUFTQC
	 eICkvILHCZCYb+Q4CqX+xq0NWpF9SfvOMUEZoWO2mzTcCt0UNAervuPAp5MfJ5dF5vwXx
	 uNYZ9K+X6SS4Xt4vBucid+Ak1qac7vFv4RT8MVc/f3CPCc2rUi/Zlni1ZRjezkhBx6BBU
	 oVfT8xqzEt8FMFbV3qgh2BLFtN1fwzEq39Or62TpJUPGv3Q2/hKUhCWcvUrT8BAhMDIfN
	 acNU+DXUEla54EzNZXz7cHCo0dZ2b5GBD2zz7JEWOl6Qg0IAQOleGqCMqRDD70yAikw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o5l7UTLp;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C09606A326
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Nov 2026 08:57:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37C09606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o5l7UTLp
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9495d543b91so470982785a.0
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Nov 2026 00:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795769847; x=1796374647; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OnY6t7V3w0nQuA9lKuKMyTP41xIzftjI8cijsOZx7nw=;
        b=o5l7UTLp/yxmdne9CCeUGQ2sCEgdwwJYBmpzT0z/8Zdp80F0WlapwfKD0Q0GVv76+e
         1sxJ16ZQSxbnE9/43DEyNsmAZIjg1esnaU9vJ0RQRgWX90P24MJ/T6hWX6nsMa28DftQ
         ek1hKyWPEkiYML8A2f29xAXrE7hpSYzOggcl+V76JqUKYylAb7y/HO+sxTu4GoXlO97S
         tFS0t9nrTiDemGHtX9OXjXAIOzjCApI71smXHVbu3+E4jH0P7jVKaggul5ynDZI7ERzV
         Dqpt/TFxJubx6wb04akXlR7/PQ+VJG5sFhuMer21gvsOMTZE5s4EpxZKzdr6fCgOkLTo
         ZQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769847; x=1796374647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OnY6t7V3w0nQuA9lKuKMyTP41xIzftjI8cijsOZx7nw=;
        b=ozTTUwT+YYYvG7386H4emhyR5itC+6PjNenLIcbUcgepII3KHWOWqmp4P/T1PPXfKY
         GvyPc8BUD+Gxl4pkHcEljO0lqDnMDy9gF5IrmP6SG+j+7Et6hSLw5xxi3Nb6UOzk43nE
         fFPmgMRug7AeWcIP0EdBqb19tPrEcYEB7yZmJSo9iHkJQ/dF6IKBhkAlJbRTSWoQXVgU
         JEHA6YrA4YkwPNmjkp4LLBWXd9rqql2G3iHrbazAZ2BDVR3Z+mO8dr4pqN4EuXLa+LGi
         KEFcUmCd90rPEX5TrXrunXU0GhvxZxCIWazYLuStpeEakrnQMN0EIt9X4xW5geMMFrij
         rg9A==
X-Forwarded-Encrypted: i=1; AL+hErFykvEBW1fjBQs8cxXt1FbirhzIYkZ0ZTiIMQr2usoJB0pilTcvHvJtnGDFvHI1QA7v/jFtXEVsmVjpBLl+DRzT6YDyEA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9I/TeJf9FVbzHr/Cg3u9h0iKbnqsfqNBIJF5AbcRAHssnM91zm
	K1RmrRWwae7PqZQpAU/nJ7iUlJzGbbw1y5d8z/zBzaqeS2z5Gm1U5sQn
X-Gm-Gg: AZFdTZca9P6rgfiqsrKNHHNGRINdt4CKeKLJxcmKwpIWnmbv3I7NlnGz+XQgrcKruIE
	sXIYr9C/FlT24W0kkVRMNn5p1Qyp+Wm/PYx4Zbpmc8jLPpi8yNtse14AwgFWslN5kzuq69iz1Hj
	aUmjllc4fek4CS0P+yXe4cQW/sedP3ZRFCZBtqVIoa4rlLn/rmknw+LrnAqKq53MD/fW3+VPXo9
	Fjic1QsLq3d1y3BjxlhRNAJ4jW/bGv6/F9+jmWHemxRIGCvKYl15VUfmFCIaDl4PA27evXc7YmT
	0+u6FZTvwfkTV13cCiXpAoymcSmkntKKtuZ4h9HooIpVB5UsyPOFg5AvodRvCguE+BQ5DwasUta
	Zsq6XtG0Gv7w6bN3F6XI6hTIm2i+LcVPe/mAg0v0VY4AkZmptdOw37yDDIfvGeqqwGt7Y0tyXwx
	WHA3x5X9YMCvgCbnZNrnT5LDgM0FRjrO1LeVah+IEYzZXM+xNvoKrTjvNroiKhfyBoyXrvAamQW
	5t2afoO3mNtlI5DirP9IolhAeAL4L6bNy66i7PncE/WGqp4/pYzPnWuh+3XujmQ4vEkjGJFDGLe
	Uw41kNMQk1DdpxFy9/Vg3AuQAhBHYIkN2Qani8drFwr1OOCCE7vtxffi
X-Received: by 2002:a05:620a:6f06:b0:939:2d77:d6a8 with SMTP id af79cd13be357-949ba9f5f36mr4256539085a.34.1795769847199;
        Fri, 27 Nov 2026 00:57:27 -0800 (PST)
Received: from localhost ([2600:4808:5693:8201:394e:8b9f:994c:b59f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0315f4sm1759249585a.3.2026.11.27.00.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:57:26 -0800 (PST)
From: Marco Chen <marcochen.dev@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Hartmut Knaack <knaack.h@gmx.de>,
	Daniel Baluta <daniel.baluta@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-iio@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 0/2] tools: iio: iio_generic_buffer: fix exit status
Date: Fri, 27 Nov 2026 03:57:20 -0500
Message-ID: <20261127085722.126797-1-marcochen.dev@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Post: <mailto:linux-kernel-mentees@lists.linux.dev>
List-Help: <mailto:linux-kernel-mentees+help@lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-kernel-mentees+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes a wrong exit status in two cases for 
iio_generic_buffer. These issues were found during the process of 
using iio_generic_buffer in a bash shell script while testing
buffered reads with the max30102 pulse oximeter.

All patches were tested on a Raspberry Pi 4 running the IIO
subsystem tree testing branch with the max30102. 

For patch 1, a normal buffered capture exited with 1 before and
0 after, with and without the -e flag.

For patch 2, running iio_generic_buffer as a non-root user exited
with 0 before and 254 (-ENOENT) after.

Marco Chen (2):
  tools: iio: iio_generic_buffer: return 0 on success
  tools: iio: iio_generic_buffer: return error if no channels can be
    enabled

 tools/iio/iio_generic_buffer.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)


base-commit: 39508411b82d4dc29dd245bb471ec9ecc1111c9d
-- 
2.56.1

