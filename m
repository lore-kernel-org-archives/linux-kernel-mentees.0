Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089922DAFA9
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  3 Oct 2025 17:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759513197; cv=none; b=rzIffbO5mzi0xORhuUFafO6spLMbcWiDelW91pOi3IJ3KEJ8IxvQC+RrCv03jZAvMLdGkneh4Ah4Q19w0KVnbEafl8RFACzhd3UFBDM1X9Pi6B7Nc5l83C491dUqz2ADKxwcmQSaiTktySq/PK6hUuYhkONTtS8PKIIMqbzM1f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759513197; c=relaxed/simple;
	bh=K9MnDj8zru19z4WabVyc96zz7IXhP2QKMqGlIBk5Aw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uKrcMaFFuTi8DKPN4yIAN4sS9RRzZc+DcaiXZkVSfhUfe8uW//COrwbjCbshXgJH55/mZ9eKYsjHt0jU9iJfY7BpvYLjulSjRyGgevIbcbUjnUTIEOqLXpetfwctqE5NOimY+XjeCWeFb1RLqZG8EEp3BsR94k8pKXBeNKkNg8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QulLy42I; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QulLy42I"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-269af38418aso29621955ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 03 Oct 2025 10:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759513195; x=1760117995; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McKrphvnyhX4IqUDStO+Mgag88IPYLvjzv/054SeX0U=;
        b=QulLy42IxDQXRNVOWFABmhlT6At0Ry0TdLzZAd++tzoElX8vSAj0UF/U49fwJPYxxt
         hqvFlB2hLpnDvIuYuV8bYlgzWaYA1Xr0ZeKaCtQ0FNKldpqYForeoDyrTXss/G0l37KG
         kNfhcdKCxfWl9/nZ1Hv+z9CUJzc5/k4wXCjuBHRcjSjgB1+E+atYJHzKk/aKjy40+58k
         tP6Fnpk5RC67NcaEv2Z8qu/FsH4KrnYfjATJqLYodt8TVCHRAHuM46u4SjnA7ZQlV984
         85J5nmN8xP+oMO8vFQrgroY+56/H4BA2gJr/Pjf3hJov4S3yoZksAe1XznO4kggH+ioh
         D5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759513195; x=1760117995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McKrphvnyhX4IqUDStO+Mgag88IPYLvjzv/054SeX0U=;
        b=OlpBXykwkGZ+zLkTzwIa3QGq66ZozWq8QAdiyO4S6WgcJLJ5op21CzuJQt7ErswY8P
         QB66No9CkvYQfOtynL4bz0R6hxOML/1o0qBSKWW+8TE8G21RzPU8mb2KKt55FILmJXFu
         o+v3Qcwfn944ySfj/15uNa4DQEKSB81703glWnJ9gE40y9sYfkIipOAEdEuXLm8rC6lY
         IhJENmSGvJr0hjGL1EAN3a4xx8a4EpGAK/h2vL188sIlup3Y/JNiq58bNNew2QS2jdL0
         VgD7tWhxqb90NGkejociC6bQsiGipEWfM5OHaqy75pLopiQIUE28lftpIvQdOJTzuE2Z
         vEIw==
X-Forwarded-Encrypted: i=1; AJvYcCXrA/7KPJxtITOXuuTIXM3R93YyOkpgtbfnh0o2sspXEZF+d8BuNs1cqr1WXn3grWBXqkAQ6Qbasco6Oy6alWViHbkFTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYlpWAMzxMtwMEogl96KhiQPLqNYNxmz3/zpYqWDfd+5kDbjYS
	oZrRR9AP3Tyx2h1UyAqaDybMrmypq2qBjSYUkHh6RW/l2dzBinaAgIrM
X-Gm-Gg: ASbGncsy5q4MGO0EB+5Zv5ECiofvXjkZM35Al1aGGeg7xOm4Ny3dD43D/2Xat/OAgrg
	r0GASbdAL2+JH4vRCtiqo0Wjg/0PyB4npHCLOnwF13JDEQ5J5h5LWRbF5XA2fHLNECq5omSNfg5
	fICE+UaunJ2fCD3WBTY9VD+RGF+s+WEA+Ad59vBv20tYmi9hE2RVqI6F7aZn6uClFdK79qiHPw+
	QVjLO31XmKowrppjS5NFu5TdLjzelZO/EBQsuOIbANTDx27lVMGlP9YYNPfWozzkAFr5XP0eGSk
	n6HCoslTy5XDDxpCVdeeDdM4LScSwpl72W5H6jadyXqom/1xAzmAVnf+fXtvtfSuVxjGceKjmb+
	DxaEUh/WwFPBZlaYHYF8k5pckFymS3aEB3NkzJKhOGL6duGHtlnbH+c+wTf3FFPG0EQ==
X-Google-Smtp-Source: AGHT+IFxK5aSMu30u6TJURWj06wmVP4JpzEOP1enPdk3/3t/y0sloBrTIpKjewn/xJuh0/y63HSRMg==
X-Received: by 2002:a17:902:f68f:b0:26b:da03:60db with SMTP id d9443c01a7336-28e9a5ea070mr54639985ad.13.1759513195403;
        Fri, 03 Oct 2025 10:39:55 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261edsm56267635ad.34.2025.10.03.10.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 10:39:54 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	corbet@lwn.net,
	zhanjie9@hisilicon.com,
	viresh.kumar@linaro.org,
	rafael.j.wysocki@intel.com,
	superm1@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org
Subject: [PATCH v2 1/2] docs/zh_CN: Fix malformed table
Date: Fri,  3 Oct 2025 23:05:59 +0530
Message-ID: <20251003173926.10048-2-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003173926.10048-1-krishnagopi487@gmail.com>
References: <20251003162626.6737-3-krishnagopi487@gmail.com>
 <20251003173926.10048-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Running "make htmldocs" generates the following build error
in zh_CN/cpu-freq/cpu-drivers.rst:

Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst:109: ERROR: Malformed table.

Fix the table formatting to resolve the error.

Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
Changelog:
- Adding missing TOs to the relevant maintainers.

 Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
index 8238f4c6e4f5..2d5e84d8e58d 100644
--- a/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
+++ b/Documentation/translations/zh_CN/cpu-freq/cpu-drivers.rst
@@ -112,7 +112,7 @@ CPUfreq核心层注册一个cpufreq_driver结构体。
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cpuinfo.transition_latency | CPU在两个频率之间切换所需的时间，以  |
-|                                   | 纳秒为单位                    |
+|                                   | 纳秒为单位                           |
 |                                   |                                      |
 +-----------------------------------+--------------------------------------+
 |policy->cur                        | 该CPU当前的工作频率(如适用)          |
-- 
2.43.0

