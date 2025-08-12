Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA97A10785
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 21:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755032529; cv=none; b=SzU2nYU4McwROx0V43cw78LZHseyMNFXtfNiljqfCPfNPNPbog7Mtuyy0TcHeTyEOPAcCMUCyBr+6kYkxG+u2PwDErXImyeCEN6oBgsWmHfTbI65JjGicOFCA8AEOXB8NANzrH2VsZ9iTGPPIkKEQliOT8XKmMkGbTFI5vtCRyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755032529; c=relaxed/simple;
	bh=Wjd/ahogiecuD3R9OKIm36BoNSARgTSM43ONAw1Cw38=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IXVExiDjnWy3LXkLuyFlEwbtCw5hZf5IC226s72uj5gJ8eeEOGl8XqrQrW7K6BnTf2OsPU2Y/qJP299iOAn+7ozM4MKJP3rQ3HUJH2Q8eQzDFPiqtW1s3AKQI/y+2MCINT4s+mNnS8fAiYOh6vKoNbhbswJ3TaO+larp1/EjcyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfmVx0ty; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfmVx0ty"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 785F6414FA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 21:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.486
X-Spam-Level: *
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XD8uBEEr8XNQ for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 12 Aug 2025 21:02:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=sohammetha01@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E751741442
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E751741442
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QfmVx0ty
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E751741442
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 21:02:06 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-240418cbb8bso39000535ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 12 Aug 2025 14:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755032526; x=1755637326; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yUX7gcveClSIrdE0BJLw2amSV/HKqF0s6b1elSyy6f4=;
        b=QfmVx0tylvXDBiMdJ4glCRzJBFLRbpnO7CLClZl2a8bIVMF0vLBU7zKHDANnfRe9ca
         dgL8y2t4TKt4TLTmpYoniqR6La/OrBei9rccEd3yT/daeXfUxk50NA4BvRaj7H63sYLW
         Rv/K2Ou0ZFoBZR8jlmpcTRji6Yb0M5Q7cGiBuL+8VRxJQtaWWHGZqXNvKcy5Sw/9uuYV
         SsVTVTGhKEhrVbBUnhtCDycv4OjYlSx/tE1+JcBBHXr5KCCR0zWZJzPp1bUfL9KqXerx
         IUz6F300OnFJ8Qdm4kPwmTwtkxEfpGRu261CsqtvazNKAxTmrRvc7S/3PeduGQh7xlfU
         6yHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755032526; x=1755637326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yUX7gcveClSIrdE0BJLw2amSV/HKqF0s6b1elSyy6f4=;
        b=M+mU6TzIpmuisrQQ6QJBNjMUSrb6uYyQ3FFIclZeHf3rAVED3AZ6OhEsKDK1DWqjKK
         NQPz91m0rqrQ/DmD6nsR3IcYM9x0t+A3WGajSERrkS3acD794V2Lg5xv2wYAus3Fvz36
         s0sNfL/5ooUzLplIgYkMpTfaYL/fAKjRtvIqLMn4ngcl2ySau/La21qWrrF18Bqgmxva
         uDrHj/SHfzt0cfWgCDZPxQi87YhMa516re715m7t8ZWQSul2stJRiknn1WhJT9DYwgXx
         B7UWOoWANsmKcDNYgEvVEnjI9zVkUb+9wtDusmFhT3yRzAtiz3NNCXudO7hyeR0rJHKz
         CIbw==
X-Gm-Message-State: AOJu0YzeNPV8b0yG9XF0Qak85NqAgy1VWdvUsK9W2F3yx/MiaKLi/j4i
	rZD/4qx9GgZrfRYomx9DXnR1ti7pK+YEJLIm1xz0IP2Ine1jqReDDKeM
X-Gm-Gg: ASbGncveDKP9N1XX6HlHU7w/W7nMGwDFC7ENj4l02hRoBw/7eYbVvF5CEdvXwMaOmNt
	HEL6JFA2D2y3uuqYmRjZqnwGv9J5VXU7FUgTv7TYh1e7cnwcuwtLYnGFnd2T7dFj/MuBGyor0pc
	dNqvWlU+h8rwKguFlYW41ysLzDlznU2ltd0B15kNPlJjfxER8UcTwBzzcij2WiBryn08iKuL6VZ
	QLJOkzjkvvmJU6vpZMS4PSKViuoW1Tk81l+R43qj41jMuWVuLSJYsI+/yIPBsy4v7HlOULRl9Mo
	I6k/2t55yBjKfi3WFzbiwNCppYmSeSUZcuV8P0ofGIwWkGGMU1HdWvXXAhRIL033DD6ARqHmWQL
	awOIsLDvfEVKnEyGMcUo9zFuGNH4yGBY=
X-Google-Smtp-Source: AGHT+IG5HhRI1dJGdFhVyXJWTJMYfeHiiVoFocn9lDW/pZPQ1FY6QgBZ6fzb0uVeJ1TJa5I46J+X4A==
X-Received: by 2002:a17:903:1a6f:b0:234:8ec1:4af6 with SMTP id d9443c01a7336-2430d23430bmr8457295ad.45.1755032526121;
        Tue, 12 Aug 2025 14:02:06 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef65d2sm308426255ad.31.2025.08.12.14.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 14:02:05 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	corbet@lwn.net,
	Soham Metha <sohammetha01@gmail.com>
Subject: [PATCH v2 8/9] docs: admin-guide: tainted-kernels: fixed spelling mistake in documentation
Date: Wed, 13 Aug 2025 02:31:50 +0530
Message-Id: <20250812210150.74095-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812201523.69221-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typo

- userpace -> userspace

in `Documentation/admin-guide/tainted-kernels.rst`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/admin-guide/tainted-kernels.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentation/admin-guide/tainted-kernels.rst
index a0cc017e4424..ed1f8f1e86c5 100644
--- a/Documentation/admin-guide/tainted-kernels.rst
+++ b/Documentation/admin-guide/tainted-kernels.rst
@@ -186,6 +186,6 @@ More detailed explanation for tainting
 
  18) ``N`` if an in-kernel test, such as a KUnit test, has been run.
 
- 19) ``J`` if userpace opened /dev/fwctl/* and performed a FWTCL_RPC_DEBUG_WRITE
+ 19) ``J`` if userspace opened /dev/fwctl/* and performed a FWTCL_RPC_DEBUG_WRITE
      to use the devices debugging features. Device debugging features could
      cause the device to malfunction in undefined ways.
-- 
2.34.1

