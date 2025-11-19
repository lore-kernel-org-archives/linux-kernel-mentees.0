Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4729835C1B4
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 13:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557733; cv=none; b=QIoUjDhvTDf/+YEttsDS4eZaqU0XSw66vOZd+2dN+R8PugwbU7yC4yMEJ6wl1ASyBsJ3e7drZGFnFA26kK1Oebaw+i552AcxUj7doHHntJVtiHbyHoB+bYrwE8KfGO+PgaoRZCKkIQlJQrV6IolfvPbKdUL52zQpgSM5kZAvfrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557733; c=relaxed/simple;
	bh=YsL0AYnXumUBQnc+9fO+VM0kAJ6xf20Eqs0DtXKmmK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MZgUc4yu3iEc78/DFQvk4tdrY0Uh00YpqF7CsKHHiQW1I0PSvBBk8W2Ea8kuAOb0vgKo9zVOHe7fX0YWCKQKfASKplzgQVsjRiQnMqikuJtnApoY2M7oeYTPw2pcoziB1KPFG0mXHsq9dIMJKgfNFXoKhUOaLAp3f+oblk/iTYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHtTkFAm; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHtTkFAm"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b9387df58cso3568807b3a.3
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 19 Nov 2025 05:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557730; x=1764162530; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+pka5H9kFUv1dmO5g3fWy4qDHiQHPo4xC/Gd1txKK28=;
        b=kHtTkFAmaKHzqf+vnaZair7UfPHOr+RDIf997L2zMYEU567dl5d3ak0mYltvTAErsL
         9P0Bt9WJazUk98/N9sa+ix6xrS72jSBvYMI/ewffeiDGxiVLDZnpS/bpYJNcBFN2+17g
         rpnKPhVo4K/hJroKobYsAK9ybK6mj9RV/lbd0xpPWkEFF0ghpCDiQw63WIqsH1ZoKbKj
         AhjNKelnCINkyyaVL4Q0+HxIjK5yRv03wUff4syRFWP848+xEoKeeUt2ymAF/cneOVaH
         QW9vP7MGX7oHIapE90IGSl3HlOrTo5DC8+f9BVTv18uPpAiWDvplo0IuSz4XVoFpzNvh
         CYMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557730; x=1764162530;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pka5H9kFUv1dmO5g3fWy4qDHiQHPo4xC/Gd1txKK28=;
        b=fdIknPgVThA72X28Fay0Vrsq9q3XmNo9v3xdlD8bsZyr6z8kf87orKcR8VtfVRDe7c
         j0In6W6zAIRP3604+thvPKqcsWUgKwFWCn1YZYgqkUwa28vK4d3jMg0V++lDlnCzKRXj
         PHbpNWa+uOda0vDM/cwNEUMXdQG8PP8KtN/AI4Veoq1o1LztI5KYd9PpqG+s5iDXizlH
         9190LMemLd5FB+24SWZb/038TJ4vamnD/aSWxfWfSil0rpru9vNx/8HNx5IfARtmyOk0
         NRP86fLmn82Y6lQYxN6vOTHYzpJ3NTTP522VNmizfRv8JCuBvJ8Eoh4ckO+v3s0uSxOZ
         rXjA==
X-Forwarded-Encrypted: i=1; AJvYcCVJYIilxHjzC4SStyKvEBEinUADP/9TODgGzBn5wPMy7/TBOrZ8HYdeoIApT5M/RbLhpen3nmy9fOojQ1R3fjnw+2Otzw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQBynRkfKn96g31ytcLXAwzlwQpC9sFkvE+ajPZCETrRq4pX0u
	c90FSduGIXlDjG/wgVo+rnmo5oLoNcjcIh7G9DL9vlLv/UPZw7NQjpGd
X-Gm-Gg: ASbGncvlIJZN6hVyi9yFkRBBEfswY1qm+p+/MxOgfBgiDs9XhQ4hZoPhvqTXpOrX+jg
	ABg7YtE/i9WdIRHxa+J33wNJeaBzDFAn82OxTbRNs6W60G/TQLUJlHI45NAD6H29plS8+Gnfhuq
	DoTua1peUBiyPUdNNWe+ZecSEowaZUHLFp2wwLIJHnG2SCQf2FT+FgxqYo3EmP48wSM9n7BWJBA
	V8I1v6G3ObYGeRK9wlvVe+gs/7EHzJbWcyWLOHAzE2m0uVdf2UCTmg5iT8hF4tn29LionRfMA85
	1y/lOO9AwbvB4MSfVvcU+uMc2vDGSy2C1pgVX3PaoLENu4BTZEB9xVOJ+eAUTWayTOyi/bUJSMH
	gD1rslwPYxFgZpYBX/A6zg3y41BHUcBvJbJL7sDIwoG7D6W0reDpwiQkRAmltsJ9nnMkBBfb1aG
	l9CQFHO5zTuartfM6ocKE61QB1+d4DyeWKtWw=
X-Google-Smtp-Source: AGHT+IFeiPPsgMwUrz+NVNeZBdU0F9V3EQoZEFmmpjgoxxwzD29n/Cn3DjmHZDOpsNrUlI+ZWWVVtw==
X-Received: by 2002:a05:6a21:7e08:b0:35f:84c7:4031 with SMTP id adf61e73a8af0-35f84c74952mr12399522637.55.1763557730359;
        Wed, 19 Nov 2025 05:08:50 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:08:50 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH 0/8] usb: gadget: dummy_hcd: coding style improvements and error handling change
Date: Wed, 19 Nov 2025 18:38:32 +0530
Message-ID: <20251119130840.14309-1-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series focuses on addressing various coding style issues in
the dummy_hcd USB gadget driver. The changes include simplifying error
handling by preventing kernel-space crashes, improving readability, and
ensuring consistency with kernel coding conventions.

Clint George (8):
  usb: gadget: dummy_hcd: replace BUG() with WARN_ON_ONCE()
  usb: gadget: dummy_hcd: replace symbolic permissions (S_IRUGO) with
    octal (0444)
  usb: gadget: dummy_hcd: use 'unsigned int' instead of bare 'unsigned'
  usb: gadget: dummy_hcd: fix block comments, blank lines and function
    braces
  usb: gadget: dummy_hcd: merge multi-line quoted strings into one line
  usb: gadget: dummy_hcd: use sizeof(*ptr) instead of sizeof *ptr
  usb: gadget: dummy_hcd: remove unnecessary 'else' after return
  usb: gadget: dummy_hcd: fix miscellaneous coding style warnings

 drivers/usb/gadget/udc/dummy_hcd.c | 139 ++++++++++++++---------------
 1 file changed, 67 insertions(+), 72 deletions(-)

-- 

Testing:
-  Verified dummy_hcd module loading and behavior by checking dmesg logs
for expected output.
- Ran compiler testing with no new warnings detected.
- Ensured the module builds and inserts cleanly without issues.
- Used Static Analysis tools to confirm no new issues were introduced.

Please review the changes and let me know if any modifications
or further testing of the module is required. 

Thanks,
Clint

2.43.0

