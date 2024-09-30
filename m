Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB11855887
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Sep 2024 07:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727680485; cv=none; b=hsXsL40hiNfLSBrQPALtQru+/lXtlafzt3/vOepSB7aSThQjRyJffy46JSib82O9CoOEJDKSnQmKv3wzzEn+h8TqcYITltfP3V+6JvDuE9sWlNMKANAKOkUTOjJmAPNAvFvQBq/BlK2I3YU//cCmo1OaVSYg4Tp7oLJMCKE2PoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727680485; c=relaxed/simple;
	bh=l0FXb/A2D1cvyh8qyUDJTJHrWpHxWmzrtDlwSI89q1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kgq5EcnlQgM0Jo9XU/6NCSLgKZbsGfI1AfUTFzQjrVfqPj+ishBfzMzeOF/WXRM9RS50MDITfdOuZQJ2kqxK+AJ9mmyyg334zRXHuGYB7GsUBdcHeQHS+ub2SbvteNr7sukxpqt6FkMVS2nw50ZNr+tUfTKRrPsK41Wt2uAnPcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dGbLgUaB; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dGbLgUaB"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74AF6600D4
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Sep 2024 07:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2e_6lo-gxTOE for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Sep 2024 07:14:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=ukleinek@baylibre.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D9F6605CF
Authentication-Results: smtp3.osuosl.org; dmarc=none (p=none dis=none) header.from=baylibre.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D9F6605CF
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=dGbLgUaB
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5D9F6605CF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Sep 2024 07:14:36 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42cb5b3c57eso36732565e9.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 30 Sep 2024 00:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727680474; x=1728285274; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l0FXb/A2D1cvyh8qyUDJTJHrWpHxWmzrtDlwSI89q1Q=;
        b=dGbLgUaBVts3FDxwRC0EWVQgpaW/BgcGbIUCf3kYIWeN53kYSdDSVNJhs0cI9oU/SF
         JHbbzy9np5AE2bUucfZFzFgrT5h9PA8m8dyi6gc7dygffEgpg/177Zm1d/X1cqLE59nP
         0ssbbDp1Y3JnseLTJWIVpnwyjVltD8aU4FUZyp0U+MHZ0mY0YJJ3ufzD3Qh3XB6oxMAi
         MkH8oI5gdO/StMDX9alxSs9jMMXeEP542CWlP8fypiIFhcEfHmBSAzPnlRXTdQvx8pg0
         nJ+yJeuw0Cmx0zGWv6hbsWyqKC4JTyELIPqlOkyY/iHRY6S/8aID72glqxDOo2pWjFjT
         UhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727680474; x=1728285274;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0FXb/A2D1cvyh8qyUDJTJHrWpHxWmzrtDlwSI89q1Q=;
        b=TWBDyDDzM1BZ2g6ZxPgbdQNTeG7tTwqeKwMIVAaY4nxUKme/nTZBTKFXx8eG0Qm9WP
         soXh6A0v3ltnTibCGv3cxEZOPRBZTdZuHx3BhPIXJIeXUvIsEwVb9izI8o+jP3VU+b3M
         fdu5rhxn0TGI5fhlDUthjhw/RRNTo7tekcusi/bioen7wrR+LChnqAUhomDdlOHx2fJ6
         wV9LbrTe3BR8g9MC0waKj/aNsQTGNzdiXtpLG/7mm6ks+jpSll0E5AQJdf/gtY9v95Sw
         liU3NNH1bGgJ9h5BBqMgO6Z0DDilwmqjKdbm89vkGHgfKlmL2eFLC04nHmjlAqTgQr7q
         wnLA==
X-Forwarded-Encrypted: i=1; AJvYcCV9X3BCZJ3yVTIRC/KXl5TKHQzNIOEDph8LsC3iAQaTMTW/zghh+bpEKaKg8fzM1yuxSiZpEZj/Y/zID+HHS7U61Na45A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxPxuk6oL8R4BaCj6JYpnprgXyFrEudK2snIKxaVPMi7Acx4pLt
	HrCJizDw7O9VquFhqT+SX7OWeOD7jj4ml5H/eFypGu7PteHKoaXz6AlWbY1QXRc=
X-Google-Smtp-Source: AGHT+IGJyNHTZESTIIPs/3AcS9Tim8KLQ/LJqIjWRJOSFXTe2ROkCkOJlz373yVP1zJE3bTl0/RU7w==
X-Received: by 2002:a05:600c:a4b:b0:42c:de6f:6ab3 with SMTP id 5b1f17b1804b1-42f5840e0eamr78362085e9.6.1727680474216;
        Mon, 30 Sep 2024 00:14:34 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e6596sm8303854f8f.63.2024.09.30.00.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 00:14:32 -0700 (PDT)
Date: Mon, 30 Sep 2024 09:14:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: dmitry.baryshkov@linaro.org, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Mehdi Djait <mehdi.djait@bootlin.com>, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, christophe.jaillet@wanadoo.fr, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v7 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <xaxa2phqlg4vbdexi2atyf5kvu5rixqrprbvcwumbfy5cdwazb@s7fqm6yttsjt>
References: <20240923162205.55658-1-lanzano.alex@gmail.com>
 <20240923162205.55658-3-lanzano.alex@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mjx4wdiimu3v2vxz"
Content-Disposition: inline
In-Reply-To: <20240923162205.55658-3-lanzano.alex@gmail.com>


--mjx4wdiimu3v2vxz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Sep 23, 2024 at 12:21:35PM -0400, Alex Lanzano wrote:
> Add support for the monochrome Sharp Memory LCDs.
>=20
> Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

JFTR: I gave feedback to v6 as I missed there is already a v7. See
https://lore.kernel.org/all/q2njnpzpkd3xrrv6icr5wq6uztja3wfmy2x2ldreqemzbwk=
edv@ixywmn7qy34q/
=2E

The TL;DR; is that Alex intends to send a v8 to address my suggestions.

Best regards
Uwe

--mjx4wdiimu3v2vxz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmb6T80ACgkQj4D7WH0S
/k4q+gf+NRWnSFReYhgI+VSM690varWV9lp9Iyql+s7nR00KEfVpP2CHMV+HP64f
gA4pGrIcJf79pxHSzTs5FgGym38r/hQyM8YLUeuqdfPPsANSGaPk0LI0//ka8N4c
GI2n+5YJ25ZGJBZWa3pVmcIljqJWrcV2xIpiqkeNTvH0IqODQqdTkLQZVhLij3Lc
tqjylRfiI5TCRqXDKJjsiw4xvW4Y0E377rytq1WhVvCKX2J3rufgYQFF7p1xG8HZ
LvZqEDEe5j55SwePTrGlHcE2cQo4v83EApzgr+OctACGoCmh4IMLnj4alC+zAYdy
Jeulu7OUyuDKVIvc2rxQrZtAc5VNvg==
=Wa/t
-----END PGP SIGNATURE-----

--mjx4wdiimu3v2vxz--
