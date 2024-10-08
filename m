Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FCF1C1AAD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Oct 2024 09:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728378302; cv=none; b=s/AWdZTNk0/8DWrR5tDDO+l83zHinuhJ+sc9FMHvDbJrFd5jiKchqbf+owu9oX8PJLB4zswJWdUzFi63sibikAqbJ3Voz50PbWMW8wIMaDemMpOXJPuXI9dwcuNgHdsRwVbkYWy47z5BlrKslTKiKM5rs3kbRHN2O+2Iy9zVmQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728378302; c=relaxed/simple;
	bh=vOeNwF5HYjy+FpU+6wB3oyl5C8h4PqkMYqgOx3rhiRo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=LywuSRI11dkbWzD8hYl6LSIIgU6mxOkXrb0Bs27W6qZ/d5ATwa4HcdxIkB4vqQtZVVczKoyZmVRYFPJR+rSSt9p9joSfD+sbmVXpam5Lc18H97DkIB7tI++EjiDW0ZzuDnkUm+5y3NU3Dip4xfe7CV1Lx9UK0U5wcJiE+XrnSNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ZsrRmWc3; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ZsrRmWc3"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F276402DC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Oct 2024 09:05:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -5.788
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IyKX_K0t3l4p for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Oct 2024 09:04:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.12; helo=mout.web.de; envelope-from=markus.elfring@web.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 271D1401F4
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 271D1401F4
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=ZsrRmWc3
Received: from mout.web.de (mout.web.de [212.227.17.12])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 271D1401F4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  8 Oct 2024 09:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728378273; x=1728983073; i=markus.elfring@web.de;
	bh=vOeNwF5HYjy+FpU+6wB3oyl5C8h4PqkMYqgOx3rhiRo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZsrRmWc3L2v62MGTOa/X+IxK9OQxL+HultWO8TpBUj288rHoYj/qLAwvIARKKzVN
	 wnMCZ76v+WTkvBVQETLfXxGwfoyqeKMa4NlUgeCNHKHOKoExLt4mIA4sSCYB5Y/S4
	 Ak6Ut+L7vazDw8NaSNbtFXu1ZfhOmK7FLCZA+G61La0RqLtM+lHjQb9DDners4t6X
	 H/v4Z/wHVF7RwIgZj0g463pho2tzibzveYxpFAK28d0FtVqHCgKvef4swO9YTdIjV
	 4CKJJPBslQrdhY3YP4dTdO3nPUydJqc7azRJFCzOJ75Ta+J0Pv2w8oU7xs2ctdf5P
	 KbVLlkaPSV5m0dAKtQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.81.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mpl4x-1tlgRI30SD-00nObo; Tue, 08
 Oct 2024 11:04:33 +0200
Message-ID: <a862e4fe-af97-469b-8fd5-b2b0bafc6601@web.de>
Date: Tue, 8 Oct 2024 11:04:32 +0200
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
References: <20241008030341.329241-1-lanzano.alex@gmail.com>
Subject: Re: [PATCH v10 0/2] Add driver for Sharp Memory LCD
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241008030341.329241-1-lanzano.alex@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hN+eO2bYOu7RJGSr0CIoJXNI3UqnDjFeiXWoWVNFHP/KqYR2jvi
 MM0ca7NBKFAvFsSaynK85R2DSpzOTFuFdHiuQEu/Fiakz/o/5Ic9sXxTeOF1LMGXWsAPWGH
 LOljMGnJ90/9jKwRPS1WqTWnmw4jUBGzuuo6miu6qS6yQHm797SHnwDb0gMn8z6nWB3rWYw
 jAyOkjBQ8RVpNomLzseYA==
UI-OutboundReport: notjunk:1;M01:P0:gPyJ1herBSE=;3VAUm4TJSoHdSIHai2gWjdyPJNV
 umTBQzUn3h4triRCkF45qq8KEKHx8ex30h+d7ev5omN3le/OTT4Z22fqbC9PEwPPqIqTJkEdm
 9BhfNLDsfepLvJ6/zMJIq6e6kBKaMcvYLPqV5iCLEgwzmnjnit4n/CJpd+AENrsi+NXpQzdbB
 9E6ScGAF07HXj7NsWe1HMhkdR0ZM1WnFuDGyCqg3fm5yfJuzEkAnR+q3QK/wDiwlqjPpg26Vi
 2WKwGQXHd5cRyGbfaK1hyoiwuz7F5EDCbjpWf2tMo6998GE3lZBdk+X4xKMKiy+MmbJ0+BqTo
 mvwuVb3xJnIOpmJIV2I0XEXiUWqaCgQpx0Lpl+I3EG9qZcXUOr+J73UesOE57PnQH1gl3GG49
 rRp/Ypb8GXhrvA3gco7CGhui60XubaOzhLGu/nCsU/SfudjSnqD3JLTrYr0Dq1UaBDXd5QDqH
 pwnT3rcs1x6T+fUyQuOOaHtTaqqCnLC8iDKRc4l28z5/JeM8YlxrCc42+k5CmdhjfWvhGOb5q
 OZ2BgnyTZEM1cfynj8RWIUBkyIxmkWE8BWYG9TqZTpurgOOmW931vCdVuRscliR8XgFM0fJUI
 HJThPSevXYfyVQ0QAX+R3kP3k7IEMtaUdP/COEmyqkSTNSyj2DGOAFIDdjHQokpO6vwDYKG4D
 TK8R0VQL6rMJE1OMG2Ft7iRRTnnxgwQmNnKx/i8jkkGz3/P3K5Kpgkzyw4Tx9Z0iCpH3dJUqR
 YDXywdYxs71hiVFvrFwig7WoIHVhe7nank/qQ9tTAET6zhAgRunFpY8LGQdG8Hz9m4HC5ecE/
 j5B5pheCMY2VzLrkbWfNhPLQ==

> This patch series add support for the monochrome Sharp Memory LCD panels=
.
=E2=80=A6
> ---
> Changes in v10:
=E2=80=A6

Is the support for the application of scope-based resource management
still ignored here?

Regards,
Markus
