Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD061F61C
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  3 Aug 2025 16:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754237684; cv=none; b=iuXntphAO9QAqYbkxWdxBt/XjlEnZ8gvvr3ZwATgQ1dtaSWhKxYVFDUZPCnHQ/q0Efo5mMe9PbYlNKzrunFRHY5Wscu/WtxX3l71K/HUqhPHGBRYA0gH1xljXN6ZqdijCa9Q/CvXFmE5UreEjxbOmmz4Kst/V+zMC4dAs1/muVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754237684; c=relaxed/simple;
	bh=JQpFEaDLYhO0uu/gdllj5IbvKTRqfxuInh2LybVDw4Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=syMe6BHObHz8J1nJjy9zOPbKJ76e18tM2F59fHknzrfJJruP7NTNz9AkmbL5Ay46678uzxZVSCzBDMo3egdcsKTTke+7gXKWh0bUe0rcotbP7FrvVOC5XxsxhOhFa+TFz5ai/poCi6FjVeDW1JdQIoOM8/o00gvvochNtjZjmmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=RGlk+WRl; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="RGlk+WRl"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76bed310fa1so843794b3a.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 03 Aug 2025 09:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1754237682; x=1754842482; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQpFEaDLYhO0uu/gdllj5IbvKTRqfxuInh2LybVDw4Y=;
        b=RGlk+WRlm+2b955Whvk3w7aHJPyXrX0pyWjriMWR03t3FoMVRgWGoI4W8p8VnYKMIa
         pPCdviZSjfTikJQV3j/IwJqllE8uN46V1y1ffrDO5xDopnNc5F1zdBEC/F1Oa1PuaVQC
         fAoCDKHk5++5CgzM5ndrWe62TnB2mDeatNYudGvrFC57nruDHRktDsdQyZh69w11fdJN
         LtI73MBg6jUMlsYmJQoAiRj7U9h11HpbuNdGTd42mN5wbeMbJ6O/y1sNz4zFKsR7tQOn
         lcqnch8lImPRcb1QIvP2bhEKFz32Wr0pPRa03Hl+clN97YfNLmSncLD1UKPgxmEtsYQf
         Q3OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754237682; x=1754842482;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JQpFEaDLYhO0uu/gdllj5IbvKTRqfxuInh2LybVDw4Y=;
        b=JAkubaPECyimYC6YU8Vbh7lN3Ydu+nwiNxZxu4ArZG7Ogp4FaLpUl4skvIEarrbILa
         27lOjKckwB6sicbe96S5uxxQLI/xTIvsn5bp5NIOvTgdPC2+7mRl6pbF4kC5y5s3GqAv
         9g43rlemAM9gP+AF1zrKItV6T7Weztt+skR5yXQup4cfYXXF4RoLcW5j9y+Kx6qlFZgi
         NbGjmDx6Vqha8rh/4M5RVN9Ma4rjXn+v5Ej6aUCvvdy3aA2NWap8Pg59dZ9sYtqu/EXf
         0WXMrZ9xo/fcTBaXK8DS8VCk8BEDfVPi5KuyRXizkXCX56IxbR4CAKgybsId7z1mVc6z
         PA+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUTMjrsLuK1Hp5SZlag+eeggZVUrD7hJ+sqVu3aCMZ+lnziHV4utwmeRRyBhI0UVeNIAPxmMmGIWsCMbZl1c1oY3InvcA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZQ+oLUgEygUoOW4OZKpotoiXJXZ12aIpNn6T2yCzS/vakJR/D
	VDz5yCIbhMNw129fiXAqbLlmw1Fv5A8bupRr4h9eCjDj0vPHlnpaz4BAkKbrk1rxGCo=
X-Gm-Gg: ASbGnctf+kbxi8pi2/y1YguIXhUpmn4JmbwCvXowFOT2u8LOP+GvRF9XZfrc/mohi8z
	BRTRxTNso7IEdksBB+YAbEnjfYYSvpMocM0TKvSlzk6KwYdaz2sc5mOFkoAZFm2zh4dXcd33S2V
	IJ/7YfVzkKV5xNwfDzmaWZgIZAToBi+EnG1rRlQobL2QIJ737NWTBY9ZAyEvGbuL+WgQpEIsxeD
	Yj937+FPmU6BiKrIGofO7O4FoM6n9nW113h3yhq/Biqx7+2KCP78IPZ1YPU1tQ71vDXuBi0nC2u
	aUrEkz+SIHS/sLYQ/o7gff/+0tGp+IuDkP337sE85PggE/zkuH0jTezpW1TbTorwfOYghjLVQIU
	d/pEna2PH8oyQQlp8WKs=
X-Google-Smtp-Source: AGHT+IGEvYduDzdbwcJ7TQCIF912GvAtfZiRW2LnM75ZKQVh2Lue6+FoQSH0fMutpndDgLCvq3uePg==
X-Received: by 2002:a17:903:183:b0:23f:d903:d867 with SMTP id d9443c01a7336-24247013eefmr93455085ad.35.1754237681805;
        Sun, 03 Aug 2025 09:14:41 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef6c62sm90444995ad.4.2025.08.03.09.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Aug 2025 09:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 03 Aug 2025 10:14:39 -0600
Message-Id: <DBSXCWOKT4BE.1RD9LVC2CY12E@brighamcampbell.com>
To: "Tomeu Vizoso" <tomeu@tomeuvizoso.net>
Cc: "Oded Gabbay" <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>,
 <skhan@linuxfoundation.org>, "kernel test robot" <lkp@intel.com>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 0/2] accel/rocket: Fix build errors and sparse warning
From: "Brigham Campbell" <me@brighamcampbell.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250802-fix-rockchip-npu-build-v1-0-fb0f0dacb3fe@brighamcampbell.com> <CAAObsKCUs0yn=S1PzGDKu8nNnTOkxqMMYzep-QhG00X1CY3DjA@mail.gmail.com>
In-Reply-To: <CAAObsKCUs0yn=S1PzGDKu8nNnTOkxqMMYzep-QhG00X1CY3DjA@mail.gmail.com>

On Sun Aug 3, 2025 at 9:33 AM MDT, Tomeu Vizoso wrote:
> thanks for the fixes. Will pick them up. Hope you don't mind if I
> change the subject of the first patch to something a bit more
> specific, such as:
>
> accel/rocket: Adapt to changes in drm/sched API

No, I don't mind at all. Go ahead and use your editorial discretion with
the shortlogs and commit messages. I'll put more thought into the patch
subject next time.

Thanks,
Brigham
