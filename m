Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF721E1E15
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Mar 2025 16:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743007003; cv=none; b=XjxNOlzYIMW1PAHU2asUm2DEc1gcZ4WGmcC3aJngAKWa6O8BfuWZMatRsS1skvMo8gu8B83fz6NNkkqlFFfDf8uDyvcmRwal+P49TxkMC/+vQVH3zujYtx/PvW2S3USYOR2Iussi5enStYmnrbsAAwGsLhpMJm+KzBXxSl/ls6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743007003; c=relaxed/simple;
	bh=6mWmDn/vwQjaqRWOjqw8W9vSJLyQ7uRqskH0qXRaOfE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PpCVr+9Ip3MN/pSD8raTv+44ZmGkQq6+BgZ4kSAXgyBG+4xtHKslTGZdyjDyYAdUo9caP31C2K6izVMlmgTmJknPppp3Nz9mlu6d5ji6VW7WCgA1lcfaZtgFGPBcFJ18nqPd5OfakO47m/LBb8xeTIaCRWMldVTkdsxil8vZo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hj7hPdah; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hj7hPdah"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-227914acd20so19241925ad.1
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 26 Mar 2025 09:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743007001; x=1743611801; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mWmDn/vwQjaqRWOjqw8W9vSJLyQ7uRqskH0qXRaOfE=;
        b=Hj7hPdahIbFf8C2LoBP6g9UxKTrOhZfLDZVo/0aajB2tfx4lGBMZhYZYKkNfRq0jtH
         0ag7mK6pe0rD5EOwrYEiXkHa3gJoUiY2Z9ipEfhFg2CSCebHAeiQQDwj/3OSkLiuWtig
         fxG2on89FsEJYKKXScoRC859cwBjYoTLl7JfUE+uiBUopsPek/S6tmQ5xrTRK47kFiTK
         inL3uSt36n4nCJmWGdiWkGLDHwVMxti1osH4oVfVKJZ+VL+N887NkFkCMHuarhZyoW0w
         BnNHsBocHx99vI9P1FsXiafsNhMXKK7b7cQRlx8hiFKZqC75CBIfjRxg9GE/uctf0Ia1
         Agew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743007001; x=1743611801;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mWmDn/vwQjaqRWOjqw8W9vSJLyQ7uRqskH0qXRaOfE=;
        b=Gb+7Qbzl/vlFWznJihRuu6o7v3yFXLsKJeTvy8bb73xzRNYP2lGYib+Fmk/KvY1IPb
         nyi2qlayTQO4mEJ+aDm+GWTJq5kKA7rYT+3jZe5lC/jU0NGHw00QT8bI8BhSOLoY5WJ6
         IeyHR/Yct0SSIzPjt9pcSJ8XuYuA2NCI9NL11hpQ9i0wd3rtjfpYVJpkXuaQtI4EawWk
         nqGSIiYou6YH4hE7Y9QUQmNx3g26jE+cgQp5Acw70z/9nL7+Q3iocmAzCZB3GKWzrKOE
         LQnFZiRb7Of1LCKmW6CojRtYYAHZfKHuZRDTHqqiWXfe/aJWCyj7pDPpo1btbTKdR2Cw
         7SYw==
X-Forwarded-Encrypted: i=1; AJvYcCWJOvbRYJSiI08FeqwJzX3wJmI3XkRD4G4vC/M7nst75GzQdkwrnB3yV+zKtZDkv5ZzP4QMJpNBHIGHn3jB94jyxunKSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyLYkUaGtIV9hoo8hTQRDka/UbFWW/Yafg810sFiZZuubNCktOV
	Pk/im+Z8l8xN/K/ZLbXRg8/7A64TBRcXR8RnxYneyA7C1yr6BWb3M7D9eg==
X-Gm-Gg: ASbGnctCsltKFqd1Z9e+Aw+L3K6jyVn+2HiQ9lm9qIFJ3Kw4+HHbSMnnv38clys3Ajo
	ZqrFiqXl92iNkRbH6wqqQ4eVmgYaGvrJHlwjkExnlJAC0u81OyS3fT1+PsYZO/VYtVKju3XpVJZ
	wP1P1cEotyMavYIRp2Z7yFnthl8fNCF5a7x6aSGHrfVQmcHYdnwCPS5KF9GwZ+jZ6tfzIiyQEoD
	qoTBo00iJay2SWhrZIGDcACRjb9gT+Gq0k6YDKUVClVBdgR7CHajpJmJtMlAcMe7XmYc6a6ej2D
	B633K08DyGG0JWzLZY2G94I7pRrJ
X-Google-Smtp-Source: AGHT+IF4hhgIOESc1Mbr0Ua+WQCkZHP/YTSj1YxH0mu56wB2fjjCrHWD3lqYjUaK2gx3XVSK0xcdjA==
X-Received: by 2002:a05:6a00:22cd:b0:736:b400:b58f with SMTP id d2e1a72fcca58-7395134cddfmr6922470b3a.0.1743007001291;
        Wed, 26 Mar 2025 09:36:41 -0700 (PDT)
Received: from smtpclient.apple ([2402:d0c0:11:86::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905fd576asm12372890b3a.47.2025.03.26.09.36.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Mar 2025 09:36:40 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] bcachefs: replace deprecated strncpy() with strscpy()
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <vfszytfd66lqj54nmkymhnrdjodylb7l3alxblzixnlzv7kxom@4dji3xuvmknj>
Date: Thu, 27 Mar 2025 00:36:25 +0800
Cc: Bharadwaj Raju <bharadwaj.raju777@gmail.com>,
 Roxana Nicolescu <nicolescu.roxana@protonmail.com>,
 linux-bcachefs@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <A4568396-D1E1-4D93-851B-FA9CF9804E10@gmail.com>
References: <20250326094449.16473-1-nicolescu.roxana@protonmail.com>
 <5F3AB2BC-43DA-47A6-A07A-72540B327D11@gmail.com>
 <bmjvipermsvb454mdh5zmlmw4gv4oub5fgh4eowedlit75gqei@3or3va3e52ce>
 <MnHJR6KH9EcCqnLtdxKf3XYBSQQbvXWJafG28O2C2itnS_eETVFoDMfVvFva3dkLMZ-LPRWUhG2g_5HBY_lPZkWOYW2aOg_T4YWTrzXmVZ0=@protonmail.com>
 <wdagx2vwyv7s2t2tcndwmambwdhmoitvhmnzcopdl3xkfq6ct2@evmzpxnuhi4e>
 <CAPZ5DTF+Q_-10xF915wF3b3aUm5jqZepqoyivF+G4S6ONf_PcQ@mail.gmail.com>
 <vfszytfd66lqj54nmkymhnrdjodylb7l3alxblzixnlzv7kxom@4dji3xuvmknj>
To: Kent Overstreet <kent.overstreet@linux.dev>
X-Mailer: Apple Mail (2.3826.400.131.1.6)

On Mar 27, 2025, at 00:17, Kent Overstreet <kent.overstreet@linux.dev> =
wrote:
>=20
> On Wed, Mar 26, 2025 at 09:19:06PM +0530, Bharadwaj Raju wrote:
>> On Wed, Mar 26, 2025 at 8:22=E2=80=AFPM Kent Overstreet
>> <kent.overstreet@linux.dev> wrote:
>>> Or better, a new helper: when we're copying to a fixed size buffer =
we
>>> really want to zero out the rest of the buffer - we don't just want =
a
>>> single terminating nul.
>>=20
>> I believe strscpy_pad does this?
>>=20
>> https://docs.kernel.org/core-api/kernel-api.html#c.strscpy_pad
>=20
> almost, we don't want the 'required nul termination'; that's a
> requirement at least for disk labels where we need to preserve =
existing
> behaviour

memcpy_and_pad :)=
