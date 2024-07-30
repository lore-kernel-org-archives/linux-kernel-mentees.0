Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58371991DB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 12:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722342346; cv=none; b=opN2S12s/2sNGJ4ouJtr63E0Dm6IHcO5tT61RTD0e4VQndQrzORvFDjJZQ6ygv8sU0swMcjM7Hg6IgEUBQgzvxbWpqjm93SXW05wHhLTia3rLfYVVxcLjJBEo7n3YvBO1YPNHAOYhFNEM5Lw1ISiqs7wHcBEgQQsJG6AWmkGFaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722342346; c=relaxed/simple;
	bh=qdDMP7323l8v6fO21UUWMEocD4966D9stt8FVHJsOUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TNuFbl6XYOMC85J3dZ8Cr9baNhwUfmmjk7WxWvLGwEx252d1CMa+T+PgbkpNZ0m6TLCxPMxp5bpd2+XgDY04n+takOe54Uadvhfaqjqby7qpXXgg++4Bc7MW/kHWrfj03nEyZ6yQs6pfIe3JLp6WVcj9kV4f7Ud83DbHjDkOLbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qNLrnyDz; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qNLrnyDz"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CCE9608FD
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 12:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.797
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D8YKe61Tfa3T for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Jul 2024 12:25:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=w_armin@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A9314608FB
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9314608FB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=qNLrnyDz
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A9314608FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 30 Jul 2024 12:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1722342331; x=1722947131; i=w_armin@gmx.de;
	bh=bussN/ItGE7hyQ7qjLYxNnxcmLOLpXWhjXARu85qVog=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qNLrnyDzulH4CN/hF55v0aev87OBUJlDIB4Mq0TtdVEikhUwFJZCNDKezANHEN5h
	 yocU7fNnNpgT+O/qSEV772TTfV9rEPEr/Mc0fr6W2V2BqiZ85gJ83SERuX7aaiHL9
	 3wqquhMbxMIYF45hu2295RCfkhmjVqu1IB9Cd75g+3PDR/D6TUch/yVobIZLCktEZ
	 n0JJh9yI22zZVkJIRopZ3pN5SRrUHiACedgmXrTEscqPoyjBxuF5Y6e7e1uZ0L+P1
	 FWzP/yT0Ed+wBHvs8z/Z1zrH0p6Xwr2ocidAgq84PO7sWiNoNkhgmc4YsufkKCohm
	 CCWBu34iQc/qa6esag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9g4-1sTHj51A4a-008mNj; Tue, 30
 Jul 2024 14:25:31 +0200
Message-ID: <87bfdaa2-5b94-46b1-bbf7-d81245c7d658@gmx.de>
Date: Tue, 30 Jul 2024 14:25:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [PATCH v2] wmi: Fix spelling mistakes
To: Luis Felipe Hernandez <luis.hernandez093@gmail.com>, corbet@lwn.net
Cc: platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20240729223649.135639-1-luis.hernandez093@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20240729223649.135639-1-luis.hernandez093@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IzHrU+9R1FGoUahWzPtYbZQXRyIJcVLmyBbTiP1Yaq7sqhyYw8H
 mjRD+L06aLbz1IS5TkiNQrAMULuXVxHdNjh325hYz2S1f6TXQxQ8dSrdmh7to+DdfhyJ8p0
 pPj1Q+Ou+zhWoA+JJaWq6cnbBPgUranxWiUiSd+N+55ch27wSSR4EmgESjw2JYSm3o8dP+A
 FhJ1LwnjH3COSlRDHHVgg==
UI-OutboundReport: notjunk:1;M01:P0:9fq1H++DdOI=;MB0Yui693RYl/p+ccc3bWftwDLn
 V/x7jTl+n4AUDQMUlvWauiJfOduFRrtN4av8a8FI38fbnHV46IDfUXGhR00gXkuXqOkDTnhFR
 r0pzwr5FPpO8vWbsQgPHUnplHCMgNBb4Bxn8NAlsJ2LeNpDOdydazcd3plcu7Xmid+EMcuUaP
 /3XPE8SvlOskKJj8kC5JK2FzyRXTXm+TSmfnxrEY3xXDEPw3IHtZZa4mTkLg+eb7GF5LmvDAq
 3/o7sUY8nKHkl4Pszsmgjsfhe1Ofn0Ohth61xgRcaHDUJmjTAsNMLfrXMLRfmQhHyf6PozVK9
 U1RXBGszSjkNAtCPBlfqJD2FF9q+8msBPhNNKfe/sD6EELGTWq0mu8ASXPrMUq1NXSEJK5zNQ
 a2ElU27+Nk9dw+s+K2zn/O6QPT3cj0UduHGNRdW8JZLsH6/EnGSlVtMqyT7SNBN5R/O0ybia9
 wH/B0PwhQM+zRAVOmm0mjA44It0qK9UxPZLr5wrl7mefii3U91P05qRS4BZJIe3P5irQbXhYm
 pU35/5EK+TnltquPD8/9tle3+IjdJE/ez/zOp61Pe3q8tcYCLuwotvVbwB9786t5KXTzycGjh
 ChWBTGehNfHi79KZ9DX/L6SHyYTxUB/kDaptcQd1JrQ/Rn03hqbp52chTdnYzchaq8Uz+JVbK
 Y7ExgW0y4uphd+1SCiBVeYV7oUoMg6ghsJR9z9PrtNWKI1GH4XSKvDSouMRE8kFKqZTxxVFA5
 J+WvkXWAROt3y8dlpnPpTXaQvTLEOi3ufSo/LXgUOQGSdpFCClziflMc6mC/CDYhF5jIt/G65
 SjfvpV7ctWz5RN591bb/M2jg==

Am 30.07.24 um 00:36 schrieb Luis Felipe Hernandez:

> There were a few instances of typos that could lead to confusion
> when reading. The following words have been corrected:
> Binay -> Binary
> singe -> single
> chaged -> changed

Hi,

please change the title to "platform/x86: msi-wmi-platform: Fix spelling m=
istakes".
With that being addressed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
> ---
>   Documentation/wmi/devices/msi-wmi-platform.rst | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/wmi/devices/msi-wmi-platform.rst b/Documentat=
ion/wmi/devices/msi-wmi-platform.rst
> index 29b1b2e6d42c..31a136942892 100644
> --- a/Documentation/wmi/devices/msi-wmi-platform.rst
> +++ b/Documentation/wmi/devices/msi-wmi-platform.rst
> @@ -130,12 +130,12 @@ data using the `bmfdec <https://github.com/pali/bm=
fdec>`_ utility:
>
>   Due to a peculiarity in how Windows handles the ``CreateByteField()`` =
ACPI operator (errors only
>   happen when a invalid byte field is ultimately accessed), all methods =
require a 32 byte input
> -buffer, even if the Binay MOF says otherwise.
> +buffer, even if the Binary MOF says otherwise.
>
>   The input buffer contains a single byte to select the subfeature to be=
 accessed and 31 bytes of
>   input data, the meaning of which depends on the subfeature being acces=
sed.
>
> -The output buffer contains a singe byte which signals success or failur=
e (``0x00`` on failure)
> +The output buffer contains a single byte which signals success or failu=
re (``0x00`` on failure)
>   and 31 bytes of output data, the meaning if which depends on the subfe=
ature being accessed.
>
>   WMI method Get_EC()
> @@ -147,7 +147,7 @@ data contains a flag byte and a 28 byte controller f=
irmware version string.
>   The first 4 bits of the flag byte contain the minor version of the emb=
edded controller interface,
>   with the next 2 bits containing the major version of the embedded cont=
roller interface.
>
> -The 7th bit signals if the embedded controller page chaged (exact meani=
ng is unknown), and the
> +The 7th bit signals if the embedded controller page changed (exact mean=
ing is unknown), and the
>   last bit signals if the platform is a Tigerlake platform.
>
>   The MSI software seems to only use this interface when the last bit is=
 set.
