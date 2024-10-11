Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBD0216A18
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 11:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728647686; cv=none; b=sZ81SrvJuNr26bYUChNWl/bVo/g5GV/qD0gm5RN06haz2+t2Hw2FQwPK52eQduskZ+fWCJSM88pxr35qAihvkGfwdt7oAKwBC6oJ732nvvqFalZhgz6GTLapzz5w9T2Zrn4O2GIrosPohHaxeOnlGnwYsNxJrPS0k+ChbjvDfMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728647686; c=relaxed/simple;
	bh=BH4DbbmMQUbDmGpkllQVRVVJhPfwORuNLGg9TXD6Tiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nh3CPeaMQtzNvQhXHN82hQmiMsVncxU5Hbljo4kGpEjmKyTU7sTeCUqdJ/Y/BBLqUwSUvdFYl+Eh3TiHFY2wFZx5MShitvA2NOo5AMOdv4c33IR2xhR5L/iGc9G5r2qwgXagqX9umYRCKkRoXKghUXPLCeCoUqm07HElRVwG7lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jeje1RGy; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jeje1RGy"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F0AF84051
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 11:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jhR87jiJc7A for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 11 Oct 2024 11:54:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=0xff07@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF77D8210A
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF77D8210A
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jeje1RGy
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AF77D8210A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 11:54:43 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20ca1b6a80aso4874975ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 11 Oct 2024 04:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728647682; x=1729252482; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n0M9rAFbcV+izFFMOP8m5z+SO85I3Ch0rIJacPyB8ek=;
        b=Jeje1RGyd1gxh0Srp6DxO2H8cnNg/iaF9GvARx3wB8evA/2iV0pTHmFLg3e8s6y5BR
         +tNIMKJCx1+hOJ0TdpD/jv0gcr1ti1da4MXs/C60vgNpJ4CRD2g6i/Xx+0KwxGoqZPVG
         5oOqSkFWQxQ1DNhh24/Srsv5OPVlsawOhS+vs4gRCvpkQUesanLICjMP/DFdMQV+aJw+
         4X7QuPS7kUeJ3xU2ACJ+BmngEGGLSQOGPaqdwmKnXCP/aT3r3SrbhBjR/tFt1oFBJMqu
         5xdXWXtwyQCdYM/h4WK1qM5GxjVoF7MVlw37BVtm1O+p5vt7NBsIZHo/QuAeTaQiQ2La
         yASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728647682; x=1729252482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n0M9rAFbcV+izFFMOP8m5z+SO85I3Ch0rIJacPyB8ek=;
        b=aOy7uJNFJXiE8AdOMArMhGfQnMChFzbSa276yF0fiAfqZw+ovd8gEqeHRbgYRWoJDT
         ig65dSyMIElWVkN1qGdBXe1aa7o3sIzXHZ+f6GlKlPb4I2qOnwHWtjpErHILLfKDUP8H
         j3RB2YLYhyYLOy8Cjn7gr3YPEA9s5sm8+w5R/9XAwNZtiOEHEJwQqusQxEuGG8IEuiBa
         TXe7mPcKYu7au9sh9RDpp5E9qvPCSbIqkxOSahEf2Qp88omfB8S1vqkaPdw5Z5vsbXWB
         FTV1yHArpVzOD57uKI8430DcXM8FLaW1SiKTwhRk+RpZnwdnGkA6aD3S/w39xPwaUKuU
         UpsA==
X-Gm-Message-State: AOJu0YzFnNG2zpc5hkxTY7Eu8g8cJoGPW+jktKae62Dij9SbNPP/kHhf
	BJICu3iLVJzBAogVLDldHLsYSxoNZiZHi7NPFAtAr7oPGuf6+O3Ygesr9GHi
X-Google-Smtp-Source: AGHT+IFWWVOZXb6Mget6b+bWzMDShsv+T0KKOi2cgOJQlaJd94yNCHHf+KVc/uLTiV9ebyDumvxcIQ==
X-Received: by 2002:a17:903:191:b0:20b:9c8c:e9f3 with SMTP id d9443c01a7336-20ca1458e3amr31858825ad.14.1728647681927;
        Fri, 11 Oct 2024 04:54:41 -0700 (PDT)
Received: from ernestox.. (2001-b400-e2af-f494-1c09-712f-68dc-c3fd.emome-ip6.hinet.net. [2001:b400:e2af:f494:1c09:712f:68dc:c3fd])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20c8bad32a0sm22298575ad.11.2024.10.11.04.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 04:54:41 -0700 (PDT)
From: "Yo-Jung (Leo) Lin" <0xff07@gmail.com>
To: 
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	ricardo@marliere.net,
	skhan@linuxfoundation.org,
	0xff07@gmail.com,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Vasileios Amoiridis <vassilisamir@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Angel Iglesias <ang.iglesiasg@gmail.com>,
	Adam Rizkalla <ajarizzo@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2] iio: Fix uninitialized variable
Date: Fri, 11 Oct 2024 19:52:24 +0800
Message-ID: <20241011115334.367736-1-0xff07@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241011093752.30685-1-0xff07@gmail.com>
References: <20241011093752.30685-1-0xff07@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

clang found that the "offset" in bmp580_trigger_handler doesn't get
initialized before access. Add proper initialization to this variable.

Signed-off-by: Yo-Jung (Leo) Lin <0xff07@gmail.com>
---
Change in v2:
- Make value initialization immediate before its first use.
- Link to v1: https://lore.kernel.org/all/20241011093752.30685-1-0xff07@gmail.com/

---
 drivers/iio/pressure/bmp280-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iio/pressure/bmp280-core.c b/drivers/iio/pressure/bmp280-core.c
index f4df222ed0c3..682329f81886 100644
--- a/drivers/iio/pressure/bmp280-core.c
+++ b/drivers/iio/pressure/bmp280-core.c
@@ -2222,6 +2222,8 @@ static irqreturn_t bmp580_trigger_handler(int irq, void *p)
 		goto out;
 	}
 
+	offset = 0;
+
 	/* Pressure calculations */
 	memcpy(&data->sensor_data[offset], &data->buf[3], 3);
 
-- 
2.43.0

