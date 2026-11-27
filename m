Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769849;
	b=o8woX6XGUYj5HnatS1UMjb7J1YJ1pFPvSHg8sXa2Fi+GJjOOD2n6QXYdR614u3gemCVB
	 a79BxvgXKwnlG06XsI0D2aNFwhqJAz+qkCEj1TAtE7v4IDPdxuOrn7OjxmNltsgmPuuTO
	 hA2yWrB9yXu0bfizSnM14GAnF4y2YU0U9ILJ9fNlTm4YCKHLbptSORjmb3n6lHN0vL31T
	 XgOAROIodDHyteev7obSBViagAOcIlU1pbpYyWgLaLWlwkJN/cP9xfnvIUxRvr/zA9EDX
	 cwpX7c2gBKq3fl9xr+lE8N9GF5oNBxGbBkE0S6th8ZqLzEQJx1tXCZ6RRi9Vw687uiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8ZHPnS6NhQJdC/T3Sn9QKMPB5Jy2JtYiZNcejBPsLzI=;
	b=Bh7SgxBoDqjru4jbEq+3itBWmmelMR0Yv5RkZk1A/mMai1P7yUsN0aZF8f9yxM8kr0qS
	 QyuSbgD2yNfnjhHVmkx9rZybFx655LliHoR/TtjGJzuSlxS18fE9Cm7/cUcUFcUUtA4g+
	 i/4cYJmTKBWjuSUkS9d1LoUgxWMKG3IuZg7ZZzBVnW7/emQt5TkO5BvhnFlzT8KJ9yoSj
	 wdj74546s7XM78iqGkBPm2IDVgkon88uXZCHA82HwAPsSLu7LuFNJLlMY4YMWzPRfgIRP
	 R9xfnHK014aXPPFsqPQ7ckxDsauwVgU89TBks3hq/K+Ink9gFf2YGDAy2rSHeXJ5o2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eLilmHkG;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396E8606A321
	for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Nov 2026 08:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 396E8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eLilmHkG
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9495c633eb5so438270085a.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 27 Nov 2026 00:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795769848; x=1796374648; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ZHPnS6NhQJdC/T3Sn9QKMPB5Jy2JtYiZNcejBPsLzI=;
        b=eLilmHkGHvVJJ2TKL4Wi7y7Ns6N1GHtKMkVMqN5mJujGTA4XOdUz8So4W1+Y73qmLc
         Ib2PzV7THGinQX6Jche+cFeIRkjmIJp8ZBldbUpJsmKB23nO7Gs0gXTrRTYlaQTAuwOK
         69fe5RayouSgWZSTH2QOojsVFvNMGB8aF5fBdo9a/U8R9+qgTSe2VSHSdG64tpWDBZF+
         phF0i7VeSXhmTjP8wkIjmJF5o1ZushDsgnlj/pV5hQSrZ0244BuhpajL9Omm/0GImtj+
         klPu9s7pkVpkbFLxEmmnyUS1jZvUF4YZD1tPKhxWaym2HNGR8aCXDRGZGGBN1WH9tpno
         /3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769848; x=1796374648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8ZHPnS6NhQJdC/T3Sn9QKMPB5Jy2JtYiZNcejBPsLzI=;
        b=aMylweLD5s4X82gGh76Lq21OiIXrG9mH9H5a9+BXuivMqXPX1nuLTdAo+49zL9GAR6
         BIyyoNE7JHyJCuh0hrEXxCdMG7vfEvj3yy2Xo1rnRXWdwbvDYel5z+najlV1x9JMjlKt
         x+ElHNyH59A6+FkSG3edtTzxyDlkChqVU3ssH7STyUW0lY7QV7UG0OXkOGMwbnlvYowN
         td4pSG63LbtOjXwC2tbBQbKhVEOTrWygDGY8nopOfVWtzWXOYRhDVuZRMlmQ0k6YLtbe
         EMde+b0xNmbYXrzW5WgD9FXof/f7cfxyBEMFl1kZTQajeV+rpwaX9EYkLHpFsDXwU2Sv
         Gu7Q==
X-Forwarded-Encrypted: i=1; AL+hErEkNBfyyW3A7izSrINO4OPJ7FsoRjsw64wjO2Ef42nKj4VR3zBTMENU1ozW7HqZa1RwBKqvWJCOk7KebesEt8FxJxKaeg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/DAvFP14QcAWP01N0H7cR1N2RJtT+R2DbGesS+6IJHmqvRJxNv
	R/YaiwT13sjJwXiCUQWTjps5En7TS9+awJYm78zUm7butMSYkTE5TRIW
X-Gm-Gg: AZFdTZd5OJxO2xyj67WuZQgTStmR9X1Ul5rqOGQ96trPED/7ReQtxiUZjFpB/q6KieM
	Gz3vWy9vcl6nCG3lQ9ux4yPnZdQXoxEsj5RLFIIuM8Ti90yyykHUSzcXh/vk3gbXSCoPxVAdpkv
	0pfSZgiwKQzlZHb5/v0AHTMTFzY3SYeIPDjpcvlByvkUbDD6Zx7NPJtGzKPHiljmlgbC/iBUw9m
	DRRZGApOsKE1eiLsuh0WlnCayZZVkKwV4RTIqhxHq34dZvQqhEvyTVxgPSgCIDU2uG9GGTrwZwY
	Ks1TpgW6BITYTFRlcT417JEdWvHYfUWN/9YvAtGgphzJW9jWA6wc+uZQQeoY7iW9u0Mg9FXyoNr
	4RnjRTVKzfGxyl65l4mSID96LWfEwQo9ndRZQDCMAH6GJ0xTFrXPmFuTmLJXPhaW5A++d+IjaQJ
	h3R9xjYd93wgq5C9MKNMghgGfOooIcHS2gCesdNW/A3ULRAVN4lVq61upfi16fL1rKkKNgCozsD
	wO2A+Sq7tf4Se5LqClvDB6X/HHhgeZp7s152s6jPZOi+d7aGBci2M2s/MJg2XsA0ESURzS8RyBd
	ijEYQ7m90mYNYwzQ360j55/9NG43SM7Nr6Y=
X-Received: by 2002:a05:620a:4543:b0:949:65fe:b727 with SMTP id af79cd13be357-949ba9b99a7mr4359649885a.26.1795769848210;
        Fri, 27 Nov 2026 00:57:28 -0800 (PST)
Received: from localhost ([2600:4808:5693:8201:394e:8b9f:994c:b59f])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ae74sm1767085585a.8.2026.11.27.00.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 00:57:27 -0800 (PST)
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
Subject: [PATCH 1/2] tools: iio: iio_generic_buffer: return 0 on success
Date: Fri, 27 Nov 2026 03:57:21 -0500
Message-ID: <20261127085722.126797-2-marcochen.dev@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127085722.126797-1-marcochen.dev@gmail.com>
References: <20261127085722.126797-1-marcochen.dev@gmail.com>
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

A successful buffered capture exits with status 1. As a result, shell
scripts treat this as a failure. This happens because ret still
holds the return value of poll(), which is the number of ready file
descriptors, or in the case with the -e flag set, the return value of
write_sysfs_int().

Set ret to 0 after the capture loop and before the error label. The
read() error path currently breaks out of the loop and would fall
through to that line, so make it set ret to -errno and jump to the error
label instead, just like the poll() error path already does.

Fixes: 6bb7cac8551e ("tools:iio:generic_buffer: add error handling")
Signed-off-by: Marco Chen <marcochen.dev@gmail.com>
---
The read() error path was found by inspection, but I did not actually
run or test this error path explicitly.
Thank you.

 tools/iio/iio_generic_buffer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/iio/iio_generic_buffer.c b/tools/iio/iio_generic_buffer.c
index fd955cf444ad..122fa54bb74a 100644
--- a/tools/iio/iio_generic_buffer.c
+++ b/tools/iio/iio_generic_buffer.c
@@ -807,7 +807,8 @@ int main(int argc, char **argv)
 				fprintf(stderr, "nothing available\n");
 				continue;
 			} else {
-				break;
+				ret = -errno;
+				goto error;
 			}
 		}
 		for (i = 0; i < read_size / scan_size; i++)
@@ -815,6 +816,7 @@ int main(int argc, char **argv)
 				     num_channels);
 	}
 
+	ret = 0;
 error:
 	cleanup();
 
-- 
2.56.1

