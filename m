Return-Path: <SRS0=X5dI=K5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85968C47096
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Jun 2021 14:33:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D2CB613D6
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  3 Jun 2021 14:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D2CB613D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF355405C0;
	Thu,  3 Jun 2021 14:33:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zeDGu61LZZQE; Thu,  3 Jun 2021 14:33:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93787405B2;
	Thu,  3 Jun 2021 14:33:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71EEDC000D;
	Thu,  3 Jun 2021 14:33:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15027C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Jun 2021 14:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 030564052D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Jun 2021 14:33:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e7AunhbQBBEi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Jun 2021 14:33:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B9FD40520
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  3 Jun 2021 14:33:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC354613F1;
 Thu,  3 Jun 2021 14:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622730802;
 bh=EjEoDnvgK2MJvh26amyQpg9t7v4gmriBNUumXz3zNBo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VXMa5slI73rX3bHFoFxb33pQ940v/wxgHB1dbJTZjL/n7JIO04MbkV8pdAOhf3Xlz
 8JcqwwUQn7duaHLT9JBq36/tlQol4KqAZZHDPzIQI5wkmNgWUqoXCeyF9nz3Pvm2sy
 WQJlK1RQNhZfYlty9az9GhitwhjQdIuL6iMJxtZ8/AAjnvjRo73S1KvRTH+QcyJgkD
 +rxzey5NdfD5nXpnB2sI/2/5XpP1UiNVnmx739FymrzIl8Z0kko2HfSorlRepz54TS
 SqxmwLOpULCEIGP38cJvwIvwqlcIO/0IsJuBbIfWDvp0ip3h96WQBgfjTi+YRyxImO
 OBOq6kIy3x/zA==
From: Felipe Balbi <balbi@kernel.org>
To: Aditya Srivastava <yashsri421@gmail.com>
Subject: Re: [PATCH] USB: gadget: udc: fix kernel-doc syntax in file headers
In-Reply-To: <20210522115227.9977-1-yashsri421@gmail.com>
References: <20210522115227.9977-1-yashsri421@gmail.com>
Date: Thu, 03 Jun 2021 17:33:13 +0300
Message-ID: <87czt3c91y.fsf@kernel.org>
MIME-Version: 1.0
Cc: linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6019945332218522262=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6019945332218522262==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Aditya Srivastava <yashsri421@gmail.com> writes:

> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The header for drivers/usb/gadget/udc/trace files follows this syntax, but
> the content inside does not comply with kernel-doc.
>
> This line was probably not meant for kernel-doc parsing, but is parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warning from kernel-doc.
> For e.g., running scripts/kernel-doc -none drivers/usb/gadget/udc/trace.h
> emits:
> warning: expecting prototype for udc.c(). Prototype was for TRACE_SYSTEM(=
) instead
>
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>

Acked-by: Felipe Balbi <balbi@kernel.org>

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFFBAEBCAAvFiEE9DumQ60WEZ09LIErzlfNM9wDzUgFAmC46CkRHGJhbGJpQGtl
cm5lbC5vcmcACgkQzlfNM9wDzUifDwgAtnFMd2i8Hm17HXt+UzjKTpBWvV88ADMj
uimkyjbm0+77YJUzI+viw9vludqI6MrQF1/IuPgTZ29XV8ddjv5OdGytFkuwJy4J
CvzgSFYcwLbIfN5XqqPxbnJfBW1+XpADGwcgcwUeyC86I7TaJu/8j/wl6ioE8NYd
h/kmY5UEZslh+0I0m/wRmis8Lhf1xJM4zr7uUGdNhgqSOq2b4cXeZGObxJww1/Rp
Ij0f6oVi6QtjPSaMr+pmqXrffP2Gk2WpFoNunEIbeEBiyifAaTRaAxf2ya9mC7Do
OvliCxol/kn35vvnXRON2o5NP0rtcsF0VCkMgLKPaJ/bqVtMADbiIg==
=8Y62
-----END PGP SIGNATURE-----
--=-=-=--

--===============6019945332218522262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6019945332218522262==--
