Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1A81E892
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722264011; cv=none; b=EY7E/kZZxjlgriO/SBiXM7rScZqIc+I+HUzZZbUjEdnfmx6orzkoHGyWRzXOZdBANtGYXCGd2azkQhVDbUktVd695tyVCGrc37VIuF9I//SJjtk1eQApPo7OKloeYVFHIB10/Z6qHHmpgtiSKSfAevfBUuvxYQ/QfgHC6LDKykg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722264011; c=relaxed/simple;
	bh=nVwixBhGg7g0/0/fZ7WiemdMyNzqYt6miLlpFgejPh4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iPR4VMXZMEMAyCvY1vGrYsojGDSMd2JMH7z4c+TadPAR/7b+L/Z1cKQVCiUMoaW13FUWLm7ooANKoSpE7UJpruheLbkaVCeoapfX9Bw+DqrhShieI16dD9UMSjiep06uRwFoo+0jlIhJcevdvXNlnSemkNezDWN3l4Hj16QTxfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=EA8+2MMc; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="EA8+2MMc"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F7C381133
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 14:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2USOZirOjxf0 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 29 Jul 2024 14:40:03 +0000 (UTC)
X-Greylist: delayed 345 seconds by postgrey-1.37 at util1.osuosl.org; Mon, 29 Jul 2024 14:40:03 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D21F81138
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D21F81138
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=EA8+2MMc
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c01:e000:3a1::42; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6D21F81138
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 29 Jul 2024 14:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 083BF41AB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1722263657; bh=aV2fBeVeraJinAztP6WxXGZNMfp4HMUWMSPRB+UMKhw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=EA8+2MMc+a6E/i1z5jVasg8IO83480Hzaw4ULOPIXdL90CXfkwRlmMCPNdQdSJ7Hn
	 dZ+oWUhAiIjxIAXIXKE0dJ5//iIvIwInLaq01+fzOdSJcUIAc53aVVrV41K3uVyrO9
	 4bgI6oJTzBonh/eLumJN8SvAntauWfR9AhGIjZNIwyR6bvjHBOMSCwAo+jluUjKzxF
	 Iz3IHfzYrRDJewhvAAqTMh5tBoB9282Ahx7WTXzTtT2KuMM/mTPuF7r6Ou70ctZbxq
	 mpuZqfJhrV7IkMZHVj27sXTUc4vzPVRcWkzTwsp3ggGuw0ijIW/tbhWsqeRZ65RMcK
	 XD0JXuPFvW5sw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 083BF41AB8;
	Mon, 29 Jul 2024 14:34:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Siddharth Menon <simeddon@gmail.com>, linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org, Siddharth Menon
 <simeddon@gmail.com>
Subject: Re: [PATCH] Docs: Update LSM/apparmor.rst
In-Reply-To: <20240727043315.36554-1-simeddon@gmail.com>
References: <20240727043315.36554-1-simeddon@gmail.com>
Date: Mon, 29 Jul 2024 08:34:16 -0600
Message-ID: <87zfq0b72v.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi, Siddharth, thanks for working to make our documentation better!

I do have a few comments, needless to say...:)

First is that you always need to send a patch to the appropriate
maintainers; scripts/get_maintainer.pl will help you there.

Siddharth Menon <simeddon@gmail.com> writes:

>     Docs: Update LSM/apparmor.rst
>     
>     Update AppArmor documentation after deprication of CONFIG_DEFAULT_SECURITY to enable and configuring AppArmor.

Please try to stick to the 80-column limit whenever you can.  Also,
"deprecation".

>     Signed-off-by: Siddharth Menon <simeddon@gmail.com>
>
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>
> ---
>  Documentation/admin-guide/LSM/apparmor.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/LSM/apparmor.rst b/Documentation/admin-guide/LSM/apparmor.rst
> index 6cf81bbd7ce8..f324d750468a 100644
> --- a/Documentation/admin-guide/LSM/apparmor.rst
> +++ b/Documentation/admin-guide/LSM/apparmor.rst
> @@ -18,8 +18,10 @@ set ``CONFIG_SECURITY_APPARMOR=y``
>  
>  If AppArmor should be selected as the default security module then set::
>  
> -   CONFIG_DEFAULT_SECURITY="apparmor"
> -   CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
> +   CONFIG_DEFAULT_SECURITY_APPARMOR=y
> +
> +Since kernel 5.0, `CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE` is no longer used. 
> +Instead, the `CONFIG_LSM` parameter manages the order and selection of LSMs.

The documentation covers the current state of the kernel, so we do not
normally put historical information like that.  Best to just describe
how things work now.

Thanks,

jon
