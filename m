Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FAC37FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Feb 2024 12:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707656074; cv=none; b=ODauglBqX/Sl+U87KmjNzjJoaYqPbCjLrYKB6aZWNuJxIZmbndYGuek+/maHKDIOHhET1CgS5ySLkiesHoFzme9HdxS0OevMCCRwMcSGF9jXLcVLofetMjL8OzM/Hyj8mJEfZ17mFK8ucUFLr5pI++3ZkjIH4bNflxPoJyLde24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707656074; c=relaxed/simple;
	bh=C+XQXwDD9N8THlo39OomPFlzmvWu4gIgQwLvf2U+jCc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=GRB1dUNPkomOio4Wtwgvi6vSvd9EhUmI6ahV5wHxlb89QYLypDvyFb8s1GSXTW3vfd0PBIDa/zg25p4QOdRNzlFYpNEm23i9aJKB+zlkHa9YnB+BNadZJMMTgvm39ijHiSJuPeZ6sqvZfvdNEHXrYOzGhi2u+4oOP7WG370FB2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjKprb8V; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjKprb8V"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEC97407E9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Feb 2024 12:54:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fo8yVYivcIY1
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 11 Feb 2024 12:54:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=shresthprasad7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0FBCF407E7
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FBCF407E7
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WjKprb8V
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0FBCF407E7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Feb 2024 12:54:31 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5ce6b5e3c4eso1753202a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 11 Feb 2024 04:54:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707656071; x=1708260871; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C+XQXwDD9N8THlo39OomPFlzmvWu4gIgQwLvf2U+jCc=;
        b=WjKprb8VWp1n8ZsK70s9axIs+xNDbESchlQWLFld5msGoqx5HBBfg4dwtboyZ1dqPE
         oFFapVOfD6yEhUJn2jUGzlfSNtA6wRbEVNMS6J3s20WZPg4qjA4Lu/smduhpbrIKwKom
         yLsYYkKVmNtgqfZ2N7nMD8qKtW7pWH4I5WaNcsGfhlYMgN56krw1PDTcGxLBCCHLTmSs
         8XbZ38xU24qr6HkNuVL+0OCdBDVcs+tqrynDHkIdc2F9Ts+2fr/M7fbtS5EjKIXSKVBi
         pZB7icCHBM+tJw3P2l9cyLAPfcBgv7YJXPA+CPh8/56s+waVOer/Obv8zcTOjEJtLM19
         88pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707656071; x=1708260871;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C+XQXwDD9N8THlo39OomPFlzmvWu4gIgQwLvf2U+jCc=;
        b=cBxZP6UHZ7TZCNdKk/TYwN3f8Qjz7K4kPKYHaNRZJGViXgge0nu0h+/6aKMdud6eGu
         mj8ESBHbAoI+FRIeS72DoV8UsAvtQF9KF/Xe0FrKQU+fEZinQjX4/IokOaM6n+Y2vRfx
         paKPNtugzYEOnTTpV2qM3id1Cin2gTD4d7zU215Orr7WSiONaDe3I6CYCc1ZtQn/21UL
         UDcIwd6S6J4eOE/2qid5ZnsCgv1s6Hf728dFJhYETVsL067YNeQN3OTo+XTIOGV1nIsz
         3prPdZPlAXYBjaU0K2P0A7FEAI+kkvmNosDTxhbchvTk2/FlWFTnJn68zygTRfUb9wy2
         mS/w==
X-Forwarded-Encrypted: i=1; AJvYcCXH0T8xAZ/vj7qQsP2UWbWjIPteuiwvM5qqesq3T/dUFwzKwP/SM0EGbkd4fDGWQhuVNjKmM6I2muumBdfUQ2wC7R1lxZ8CjeTiyvSt+MAfwsI6Y4QDtIbK85hqL9sA
X-Gm-Message-State: AOJu0YxcgrrUire1K02cfT000t8FOBVJ6TOwFmTbaHXeobFUYQa90oDM
	WltPw26hZRggmN8wFvJ/NRH2ffrGBTGQ0OqGyhqLWR2FsJLuLRpn
X-Google-Smtp-Source: AGHT+IEx1P+gJ/HEVuA6gr921gTOXVlkSkMwk8B77f7YKCvdF4xrlA6DRHKgxZEuCTaD0dpvKYOlsg==
X-Received: by 2002:a05:6a20:d707:b0:19e:3c4e:d0f8 with SMTP id iz7-20020a056a20d70700b0019e3c4ed0f8mr3281418pzb.32.1707656071274;
        Sun, 11 Feb 2024 04:54:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWY5o7/De9dzWdddJ0uWaxsYvSfYmI93GrIZshPkMOg98hR2Ewgh+N8tlMIWon2t5WKBja2k6RzOgapRhA67+YmgWLNIYMgdSz3l7Aq43EMQnQvgQN9LWrcsMXZehIMOZLpxSc+75AFa/3IyfQGVrsNLSDLS3mBZzDO/yz/rNj/DnyrxEFSBI/cuA4S+gV61zQ9HVVbyZN1mPK1uxw02WUyfab1OzprjNy39YS5oH4alMyq9+Hms1eLApdyraw68L1Ex3dgr5ACAreM3mNLo5KRlp/08l0sWATZV+UT3zkW4t/3HTFu4fo=
Received: from [127.0.0.1] ([106.221.237.147])
        by smtp.gmail.com with ESMTPSA id ja15-20020a170902efcf00b001d9fc6cb5f2sm4280038plb.203.2024.02.11.04.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Feb 2024 04:54:30 -0800 (PST)
Date: Sun, 11 Feb 2024 18:24:24 +0530 (GMT+05:30)
From: Shresth Prasad <shresthprasad7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: corbet@lwn.net, linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	shresthprasad7@gmail.com, skhan@linuxfoundation.org
Message-ID: <74d67b62-6fa4-4218-b51f-f0d33f19c422@gmail.com>
In-Reply-To: <2024021159-banner-dramatic-af88@gregkh>
Subject: Re: [PATCH] Fix malformed table error in gadget-testing.rst
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <74d67b62-6fa4-4218-b51f-f0d33f19c422@gmail.com>

I see, sorry about that. I will try some other way to fix the error.

Also, as mentioned in this thread: https://lore.kernel.org/all/877cjqa5le.fsf@meer.lwn.net/ has the patch already been applied, fixing the issue?

Regards,
Shresth
