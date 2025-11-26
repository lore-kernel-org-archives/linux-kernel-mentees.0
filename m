Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A552F693F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Nov 2025 03:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764127682; cv=none; b=sLpztiw6Wnbh/vxPN3M+lpbSRNafYUMJvA8gqSOwRurfWF7KvRWR+iVEg7RMMLrU3kV8N52oJNFpZVPejgHFMKVcNZj2nMPgsugarhyab4biz6r5A8ZyuUXhJIolj9hJl9+eILiv9tlgVva2qqe5sNUKedetaxaGAICuMWpRWA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764127682; c=relaxed/simple;
	bh=8qfzksOJbbTsCAArgtKRpDmbL7H3emUXbpVOCg00fyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBANJaTOdmakvfBnyzTUx4/c/tjQtIsDiAlAFfeP6EFWoDVgSZOkLtyTVZhTA9FS0kDwLMKFsIwh2UGr2aq9dqA8KE5HaLSDn0o0LJCjGLCxy5StMSqpBOrz1DpYuLynDBBs5Y0ulR63ccfCNZ/jP/vzrQCQs6GRAJB9WknKYWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NzzI/mXn; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzzI/mXn"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DFBE83B9E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Nov 2025 03:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: 1.236
X-Spam-Level: *
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoCOcEydVtbS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 26 Nov 2025 03:28:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6992183B6D
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6992183B6D
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NzzI/mXn
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6992183B6D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 26 Nov 2025 03:28:00 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-7b9387df58cso9843598b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 25 Nov 2025 19:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764127679; x=1764732479; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=51lFxwZazAf8fla+gakTIRMJxAjLqhU3wJI76M1NFic=;
        b=NzzI/mXnLVYnUSMa9bZPskGSPmHEXP7KcEO9it/39lqJTmU5HIG5K0W1JaQVYua0v+
         8rOdecin/3x64oa8yqdEMi8NKBwwwg+HoY7jNtCae8FstqYf6Ly4vUvEHr5Y95eA+3r9
         RD28Ot7TcUmzHFvp+X40j6MbwSmsxTxL8kwVoBwfe1jFszUkizCVG8GruVEDWBUZFNTj
         etWmqVbygdD4lRmJqgpxfgb2/1ZuFcBRHY6KC4gl15Jl5asgbcC3mhQ4cixO3xiwMHcI
         1nhU1XkZkR7N7MUlrxrV3eGO4Ldns+JzJQ4O5tFl6rjQKlhbSAgQxi3H0WMQYQnHBbmf
         4h1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764127679; x=1764732479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=51lFxwZazAf8fla+gakTIRMJxAjLqhU3wJI76M1NFic=;
        b=FAu7WPd439isAmzY75nHys6nqavPkThrIpDYgb8Bn/4ZWIHQcYi6Ks7qr+gYNWxuuX
         pxPZZO1PEBCD2aSSMlc0Jxj7iaje60Cazz9fgtnr7GNx7FWM0zemaxBKYY2deddcWXMo
         HQf1x82Raqdgi4kvj0RS4FEQ93zVaEdap+pBTuUumB+KqDETh15nNgOoR6lTGJXJjdd2
         D5YGG7RVwmApjB6R7iSP4SWwEfRHfLt/L2pSs3GkSjRIQeXAmMZgDBPRv3949560ByJy
         qCYoQnWJzAkiqjck7NQJmyroeDQEJu4hPnhLw2rcm0dcCBN8Jo+/et/GZrP6XamjGJ4f
         y2xg==
X-Forwarded-Encrypted: i=1; AJvYcCUBSAet5U7znKQnt9ZVoIoADsBS9OSXzNYiupVle4h7iQBBjvmKw3YTeQCzM2afSdCVVHfdHtZR3GrffT/Zw4Yr2pE0Mg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxfLq+UTwMBdvgQLyQYfenw+yuq/mScMQRCgeSi/yjJMDmZfDAz
	WHDbvJYa4GI+ChoMR5rd1ELR4TUlD/SPmcZKdI/wSS2xwvKd9TGv2gJ5
X-Gm-Gg: ASbGncskQy5oARy1thwNWzTEgYZXBURkJGIYpvnx0et2nQWu57b52hwHSFBzTV2GahK
	HiwvRA1RotNoJuTZjaMwv2a7DpgrGl9G+pBJ3Qj4/THMNkKzAQ3Gef2Qn1BKhucFfGBC7LhUjMw
	CUzQGsCbn7f7lQJaiMxqwLmMSZrjeuY5sSwfGiyHQTMOuSFMIE6gQ/hYHQeFs9R3HgqcqIlj6f/
	JUGl1k7ehyrf8t6H4hp3hhkMTVHuoNfmDXW0PAfxbqDJndH2d5zGeJtCEcYdll837Fq9c70ERbM
	pYZPBoO0toCy0Bya92Kxzs6i6qkHbPFMD8cXDuHt+31+URfVtfG2IMQ1Mpiv0GifAztkhwP0rHw
	PBL8bBi2kpeNRS/jRKhLRuKv1vb34Y7fs+yWFQLBIdhF7q+LuYhi7QCcN+bdjzXFppQimfblan5
	jFWKyM1JCU8BI=
X-Google-Smtp-Source: AGHT+IG9xHzrSQWvZCXHCGOpqvWXyFnbV+8dBSEJrT3vhP/mRsbjw5OciOtuksf2l1kJH+WCP8MtWw==
X-Received: by 2002:a05:6a20:3c8d:b0:35f:84c7:4031 with SMTP id adf61e73a8af0-3637e0d3593mr5748425637.55.1764127679511;
        Tue, 25 Nov 2025 19:27:59 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471060sm19640415b3a.15.2025.11.25.19.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 19:27:58 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id CBEA845A3F83; Wed, 26 Nov 2025 10:27:56 +0700 (WIB)
Date: Wed, 26 Nov 2025 10:27:56 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, khalid@kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Subject: Re: [PATCH] docs: dmaengine: add explanation for phys field in
 dma_async_tx_descriptor structure
Message-ID: <aSZzvJ4zhEm5jCYd@archie.me>
References: <20251113064937.8735-1-bhanuseshukumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U9VBp7oVmCj/Mqtc"
Content-Disposition: inline
In-Reply-To: <20251113064937.8735-1-bhanuseshukumar@gmail.com>


--U9VBp7oVmCj/Mqtc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 12:19:37PM +0530, Bhanu Seshu Kumar Valluri wrote:
> diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentat=
ion/driver-api/dmaengine/provider.rst
> index 1594598b3..f4ed98f70 100644
> --- a/Documentation/driver-api/dmaengine/provider.rst
> +++ b/Documentation/driver-api/dmaengine/provider.rst
> @@ -411,7 +411,7 @@ supported.
>    - This structure can be initialized using the function
>      ``dma_async_tx_descriptor_init``.
> =20
> -  - You'll also need to set two fields in this structure:
> +  - You'll also need to set following fields in this structure:
> =20
>      - flags:
>        TODO: Can it be modified by the driver itself, or
> @@ -421,6 +421,9 @@ supported.
>        that is supposed to push the current transaction descriptor to a
>        pending queue, waiting for issue_pending to be called.
> =20
> +    - phys: Physical address of the descriptor which is used later by
> +      the dma engine to read the descriptor and initiate transfer.
> +
>    - In this structure the function pointer callback_result can be
>      initialized in order for the submitter to be notified that a
>      transaction has completed. In the earlier code the function pointer

The wording LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--U9VBp7oVmCj/Mqtc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaSZztQAKCRD2uYlJVVFO
o3iXAP9hXC3MnhskzYfaAyFleh+Po17o9hELn1Mf7RwHDBrknQD+LKtDpNOsLJVe
M+AIvBjSO5AFnmkh3L8D5e+INwmlcQA=
=XV4N
-----END PGP SIGNATURE-----

--U9VBp7oVmCj/Mqtc--
