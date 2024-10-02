Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DE6194AE8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Oct 2024 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727860267; cv=none; b=WFp5rIbpae1qyZ1AvOc4JY8A9rXf6tYBarlXkwK7leNxhT4gByhdXQEjfp1Y58WFiSjpO28tZSLzxHoe0bRCqiZUJwP9+7z5ALp0HiyYrmaPjeZW+/X2qOG6prJHnLFWfO6snxKUhR955FbJU6iN5d0UnJdr5Hlli6QyzeO7WE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727860267; c=relaxed/simple;
	bh=ulMyylkHSMIpkflrRuTjpsi9ymfR21Y31b+clxaonpk=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=IhXu+KaMWxEZ2DtYWNqnBIB2ibdgTO/ORjeodorWApzhWE1ZCr8DLLD7jb6ZXFTqLKsm2GZ4U/pSvRdBe/Sjk7POdj2U47dhiuwTywARjbmwhTcnoKY1j743Ripe7dcInx7U3Am6M6yT1yolArn3Hbrm7XwEDVRI0HSr59x8wqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=BMJ4Md9B; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="BMJ4Md9B"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FE7B40FB7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Oct 2024 09:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.788
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9s1gzMXf9BD for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Oct 2024 09:11:04 +0000 (UTC)
X-Greylist: delayed 487 seconds by postgrey-1.37 at util1.osuosl.org; Wed, 02 Oct 2024 09:11:02 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 165D3405C7
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 165D3405C7
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=BMJ4Md9B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.11; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN> 
Received: from mout.web.de (mout.web.de [212.227.17.11])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 165D3405C7
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  2 Oct 2024 09:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1727860259; x=1728465059; i=markus.elfring@web.de;
	bh=bS8/Xo3kRqtJJnblPciGzaxgOW4xTAy+DHMyFQruVtM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=BMJ4Md9BkBHIn0bFnVl7rr5x6pKDsQGh6QFpBcmfTCgRjJqI7cLNfAUZsAxAOMV7
	 9h8y7+c9iqKNFxkeOojZU91d1sTDE8YhfB9XJ6ldi+RSyiDkMx/rslMeM6CbnTx9d
	 ihEmeMQrmTLn3OJ1gijaE1LvNSxSWQCMWsAJK8gifu8lNHAC3dVQhbF+2wvSbm0mU
	 ffNJoZDy0qBZcS/tkxv6WYuD1PCvepdAXdbHWCQyKBTBVpqh/9U+xVcv1oFxHeTGb
	 HwDSGY8d6g1b3dpylNqnoIl6l3wJdsLYWuRgnfHpg5mcqzV/62v3/5DBKb8xAXxKq
	 hPF2A111JErwXai93A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MRW6Z-1sYdeB3FsT-00P6Px; Wed, 02
 Oct 2024 10:56:50 +0200
Message-ID: <b671e4d2-e969-4b9a-a7ff-b3b688689ee8@web.de>
Date: Wed, 2 Oct 2024 10:56:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alex Lanzano <lanzano.alex@gmail.com>,
 Mehdi Djait <mehdi.djait@bootlin.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Shuah Khan <skhan@linuxfoundation.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20241002033807.682177-3-lanzano.alex@gmail.com>
Subject: Re: [PATCH v8 2/2] drm/tiny: Add driver for Sharp Memory LCD
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241002033807.682177-3-lanzano.alex@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vhLcqF0l3a1X0tEXBQvzRNAEyzfq1m372/WAvOxH0gS0gZSBK2O
 tCsVmgDAgiOZiw5OetbQvcOa/+cbIK+Q+iyCim8FwFNTx4ta//XJhV9D6TF9RGzQhRHGVWV
 u4r5aD03tsvkq2VkZhjTPcdc1Tsqvj9uV0SPbxruvh+Qm1zFt/J0vtOf+W1rzHriomrGGPN
 wpdniAA0lVwzDGSlBDmWA==
UI-OutboundReport: notjunk:1;M01:P0:Lb5+ZhKoxgs=;WArCBh+UUNnaw+pdQ3QB17cuz4K
 AqR9Ye8zCh4gzxmW9/V53xZZa7ScLUDQOjExVVJX3+NamEKy6tOvzuCli7c8oL6szSnwdfuCK
 kXWBVoReai5GC/lImyOA9m2QbaKnO2KrJp7CP9S6N91Adz/IEpDn5WifQCJYrlggkspND38DA
 XFEHTiOxZaXiYCSyx9HeuGpTDzYmLzHRDs7IOrRTzk+3mQW5d0cStk6XjR13t9BSfjVdgAq4n
 wCuU4lnEtA0PLVBpH4py44TZQ2u6xpC+s7TClYwrnOqjRB6S3ABxSj8b5L0jx/CMDGCYj5JBU
 tt3IU6oqzTy6KQDA82+7AsV89MFKNHpYPJmNEYDrm/eDF2rAelcf+uzv1/hwmxGEqQn9vqvKK
 s6hl/cjLP/MZ7LpTJ8L3CifyIotWIUVrLPzOEdXjMuwyXRkkKR3ITGIxVVM/Y4rUwhrdNBHkj
 J2imowgFBNANaMiI7N9BZYMqgw9MGfAMFYOjQO4DcIg7D/aVQ+yDQklbNPe02eDXMIgIX3BOG
 QbSm55GIsCWb+PZ3DZ0sCc07xNyczDzZ8z3ivFBUSAn3lzow5lO9iqgF4onHtFMZFaoWVNTmw
 qY+EnhVe7clRft8M1XVPoBZZbw1dQ40eG6hZzY9YHwSeuGiL5yo3gHP/V/VIeN5plqrF/qm3r
 11fRLXpv7tQ3AEtBqY/rTNAmtE8wOAT3/mh1GIaBRL7ySINNddreMXETTF5qvLvG0PySskTSN
 Y9+rjXI2AXwK7vfh4VOXBRPVaheAPUXM4WKYQivfr8JdJ+S2oi4bgroD6CpLyCxPwHoUeTslX
 JykMK5FYTff6deVAaBTK4ebA==

=E2=80=A6
> +++ b/drivers/gpu/drm/tiny/sharp-memory.c
> @@ -0,0 +1,681 @@
=E2=80=A6
> +static int sharp_memory_maintain_display(struct sharp_memory_device *sm=
d)
> +{
=E2=80=A6
> +	u8 *tx_buffer =3D smd->tx_buffer;
> +
> +	mutex_lock(&smd->tx_mutex);
=E2=80=A6
> +	mutex_unlock(&smd->tx_mutex);
> +
> +	return ret;
> +}
=E2=80=A6

Will development interests grow for the application of a statement
like =E2=80=9Cguard(mutex)(&smd->tx_mutex);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.12-rc1/source/include/linux/mutex.h#L2=
01

Regards,
Markus
