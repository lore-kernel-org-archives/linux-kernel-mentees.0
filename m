Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F94154423
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Aug 2025 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754915970; cv=none; b=uS+T/J4UCntV8uF0nXD1M15wjhTmR9Gm95MD++48aOkmdEKOGrvEBlGAzXwbC7+eLeOXaDUd3g8JuGRR9YNCXUz7JL14ShLr8HncKMc9vo27MZPEddDkqNyucAbDUYgWiuyWajzfU/HGtGBIqdXFSLGxQFlL04uGmBA7NJnFJaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754915970; c=relaxed/simple;
	bh=A41fqgtIjAZRB0vyfZcgxc2R/n4fgDe6+4XRFoL3NIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZSZ0gDN+fy1Mcut456M8sTK4jnvNxgjcg4Vdj3k8Fg+w85FhvPOC9qLvOt1pHRDg0SRQcSmjYK20Y7m5NW4K6IJycvQPWtdtQngPGPl7C0PTe0+AYPXYlmA0Uhz8fSj5h9F+549kkPPbbKHXBVJjVrFUuMHHfo1BLYehkcGAUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+baAnD+; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+baAnD+"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31f02b6cd37so4424370a91.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 11 Aug 2025 05:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754915967; x=1755520767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LEY5FxbOE+M4/K3IySmpfVK+6dW9L7BlBilzoXEskLg=;
        b=W+baAnD+yv2I7A/K0GOPlbRGxipwYz20kFV850FcOWvTgaFYPOTFYgeZO4xevNdTZl
         2kvESjegFVtUbjPdNZH6zWEFdY1WTbAn3UI3wjVOgMWrMwm+xzkXDEsjw6fXj36oY58N
         siRB90spHzSkaQGl8kpkNpuXe+QrXcMOWUEM1cFYXKxWeGoD8pZNfrT3WZJlBuv3tELJ
         /v84VvgDtFNV+xa44149iFRZuOsYSLwHQK1GINX3R+jrRcanN8lDgRA67HJAlXyAftUP
         +nYAbjILuuXEnBbjJGchkUrtQTTF+fU+jKYTvgaqT317yHlHdWQ7y7kLqT0mK+OmN5f2
         Q1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754915967; x=1755520767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LEY5FxbOE+M4/K3IySmpfVK+6dW9L7BlBilzoXEskLg=;
        b=cZSb++ik91EcaNoHEdAw7S5QllPxoVn8Ap7PLGWCBORzUmTV6SoclIKzgE9vjU8GVF
         vm2/4wzK9YgrJkdghkXFKP6PyTRr235ga/8KLcSY4/IocObLs33jmYBaSsA9woTjtHTN
         aofqbh6kdrdqOpTTnhzm8sU8ZMb9byrVeBnGrtEcfC7mWlyCz3ZB5Nk0k8UmvJyqmkgC
         DUq+Slgc0vW3a/SUJtApl1Wxbbli2FgoEgSeTvjq4dSS3pEGbpCyakNUZOlHUjc3hhTK
         BoTX8MtA9Wi1dw1PmcYvsxZHI4zhfdPLR45OOtmIXBGpFyoO5Bc4m6TaluuPll5sx2jr
         rHOg==
X-Forwarded-Encrypted: i=1; AJvYcCWz2vVHs0umC5ekeKdfv9oEXemGa4fiFZ65IkG3V+oEALa95Jmx2A/PiVzJoJgxsVEaVBTWs+CRCWkyhLCCOdMSCpojZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgrLPpwjCgF+/9tBocZovay+mphTZk4mVriP6hOlfX2l28FTst
	mtPNOaj8NhARdVXDEUyVHrBbS0SQlxL9oeI6LEMCVGiTzeccBnQ6jRY=
X-Gm-Gg: ASbGncvgCwzHOHNQkHs1EAvCAjIaihIqnHZevAbO/b0+076vntmM5NBQ4TTT/eNZxTi
	VbjuvjEeh/eWVpd8s6n65VgXbeo2g7dB9JupAR1P9DaJC1iuRKMYCXJaapVAzBQU4hzVKffl9/I
	D4YBced2imvifCbSVyu1ExKa0eKdrAtVQS9/4xSRgTAL+MbHWpL2z53gDQvsP6nMQ7cz+b7QOtB
	76lZoGNJ2pzyUqfpeuPyNdbRbvy5YtAhEOS9FpJV2U6zxaKCbod1TMlPnklD/TqXvul4ysXie+C
	B4gzFUkDa+91NjwJiTymzVUwFQe2YJ3/wjMhqRj7qlQ/l6I9T2jmY01k0/qP9X7DUdEJTpNF0aq
	HQNAVY1oWJ2I5ZIwSit8q3WNUwCa2Yf/7zzo7GWnO
X-Google-Smtp-Source: AGHT+IExAfPXU4xzuqrRd70RkdM+E5Qyc7I2Njf0p3QW5BHfgEb4HaxS7l54URe8AVQT/ccKRO4+7A==
X-Received: by 2002:a17:90b:3c0f:b0:31f:1db2:69b1 with SMTP id 98e67ed59e1d1-32183b3f161mr22898050a91.18.1754915967004;
        Mon, 11 Aug 2025 05:39:27 -0700 (PDT)
Received: from kerneldocs.. ([157.51.80.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3216128ac08sm14731699a91.30.2025.08.11.05.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 05:39:26 -0700 (PDT)
From: Nikil Paul S <snikilpaul@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	snikilpaul@gmail.com
Subject: [PATCH 2/2] docs: rcu: Update dead OLS link in RTFP.txt
Date: Mon, 11 Aug 2025 12:38:37 +0000
Message-ID: <20250811123837.4378-3-snikilpaul@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811123837.4378-1-snikilpaul@gmail.com>
References: <20250811123837.4378-1-snikilpaul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nikil <snikilpaul@gmail.com>

Replace a dead link to the OLS 2001 Proceedings with a working
version hosted on kernel.org.
Signed-off-by: Nikil Paul S <snikilpaul@gmail.com>
---
 Documentation/RCU/RTFP.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/RCU/RTFP.txt b/Documentation/RCU/RTFP.txt
index db8f16b392aa..87b1c97c3ec3 100644
--- a/Documentation/RCU/RTFP.txt
+++ b/Documentation/RCU/RTFP.txt
@@ -641,7 +641,7 @@ Orran Krieger and Rusty Russell and Dipankar Sarma and Maneesh Soni"
 ,Month="July"
 ,Year="2001"
 ,note="Available:
-\url{http://www.linuxsymposium.org/2001/abstracts/readcopy.php}
+\url{https://www.kernel.org/doc/ols/2001/read-copy.pdf}
 \url{http://www.rdrop.com/users/paulmck/RCU/rclock_OLS.2001.05.01c.pdf}
 [Viewed June 23, 2004]"
 ,annotation={
-- 
2.43.0

