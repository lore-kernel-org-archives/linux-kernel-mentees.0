Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EE830C63B
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 15:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786461185; cv=none; b=oOLRiFe27KfWJDS6Uo2CdFh8ydm61m4xn0BskKiGLEF75O3D2En24+d76p5btBdnVDVN9o4kzgxgpuC9G+qycjlgRQ7fs9VnocijpFuv9CE+b9xwT/84U/bnGKh2M6KwhF0bXQmuyF/6k8/FbH24BUg8xUNMCYhDoxKiJzFVblQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786461185; c=relaxed/simple;
	bh=GkzUhdnNmQsXCZJCgGYEHBXYyG45OukfnNSxt4u7xJA=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=sPIWyroL7GudonevT3BIgKMlvE2nq/T+mlv+aZU/o47oJ25w0FbtwMUWqnLHjBKUUjYXjmUQSXjEt9FeQB3jxu7ijnnMyX9uEDUMCK9IDCkejXbg0jh4DP+2qiIhV32tTgXGssYceoLIZBfLezOa4fbRDW1Favbddp7fIz6PtBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnD9qFUy; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnD9qFUy"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81f36179d72so46252787b3.2
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 11 Aug 2026 08:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786461182; x=1787065982; darn=lists.linux.dev;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EwSYPQauRfRG53p3PkwAK6rBy9dBSDSqpFZZZt55ve0=;
        b=OnD9qFUym64u1oTxg8+rKSzhp7UFPulOCN5bF5aLbzmrW2zzSnS0cJUkpEJjHxPCGT
         YiI3Wf/pXsp/ZAykfb8mVwzoL9f7HfXVnK9B18eUQDFlYlr81FzNgJuw9iSZ6gGAZ9Jk
         9R+jCsEoknbnmgTTlyqoViA4Ee/gIQ1GFgr/0f/GT2tfaBA/g0kRvMnk1NZ/b3tNLHCa
         nfCf2Oj51M1UEExWH/Vl9/bhFq36OpWXZFkJchjCnhy9MaZ/Y1w0kCWmPAuePBRfUuoc
         k0UXwGoYxTiIIgwFGmE0VZI865RRxF8IiUqn+FJ8lioN5hQriQ+hQVo/CsodZ71OyyP7
         j+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786461182; x=1787065982;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwSYPQauRfRG53p3PkwAK6rBy9dBSDSqpFZZZt55ve0=;
        b=jQi86FL1U8F67DrpQw/0MhcvldkUjfxWXJM5H6goCfapatCaaSTg+tGg22zN6iE7WL
         H9tG7O0dsUVRAb7+21AhA2Wj/5Mg9WkV1A5s9CdLXc6FRjcHYRrMsb3Lr1xa3j0W63s4
         UbvhpcsBRNHGpSuX1FCM5CKR35leipDWZ9bRA24m3+5b4/VXO9BwHUqnkg+mez3AF4Lf
         Pac4oVNUwrMfLgtXnDm864C1uE3Iuk9Ie15LeGT5MlXnj4mRTv7lbzPKrmuEUgqOc3qa
         rjw5WJns0qCsgeABXPmpfWzjNP5QIIWsKVVtADubSUEneADOD75D+zm6I81ib2VBfeT3
         JXrA==
X-Forwarded-Encrypted: i=1; AHgh+RoSm57dC/5QsSCSzMmc/FVBR87PUuUyRkp1dFI/rPVHYKHBqZ2XCdfVbhVV9UopcDL23p3DSHtM/XYTEvjDpStjM4dNXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyyIGA7zqCLuzm+Ub5jGarOTWupA/Q03tjkcaZGN7+rf5IyHXds
	i81oa1ok3o9LJaabIlJFUAO9uOGE4fZ4Npj0uMZvHhwkoKiDxxqbAZA=
X-Gm-Gg: AR+sD113POw3LtR/kfmIocEz0m+qSl2uSKieF/NiK7Ve+QTBE3kqgRBHKJs+pKNFcVV
	ZOPrl6V44GCm6rAPtFxQo2UZ6mazDvs/+l5ouBLFYBAZcN6hptUvQlT3mSp1F9ge42cvEQ6l85R
	Szxh/SiTOgD84iJ2cf0TOdX3Q+RmlK8tGX4FL7gU//KmZoxEnKWOMKSR88k2TzBfcW7KUYxP21b
	EBof1XXMq6T4TDvjob+I96Asaq6+lpu5fJG88/W1lfayxXics+3HPSi2VaqfAtfK/FnqhBBcBLg
	Kqr43yuaTFCU7j/oG1EZFXPkH32sq0rzXT/9zW4XT51VeW85cnfQVj7eXbnaMlSUgDoSLw0wphS
	Pg/frGNX5bykvU3ijLitQ/GraftZu925/HvJrFYq32oKbYtOPpijrfCgqk0tEjA+6dv6IBRSAC8
	iS2oqhaBg9Vpb59ObXiMRAG7OJ8GWlA45lb0QPvI4l+X66EDu5/EHd4ToubA6wWxReHNOQ+ZbrF
	xL2kaIG+vK7cF7wQ3RpsOh4
X-Received: by 2002:a05:690c:7308:b0:80e:38c5:bc17 with SMTP id 00721157ae682-82f289dd624mr31186957b3.7.1786461182335;
        Tue, 11 Aug 2026 08:13:02 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-82ebcee0647sm11118477b3.2.2026.08.11.08.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 08:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 12:12:57 -0300
Message-Id: <DKM7MV8J10HS.2OIM1TDHB9VHQ@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Marcelo Schmitt"
 <marcelo.schmitt1@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Andy Shevchenko"
 <andy@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "David
 Lechner" <dlechner@baylibre.com>, "Jori Koolstra" <jkoolstra@xs4all.nl>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Shuah Khan"
 <skhan@linuxfoundation.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH v2] iio: humidity: am2315: add am2320 to i2c_device_id
 table
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260810183337.451812-1-nico.antinori.7@gmail.com>
 <anqKwJOkl_cxzCT6@debian-BULLSEYE-live-builder-AMD64>
 <anrRkty6ugdJUGmE@ashevche-desk.local>
In-Reply-To: <anrRkty6ugdJUGmE@ashevche-desk.local>

On Mon Aug 10, 2026 at 4:28 PM -03, David Lechner wrote:
> On 8/10/26 1:32 PM, Nicol=C3=A1s Antinori wrote:
>> The AM2320 is fully compatible with the AM2315 sensor in terms of I2C
>> communication protocol and measurement conversions.
>>
>> Add the "am2320" entry to the i2c_device_id table.
>
> Interesting. No devicetree bindings for this one? What kind of
> system is it on?
>

I am testing this on a Raspberry Pi 3b mounted on a protoboard.

On Tue Aug 11, 2026 at 4:38 AM -03, Andy Shevchenko wrote:
> On Mon, Aug 10, 2026 at 11:36:48PM -0300, Marcelo Schmitt wrote:
>> On 08/10, Nicol=C3=A1s Antinori wrote:
>
> ...
>
>> David's comment about the IIO device name sounds appropriate.
>> The am2315 driver might use a chip_info struct to hold the name of each =
specific design.
>> There are many drivers in IIO that already have such things.
>> drivers/iio/accel/adxl372_i2c.c is one example.
>>=20
>> An alternative might be to use the device id.
>>=20
>> 	const struct i2c_device_id *id =3D i2c_client_get_device_id(client);
>> 	...
>>=20
>> 	indio_dev->name =3D id->name;
>>=20
>> Not sure if the second option works well for both i2c and dt (probably n=
ot), so
>> I'd suggest the chip_info approach if you intend to add a device tree id=
 table.
>
> Indeed, we suggest chip_info for the more robust approach when name is pr=
ovided
> via string literals independently on the ID tables (as there maybe same I=
D in
> the tables for the slightly different devices that may be autodetected ru=
ntime,
> or different IDs for the same or fully compatible component; the chip_inf=
o works
> for the latter case).

Thank you all for the suggestions. I am going to try to implement=20
chip_info struct.

I'll wait a little bit to send the v3 in case there are some more
comments on this version.

Regards,
Nicol=C3=A1s=20
