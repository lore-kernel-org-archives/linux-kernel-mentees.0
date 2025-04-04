Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5561C68F
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  4 Apr 2025 01:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743730110; cv=none; b=M2dybh9q3JuHKnK187xiyCOVtgjzya2CShSCnyrzO+O6lC+ZIghxf7mAR5PDI+04iFub+OICUhdiar1rwArplZwT+KfJaA52NXtnjtjHCC2g2VXsC5BQOtXrN6cmgQ+pFZbw8tkOhpQl/yG61Niz/oSOH5tkOCAYMhGZ3GJe50o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743730110; c=relaxed/simple;
	bh=+ResDCTvM23URDJCLa3ecYhjP+KuL5/bXpoaByzVOYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ap8uUB8Sa+hSEaHSSuTVPcv33XYLK249eMF04MzCmAEvZmE2LCfBy7qbTx13W1SkVHB9VenlPtAHT0PV4aBj0b6jFrPGTY6uzoS/+zFnIRvGBeGEjVhzfEb2c44OCegcpa4Br4G1dP2HoLVp1HKpQ0qVN6s5e0TBlowbwmYAhp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1PTHW0J; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1PTHW0J"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4769aef457bso15384911cf.2
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 03 Apr 2025 18:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743730108; x=1744334908; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TdHSKPoc66HovlsYIHymAAPKNzysuy+s35fLRQ1k6k=;
        b=B1PTHW0JK63BvAepXayur4P9X/9nFdgssKO6kkziIkL8M0Uiiy7kbUxR/0UJKut19f
         HJ3krWlLw0CLALMD1hMw/F1wq1O9Ip7C40QIv4d4YvTW7e5WNjxJkF0EhuFIoukPiuDi
         AcPdFskGNBOQUkN21df7PQNm0vV5dxLMdfKjbwGKsftaB/AyLpwiW+Q8K2TqcziWdsXJ
         kT+N7caHLEC13xtONRi7B9nyj2yrbcu9QVq6w3vFbGkWPojxfxRz2S/H06PIKv/or68m
         HqFjioJ+bv+RjQxOqwvm5f+5oqqFRYb+yp5gsD9+F3kOYaHUfD/P2+vd90mJIS03AN7g
         9MhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743730108; x=1744334908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TdHSKPoc66HovlsYIHymAAPKNzysuy+s35fLRQ1k6k=;
        b=JEbF4W9KioA2A4gEvZ+dBKYd3oOGeFdW4YD76diYdm9L+rg5MSGKZswi/C2j2J9E10
         HUSRmxdSmSJ4uEFuYaWSMifo5Q1n4RrwcuDabzS9cquKJyDDg7RXrfgeb/2tGWYFA1qy
         eVwfWtpMb6IGEGHcri5knOk4vmCJm6nm9YN1PJkynUitGfK2QMaGhXHpjZFpADP7CVUX
         hAmogy0Z0EzcVhaGrlcb4cVPGnFvPR9ZIFKLkENIRV0rT7gDCpS2OrJhDkwUEQsl5iVW
         cVR5GbTfflatBqNMd7qvOxPPmY+IAjRPgGS8kPF2d9SHMY6ShQDuBd9H5NTRBXD0rSZ3
         QcDg==
X-Forwarded-Encrypted: i=1; AJvYcCVmMlMWZdEYjzyc9zagyAe/QITgQCWDKHvi18Pp/dZHMWjGwstr2jKShgBW+iOhGDi/7MxGNRladQj8XUS9cm358c5JeA==@lists.linux.dev
X-Gm-Message-State: AOJu0YymTJMi1K7SEx1Z7AVhsayUEK+6maDJ1ADO2mZCoI+uIdZ4O9L6
	mmOH65em3aXRUPs8boc93Lje7PPDWN3SfhDv8a/UuBd+fOp0BLP7
X-Gm-Gg: ASbGncs9Rhucaw4K3Zl85d6YvLrwjDsYqYiqPYIdeqESYVYDrWW0V2rQbli6J2/fdtT
	v43yz5cJX9SG9Y0zr5Sb1+mM6E5s7E8XhStnqV/qdTRKYZv9AbP5sTkVwGxjfgLbtTqh87w6/Dn
	7Vyhc5ZCt4PoIAnbaT7T62vrH/Ahd5MPXhYDRUf6OLosLktST8zwTp1rLXbHeagdRzYKhBY8O4m
	Ccb8aRelRXAB2jZS3jL7dm/KldPf3gm3IFIX8HbzXs2feyDEXKfF+9/RMe5XQPZNNZJ47Kqi9nu
	MeAXDNe4gWMDcrUEPfCw7hjvpfhcDuYr41hJFigb6s0iD7WoIAHL/NVFEnFKF6RRlQc2I4CwPPS
	3I5QviRy7yMut1U3S4Oy8Wq4=
X-Google-Smtp-Source: AGHT+IFueRiiCJVMRgu+RUz7h9R7hW0yLQ2FkCH5TbKaoZr+99YUdDkzX5Qicx2G0NKcSCf8m5e4XQ==
X-Received: by 2002:a05:620a:2903:b0:7c5:57e6:ee87 with SMTP id af79cd13be357-7c775ae04e7mr116877285a.41.1743730107913;
        Thu, 03 Apr 2025 18:28:27 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea58f95sm147401185a.80.2025.04.03.18.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 18:28:27 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: kent.overstreet@linux.dev
Cc: gshahrouzi@gmail.com,
	linux-bcachefs@vger.kernel.org,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 1/3] bcachefs: Fix escape sequence in prt_printf
Date: Thu,  3 Apr 2025 21:28:20 -0400
Message-ID: <20250404012822.188485-2-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404012822.188485-1-gshahrouzi@gmail.com>
References: <20250404012822.188485-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove backslash before format specifier. Ensure correct output.

Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
---
 fs/bcachefs/data_update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/bcachefs/data_update.c b/fs/bcachefs/data_update.c
index fe400dfc5d76..9fb020a58d86 100644
--- a/fs/bcachefs/data_update.c
+++ b/fs/bcachefs/data_update.c
@@ -607,7 +607,7 @@ void bch2_data_update_inflight_to_text(struct printbuf *out, struct data_update
 	prt_newline(out);
 	printbuf_indent_add(out, 2);
 	bch2_data_update_opts_to_text(out, m->op.c, &m->op.opts, &m->data_opts);
-	prt_printf(out, "read_done:\t\%u\n", m->read_done);
+	prt_printf(out, "read_done:\t%u\n", m->read_done);
 	bch2_write_op_to_text(out, &m->op);
 	printbuf_indent_sub(out, 2);
 }
-- 
2.43.0

