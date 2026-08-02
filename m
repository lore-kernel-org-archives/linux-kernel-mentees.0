Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555783AFCE4
	for <linux-kernel-mentees@lists.linux.dev>; Sun,  2 Aug 2026 12:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785674111; cv=none; b=LQsNqpir8+DE0rlJbghekTPbwrRggRh+fZoAfjqILHtDLMGPMqItw2YBAKhjxLq65vANs5gFjIeVReaZYGYUbmn3NG1sj85zlSEHx/fLFp+VN6Imk6MwquW1P4OlV6gHKokCRw/uREgsIVqczJ3U4dXazxOGGkDDwrl87NszBjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785674111; c=relaxed/simple;
	bh=mTSWQMdtUPJ8quoBNc3vQhj+rEBKzchn63KyQA+oHsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tn7LE/PrzaUSrrfbCHErttMjAWgRpjViWGfxCcgGQXFE7q6RvZauDlgbdpBfVC4+jRXW3xssYjYlg0qZkXNL1bhx3ZFJ2m30DBpWRXT9T/l5K1rQNAHxWRRjHvKtaJoIcnpEGngqjkOn6GkckGPMBi4jh+0z/bkWnJ6/EWUiTXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DdByxYbU; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DdByxYbU"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47fd4ee0b01so1431384f8f.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 02 Aug 2026 05:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785674102; x=1786278902; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+iJPyyVAhWuwgDbr/jcy9trWNUYfGjBz+o8zO7olgWo=;
        b=DdByxYbUG55UTmVcih0stYdUKcgHv4G73RGL9PQEOUTuEFMD8TEKnHXb05SkPQepSG
         6dURvw8rbO1XYSYTi4/JRv4SxUrLk4J3g7X+QxLmS7FiQAPHtalJk1CU+Gm8F7GqT0TX
         1x3rpp8HqhFz8ul2it9yZvsIpg6qaeqOYE7AJPY2E5TjmUh1nFdHGSW590+oDYrKZzJa
         Y54/41zP3lYio8aiK+bT6WISn4ZJfJpEzh2jild3BqRnNs+myCKsC0QhTueOcAhV91bQ
         OIah73h2zu5EiAZOU74cs72XmZ4C7fbh3uPeAr1omQrA4zgzd2+rWQYY631L9NpGDP4r
         ibNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785674102; x=1786278902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iJPyyVAhWuwgDbr/jcy9trWNUYfGjBz+o8zO7olgWo=;
        b=etd1SPTr+9E8pKF+vzEhNGia0xGJTpVn3U2/FMxfTUlRlsQeyB4IxQ+JBH/YLA+FN9
         Ye4Ta5HIm6/lUNv/rA7+uU0oHgJMHOoAgfdrBvGM2/yU2RGl6OpBEa3K0UOKcaF7LxCD
         hnyOr9VHQGaLOTrmc8V73kXDIACrmYGBjPJd2BFhZ2Km/J/LvVxVYqSw2VUW1Td8H9I9
         Ya0CRoj4lh/1IxxnRTtchkwuk52uaX9rF7gkQDOhZwd5CH+zJmtg+wpnLQG/MywHL7Lg
         P6jEj19YVJSDlPq5V/1VbY1DGjWkV+VVTfzpqmwGDUqv58FHnMg1SlueNx24XxtoyZsG
         e6Vg==
X-Forwarded-Encrypted: i=1; AHgh+Rop2NDn6E+jMMvmVDvT+LCSDNjB24TCN+WxOxWyskH6yIaxecpZl8WvT6mjH7rWSxj9CF9OqLtwdble5c968Wr5t9I7iQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+LvZTJickl3VddL3llt2Allt7UwB4OanMhHnN1MqekYZEzoAu
	4zUVUoGCno1EumMlmGzsZFlCXynsDrrOn3ttq0CeBdsdifWwExpKH+GVIsYRBDHtCU8=
X-Gm-Gg: AR+sD12et0q5AEli8ub5Ki/OGVIcdSCOMysrF6FVMuOLXCBFJNMZS3q+rE5khnMxG3Q
	idXIlg2XpepIEq/RJXwdMt8VlTQokF3t2Leuvi06tjeJz4B9L73heHjFva7nDrd83KDZkXpxkK9
	hNkP0S76GuH58ErjNjvo8a9XVRP9H39FhufgB1y/iApX02Ad0dCoFnUILkLCXPdG9JRdt8sFR79
	AT7ICfE8JzgFDZHfic/4dNyPctVcr5lRqrwsthklk97DTvSCzi31uJa47FEUZ2TsJLZ7ExNMVt+
	QrsnGmzwB6TS51wqtggiSI/vhUreGYJslc4x5QuVyDkjHa+cFw23Grl3JAA/2bsRiP1q9WNA7JY
	tEMb4LA1TBUoCpVB0JZqKVb5NK/2XqxRsN1q0VGPAFyWgAflqemmCOjUDH6zkZwCn131B+XWu8T
	wRlZn0wC8J1CHxjMQd3I6Y09ADwAYNemGIRCycMMOwQfhoWLyuXF79jOw5E2OMoxTmfnayxYF74
	CmH
X-Received: by 2002:a5d:584a:0:b0:47f:9256:52c2 with SMTP id ffacd0b85a97d-47fd72fa2dcmr16555477f8f.30.1785674101692;
        Sun, 02 Aug 2026 05:35:01 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd458ab61sm23825757f8f.25.2026.08.02.05.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:35:00 -0700 (PDT)
Date: Sun, 2 Aug 2026 14:34:59 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Adi Nata <adinata.softwareengineer@gmail.com>
Cc: joshua.crofts1@gmail.com, jic23@kernel.org, dlechner@baylibre.com, 
	nuno.sa@analog.com, andy@kernel.org, email@sirat.me, bhelgaas@google.com, 
	mazziesaccount@gmail.com, krzysztof.kozlowski@oss.qualcomm.com, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] iio: chemical: sgp30: fix checkpatch warn to prefer
 __packed
Message-ID: <am84xDCfJC7c-21r@monoceros>
References: <20260723235542.152a6a25@systembl0wer>
 <20260802025134.25319-1-adinata.softwareengineer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iuutzrwryo4oodb7"
Content-Disposition: inline
In-Reply-To: <20260802025134.25319-1-adinata.softwareengineer@gmail.com>


--iuutzrwryo4oodb7
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] iio: chemical: sgp30: fix checkpatch warn to prefer
 __packed
MIME-Version: 1.0

Hello,

Just a few nitpicks. These might not justify a v3, as Jonathan sometimes
fixes up such thing while applying.

On Sun, Aug 02, 2026 at 10:51:31AM +0800, Adi Nata wrote:
> Change instance of __attribute__((__packed__)) to __packed per checkpatch=
=2Epl warning
>=20
> Reported by checkpatch:
> FILE: drivers/iio/chemical/sgp30.c
> WARNING: Prefer __packed over __attribute__((__packed__))
> +} __attribute__((__packed__));
>=20
> Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
>=20
> Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

No empty lines in the S-o-B block, and please put your S-o-b last.

> v2:
> - Rename commit title and message

the v2 changelog belongs after the tripple dash.

>=20
> ---
>  drivers/iio/chemical/sgp30.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/iio/chemical/sgp30.c b/drivers/iio/chemical/sgp30.c
> index f10bbebc29e4..c33592a1e0c9 100644
> --- a/drivers/iio/chemical/sgp30.c
> +++ b/drivers/iio/chemical/sgp30.c
> @@ -82,7 +82,7 @@ struct sgp_version {
>  struct sgp_crc_word {
>  	__be16 value;
>  	u8 crc8;
> -} __attribute__((__packed__));
> +} __packed;

Otherwise looks fine.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Best regards
Uwe

--iuutzrwryo4oodb7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpvOXAACgkQj4D7WH0S
/k5YpwgAl/E+S+82lzHQ1buNKpj92C7t4FN2ORPHv2CUxBCnjgUiDAg7aQWJEBEm
HHxz/flAmenUrr+lV7PLfgcLp+6Z6E84YMM2CsQzOHFsztq5hUmcbY7tCqODVFtL
27rWHNjLNtCYepmQG2Z977p9wDKdqOGiBrwft7jytd/f0qXlRhyy7SGiQWabB7zL
4eI7o4FsBxQYdeBSwI7vIsh6LOtprlKBT6oFPlJ/7okrfju2XZqCbU2GDSaqAAj5
gQjbpUUIDqmeumS0IbZrAMfw93Xyrtfe7kwLrD7Aqif69GTKdrCw1bg+smmp+YQy
NkMBPH7XI//6HPe8KOZxxyiznuImlA==
=cjtv
-----END PGP SIGNATURE-----

--iuutzrwryo4oodb7--
