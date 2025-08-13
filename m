Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDE923D7E3
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 12:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755088343; cv=none; b=mZSf7KKBo9PedhP691ylAtSUraEEp82qLF5VaH/AxVA7ack3OUNLrLcNJS793rYLeLpqfCVqqQVRQstDtZZgOKIyaza7Uvidsd0/0VdbpdF9Nvu/+DqXq01EihH2J4bU5avk3/S8vo+RZKV7UICLuFYvVbsVj+3uOa/d1Ck7omw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755088343; c=relaxed/simple;
	bh=78VP5p10Jg8NcnMtDmrrGCJeg8umSedtsXpZInRySm8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N2XDJBnc8OGVJFwrGtPAOa0nWP6NpNfH8Zs1EXvHTxXCgaiy0KQ9yyzB2uGpRfwEIMWbINTdAIB27mL47G4YUl1Ft6UKEJcI/rlC5RXer9GSJ9HdHC3Bu2ZDh5Aw2dClvviOkicu35tDBEQEE180QAMu1MA/3r8jQ1h/HjrNf98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=x3UUviIc; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="x3UUviIc"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A86B40B37
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 12:32:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R5TwTNUYBhC3 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Aug 2025 12:32:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=axboe@kernel.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CE8E94119C
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=kernel.dk
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE8E94119C
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=x3UUviIc
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CE8E94119C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 12:32:19 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-af51596da56so5060690a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 13 Aug 2025 05:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1755088339; x=1755693139; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNG3CwDZnVq+LlYCqJlDgz0JDJC7ub+N0Uk1MeSzHuI=;
        b=x3UUviIcB2Yj0n3IpOeN1Ikly7fUuc0BGFjn7+1H5p/662Opd20E/3zxG99XRwHTzq
         ZbWBRaAXcUOuTtlQcj6wWwpaRhIb1/6fFEBjEMf7s0t5F7csUT3NxGM8qopMRN3u9H5Q
         S6vrAcSaM8JcsMtMulBORFW7WSzsID3QwVXvZP2UZADHNC8de2Nc0NDMbYTHtoIS1Cm/
         IY24bHJOZiaJ6Csyfqm759fbjhlzsIE0XuVnpodfIB417RvrUukFtRcMM3HBqdinwLLu
         xdCCvcaJ5ik+ZDo13zt5P9K8+9CZ9MRuV0RhIyn5AGG5bQj1aueAP89+0spIJntXK/3G
         WmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755088339; x=1755693139;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNG3CwDZnVq+LlYCqJlDgz0JDJC7ub+N0Uk1MeSzHuI=;
        b=hekYf0x5vXOEeiQxcR1tvqlOYy6MFVIJoJbQjzFF2/+lyBcyqIGzhnDUMyFPRPgkvr
         l3FmbOjLaWk/5k7CNXIg9xkbTFblCBlEm0GwMNO5PcYUdPl415VvtSR5uXsctrow+Zp+
         g4d4aW3+jCHNN6MtKUFCCYxgnXOHz1ZP05BH/BDCb5r2/SdnKtcRyEKRDEbLQ4lpbZAv
         cUa1OFUhKH15TphdsxM4awcWi3+gChy2m97Vv7wxEZUpqXqjdGYdeHEj5cvOguFUbDS6
         enXjacASkr0mwTwdjcTK6Vl0WcADfinWmmVD2f7/N+wuKHN0fif6Q3rpdQdF8OP5rtmv
         bUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUG8kytjMaWAipLspatxGg3kGP+zeSwLxDyMP674tsMFZPbiexTTyfZuHBjgaShXmV3Z/l5lZGL1TivPLI77tg7bxDSQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywcb3gRYoC+vsBWdjToTK/D74gmo7BCdZz5Cwtm27jbEOcOgvnI
	tRYp5cUHnACWoRRdBEBys8apacbxq4pMpYwzVaTu3+8oXt2w5ZB/du7LQ95EzeYIZmc=
X-Gm-Gg: ASbGncugfErpya5wXMXilegKWjKDJhdjcWuiAoIwcMmK4LG6Af5liK6qExamjqCzclS
	jW16gCtOLDZffdkuo21LnDlbr0T+Y36nCKlkj/cOw3abYu4n2dEYV+DkKuRC1L0cqqwOhupG7/e
	6nJmtLwgxTI5l9SrAHLBKLk6usgx6ShPwSj+LbBn624TVKDjdSK5HXg8xb1YSD6qscJmvSC7Mme
	lsJ+tQZBZ8H82mc70C7PIrFVQ5ktqIknjLoartSuMSxmmZW2+A+3F7c8Huw+SakDJlLiWIRvB69
	Pw1eYS6Y0aUvEUPAC9M3K/8o0Vq4Ug/XuHw88aGc/tqEImZbH3lrfGQt/9e5qBS+Pq497GPeLuB
	5E4EYSnXJYogT4Fs=
X-Google-Smtp-Source: AGHT+IH45G27XmEuq78X8gxw6G2P5IIWEUKaJJDkJWCvlT9IOAHkUHlLvMF5cfFKCUbmxNPSZShPMA==
X-Received: by 2002:a17:90b:5211:b0:31e:fe18:c6df with SMTP id 98e67ed59e1d1-321d0e5cdc3mr4379625a91.16.1755088338731;
        Wed, 13 Aug 2025 05:32:18 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3232553e4a2sm82418a91.4.2025.08.13.05.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 05:32:18 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Damien Le Moal <dlemoal@kernel.org>, 
 Philipp Reisner <philipp.reisner@linbit.com>, 
 Lars Ellenberg <lars.ellenberg@linbit.com>, 
 Jonathan Corbet <corbet@lwn.net>, Erick Karanja <karanja99erick@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, 
 =?utf-8?q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>, 
 linux-block@vger.kernel.org, drbd-dev@lists.linbit.com, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org
In-Reply-To: <20250813071837.668613-1-karanja99erick@gmail.com>
References: <20250813071837.668613-1-karanja99erick@gmail.com>
Subject: Re: [PATCH] Docs: admin-guide: Correct spelling mistake
Message-Id: <175508833758.953995.10420055026430792302.b4-ty@kernel.dk>
Date: Wed, 13 Aug 2025 06:32:17 -0600
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-2ce6c


On Wed, 13 Aug 2025 10:18:36 +0300, Erick Karanja wrote:
> Fix spelling mistake directoy to directory
> 
> Reported-by: codespell
> 
> 

Applied, thanks!

[1/1] Docs: admin-guide: Correct spelling mistake
      commit: f7a2e1c08727384cde1c686dd57172f99b5f2e6e

Best regards,
-- 
Jens Axboe



