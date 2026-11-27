Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795804002;
	b=moQ1lfmm9jv7sSZxbMb+R1wyV0q5QMuWcfFebbz1GVOhogEWMFPF3VesY59wY82iEBwh
	 8gWm8DHI/9ErRY6J3b/+zvWh+iognq6Hx0BwOdQOoofqCZen8o2nY/ii+8+JAYSpZyeEU
	 lyyx6B28/6IpPTofY/hYErQd4+g9Xlt2mxHloyzJCuf+i27J8QusNR2vvdr00Mmk8LoyR
	 4LpO/sy+OJWg7QoTQ8W2+19zUg5r6AQ+PtGDmfvpaSdHyJ4CWvmTl0iJ5xkZMMHUbApj5
	 Dwr0YBfLonxhS9LHNwwOpPN2x5bMAMehOLoMni+37wxzqAevCahpViaiP8UDkHgOOqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795804002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JUIkJDYEkx7nTz2oOBs8uKitK8ANRmBUsBm3gZYTVu0=;
	b=W2+86zEhDPC2dE8Kod/g6b6YFcd/luzr2RFsUvzdNiO7V0fLx6ZAjXTMq3M5FANWcfLc
	 5/AQHVG9MK/cq5vG3YKKPaeQTbpCfvRCsXw+ck5H/yk9mA8T9H/JzcVJDL+P3j73OdLaB
	 yDh1Hh9c3tXqFlelgu3W8UiihEzCZq72RB+9lvuizxgaG5A1m72zLY/njZRq+o3N6vLlm
	 QHgyU8XHTJSwtK2RSYHqBusHwghJFBC06bmo3a64z7uVbphQHdmB2Tj+cGGcZulHK3CB8
	 z+/bBf8R7t9ArRysu2R973lP1iG/3kFgXxy0kNPJFIw/1p7plm8uMQxkZ3DvJ04o4wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivvmh+AU;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C88606A32E
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Nov 2026 18:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C88606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ivvmh+AU
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f3c616c84so645189785a.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Nov 2026 10:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795804001; x=1796408801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JUIkJDYEkx7nTz2oOBs8uKitK8ANRmBUsBm3gZYTVu0=;
        b=ivvmh+AU8suSH7neH5QrYATqiK0jxltdSyNtDJ9iANGEA66y2yekDXICeMKtUTSAy1
         GyhjQcQlQ/5u5ECQv8M7gfCMbuRMTcDthXaCNVPrIwhO/EJK2E3NZ1WNJgyOpbJbHOhb
         tLuQ8Gqa5BBXHtIisXJL2Jr2rdxo3OrBY3JwviE/9smuYdi2Fp/j6NZwMJ9mfqn8/tUP
         K6dxES1zq2mJ2jl33JEpi4/lOGLekKnOQg11JdjPuhSWJTpQ+SMZnwb/qSnNQ/fcWvvA
         mvDwkl2dENhana2WSN4cHSELkvXPRlCKgDj15XWgMfkudO+EE7ZLO7h9pUWTRQ0Q9Osy
         chrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795804001; x=1796408801;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUIkJDYEkx7nTz2oOBs8uKitK8ANRmBUsBm3gZYTVu0=;
        b=VaqSxOBX7GRDBE9XX9esgYR2b1sOj+syJvetLpCuRZ5DC9EB0LrQ2EP4UoQtPszIUy
         V9K8lAXnh9lxBEkG8ba8SQRMi38Lp9Ly+guxX7vWOc4rrUJk8qlv1xST2FI+8w24ewU5
         CEK1l1N4JYXYGIIbshoWRsF88ygVPk9XI00IA6GM53iOeRY+ThiPpCHJa9CqKvH89CuE
         5zM/os7KPM05RapVmKiKbf7dI6+PqGkWS+AdhqUKocAg7LnNIFW/BCHMiPrT4C58l7DE
         KySdXN8HEBlENjIW/db8PmuFOH5JUmM+juRe1WPRnmbL0b0Yh5RwOr9wVlbZSxDaQI4l
         jlUQ==
X-Forwarded-Encrypted: i=1; AL+hErF8QAVgdAqsf2R6tdQmmsNVd3+/JE0NEpI1c6zJqV7oK5unaSMdk7kT4LkFhcp5ChJQ/GPti31UJFoY3zMCEe2BLTBv6w==@lists.linux.dev
X-Gm-Message-State: APuU4Z/c2H9tRA8OQYFLWXdJy6aXBaX4WVU1BhFCMfnt+cSKgIj/YbTT
	B0vwXL8pfTwOa2N54gznq87rHiceTkd3+W9/+XA0MsGn+hhJP+sywUkn
X-Gm-Gg: AZFdTZecsIgcwjEuezlOdrutdotqvd5cvRcl71lhHz4CBLX6ot854gBeEb2ocPIToiL
	IDzIwIHxG47ttFe0cDebxvlVjzZkjEHLaDP8PUCU0Ra/SGELj+olNhylTYRZNdR4goQoWlRNrKR
	9aMgJRCLk2ZKADX9kxLgti5ZNKglJgr3PeIOfhFBPa53jgpVY/gXTCuiRcGCadNnkk7UQlVSi/V
	R6Wy+EtjhzXZwVqFoNN1QLBb32Qf3idcO48JE0EdoATUwGqDjWKZL6PYOIEWpxB8Rp48MTPoGQV
	wDuTTmekux+4MFeYy2gwBD1wRDAyD1/QaIpZX8iNAHUFWil7/FEVaZ2g+fBYup9KpPO5x6XBEzj
	ww24tshZbilMzh/LYp/m289zTyCjTF+sZzTSehTFlrfOJr8FIv+VlaoSkZXVnPxp8L+O0mdPVPO
	mnKXznio0OKWjgSbPYO8wdnZaeBfPA0kngCzELFphaiLA000RlKiJyhflTXgOyy9M0L4NtbArOs
	vOOucUJVTSo/rHHOFnuCRM6BxzCyRqKjsZ/ZL9p1i29A506io/QZGneCKTU+JtVXifKFX/YnkdR
	D0qyXIV7J2svCesEoZB23mbFwYWMLCnl2zo=
X-Received: by 2002:a05:620a:1332:b0:949:6193:acd0 with SMTP id af79cd13be357-949bab4d91bmr4566002785a.81.1795804001385;
        Fri, 27 Nov 2026 10:26:41 -0800 (PST)
Received: from localhost ([2600:4808:5693:8201:394e:8b9f:994c:b59f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ad6dsm1889062885a.12.2026.11.27.10.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:26:40 -0800 (PST)
From: Marco Chen <marcochen.dev@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	pmeerw@pmeerw.net,
	matt@ranostay.sg,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 0/2] iio: health: max30102: fifo_ready() rename and I2C error propagation
Date: Fri, 27 Nov 2026 13:26:34 -0500
Message-ID: <20261127182636.83803-1-marcochen.dev@gmail.com>
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

Patch 1 follows up on Jonathan's comment on the NULL-dereference fix
and patch 2 returns the actual I2C error from max30102_read_measurement().

All patches were tested on a Raspberry Pi 4 running the IIO subsystem tree
testing branch with the max30102. The module was reloaded and buffered data
was correctly read, with no errors.

Marco Chen (2):
  iio: health: max30102: rename fifo_count() to fifo_ready()
  iio: health: max30102: propagate I2C read errors

 drivers/iio/health/max30102.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)


base-commit: 39508411b82d4dc29dd245bb471ec9ecc1111c9d
-- 
2.56.1

