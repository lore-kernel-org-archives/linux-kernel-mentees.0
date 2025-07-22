Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C02E267C
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 13:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753192575; cv=none; b=ud0Y5gulQtb+kV7E5ZJCq3PLsRCx29RbtJaMBd4Xst1P6nahR4sxOSkedvDO4fHc/nWgh72j1rLSndmU8ivSjIsXCjI63JQlT8SRbJ5Y937xRPIc8y28bUJOrhMdPPlC0IsSESxbXcTk7lwW3ix8iHYRLXepKSTIZvDScLHS3ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753192575; c=relaxed/simple;
	bh=DhzF5l7I2J9PMPvJauS2hdz6oE81hLeHaGvhhBQ0rcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iFzhVnoy1cyw/B6SkUkNjcskSMWgNrBJ1QvJYhSu7twUA7P+I9gMMEk6cca7xNSgpTEUK/2ox2KqMZUDPL3+PpOqMcDZgzGxChB2u7TlP6m4gNqXmGrQqsDxvtAU8djZhv4k0lRDW25rQk81BfA6DhFVxw1yimO4UHm0KenIC1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFtqvyhQ; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFtqvyhQ"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-73ff32d8b8aso12039a34.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 06:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753192573; x=1753797373; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Cx7Gr4DreWZzf57vT5GiVKqhh9yn9qywfvm6GXChIo=;
        b=XFtqvyhQq664Gve3HltSGb4FLoSks5LkI4g75gImnkXuGkLjksdWS/1LGHJeTvRAcf
         oFmJ97ZKmid9YUDmGQIprgl6bIzOLqMQd+yvoWDjSL4wyvkc8xQJ9ROaQfsqOs6w8aNp
         Rh5fUT5LXdI4EyvblKdwz/Wp9azw3vfEwn/VwrLLRVmbnnu1fyiJlXSrtS/MqEY0EbcK
         NYxWuqkfg7oT7J7pJdYcxcL18qv0P5a0afVD0kaJBABsrIVrJmDf9Rw7nGcgzVw/r7AQ
         7kmNohpySmuAQkgCvYucy++pjxQMnQ9JYYfD62tMacW/sjQferuOI2xknUCxNZXP1Ixy
         pG+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753192573; x=1753797373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Cx7Gr4DreWZzf57vT5GiVKqhh9yn9qywfvm6GXChIo=;
        b=BTKoRWPxkcYtZub1NIo1Da2sPy/BAe8LZ8MF6x2BukNng8Fs4WKBZILd5EMymal9MT
         793e2bV9j155TJMFb/is7TQUpKiNPCf1+XBc1KZLb/Fwig9SrbynKW98LFXQa/toH5S0
         QbgYd2gS7EPvrKpTU2CVeSrxI08hF86byLscFiZR5LmSYJH8vukgsr8Lh7+YzJVyv5ey
         JyTPKtOBTd3aF3Ts7pKrPGeQf7FOUwUd85UKR3jI60ArfdY1m1+mehryXDDo2DCp4cVc
         H4zbv28Nx9wWY8lCsiFFp/gL7rTsZEpyL/abQN1eAQyez9XYLsA2lHKz0SJLvu0DAiGV
         /dOA==
X-Forwarded-Encrypted: i=1; AJvYcCUni0tM/L2uxtUmzrE59Y9q1uiEPdbXAQo7EbdGLziZRpMXw6uRlAOBocLFPIQvTr6vHkD/22nlhgQjRunhbjkEvYkk5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTeZznb1pFGZcY9iHeynEC/G6pKh7sUjfYLlzEyfTbgnUcE6TU
	8YJx7Lst1JX74LeStN0FN//meqApr6f4TJQl9FDXMV2r8lO9zx/CzzoP2w/ivYYRs/WNOX13jhU
	vLc/l6Uz45AGwY7TttMnaz8hRYpajFEo=
X-Gm-Gg: ASbGncvVobHY0CK6FHYm9u0KtBRcnInMYpxTklzuJpFcKiupoIRQG+sLNiS0luCK/O2
	ItpNP2GGH6WbVMek+qwvM5Q67WvnxOYS9jeh4cOfZ19t4zkAsY7fyOy+Yqm29C0EubxAV7mVRSk
	7Tzq8FmbZSIQ4zWk8jd4+B6fScIgke5yPfoGLy5pW9oeZb1CnCqcUhIE1AL1LoR1nFMJb+kiL72
	+CNDeVy
X-Google-Smtp-Source: AGHT+IFNCuAiMFBJ+qLVy6zUGnB/dKh48G/ViCbOJGiiFqe/aDQhU/3ZxV4HrZVa0+3fH4m9NVoCspjXq3ql+dJ3ppY=
X-Received: by 2002:a05:6830:4d95:b0:73e:93a2:3ab1 with SMTP id
 46e09a7af769-73e93a2430bmr8842207a34.18.1753192573261; Tue, 22 Jul 2025
 06:56:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722071508.12497-1-suchitkarunakaran@gmail.com> <20250722063659.3a439879@kernel.org>
In-Reply-To: <20250722063659.3a439879@kernel.org>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Tue, 22 Jul 2025 19:26:01 +0530
X-Gm-Features: Ac12FXwq_HIr-ERaVbidZeD0S6zF25cECaoEambmLTcpXNj5Hl8y43qwAqmpj3Q
Message-ID: <CAO9wTFhghrrzH2ysTiBqNrZ1dbb001Y6rWYiKRTC2R8PBm-Zog@mail.gmail.com>
Subject: Re: [PATCH] net: Revert tx queue length on partial failure in dev_qdisc_change_tx_queue_len()
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com, 
	horms@kernel.org, jhs@mojatatu.com, xiyou.wangcong@gmail.com, 
	jiri@resnulli.us, sdf@fomichev.me, kuniyu@google.com, 
	aleksander.lobakin@intel.com, netdev@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Jul 2025 at 19:07, Jakub Kicinski <kuba@kernel.org> wrote:
>
> On Tue, 22 Jul 2025 12:45:08 +0530 Suchit Karunakaran wrote:
> > +             while (i >=3D 0) {
> > +                     qdisc_change_tx_queue_len(dev, &dev->_tx[i]);
> > +                     i--;
>
> i is unsigned, this loop will never end
> --
> pw-bot: cr

Hi Jakub,
I'm sorry for the oversight. I'll send a v2 patch shortly to fix it.
In the meantime, could you please give me some insights on testing
this change? Also, apart from the unsigned int blunder, does the
overall approach look reasonable? I=E2=80=99d be grateful for any suggestio=
ns
or comments. Thank you.
