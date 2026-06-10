Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F7D395AFB
	for <linux-kernel-mentees@lists.linux.dev>; Wed, 10 Jun 2026 07:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077818; cv=none; b=lFunKo3SnrF4R/fAP4cXqatVIrl3aXelAcPE3AUfmSXoSeHxRmBzoYVh3l04MtrK5TR00Bz/BhQ6ZbmOdvIO1Y+5zdNRbtV8kV4oFPGCmZwdXVVko+51UK6gIPRG9J++i/8SXa1pX8+34MhsaxccCy2WGKBU6ZkiyUkU3X/bVmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077818; c=relaxed/simple;
	bh=rerew1OQa1uH7jwUqhftm66F+5np4lt3ShiOFNClKFo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I5PxbH+2h3LcmDbEgv/6TUxx2S4Vz+Erhpq3dCCFCiTP3ph2uj2Pu7ZCbKwOWzkLNYeiIu0LRgNY6USRrJx8rmLiwM8tWBA3uM9C3odM4l+x8lWjh7Qlm6GlGAyyNvrel/fgSS8wRrIuCls0aOpyiQgFt00qSX/lOIBVV24bkds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=yrirmH/H; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="yrirmH/H"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gZycG2cPGz9v5q;
	Wed, 10 Jun 2026 09:50:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1781077812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rerew1OQa1uH7jwUqhftm66F+5np4lt3ShiOFNClKFo=;
	b=yrirmH/HE0PdIBT14X+d3XFm3ogTQE0dSRcBbbY1+gZMrx4cIzY46QA6HhW4Xq+Rb602jw
	SseRhuZ8VbJj6PjSayyzm64V1cWopvUueC+fhKwagXeaDjIi5FBfAgWmpstzb8TAAPLGdn
	bkwwtDRGgIF+vsW/bEcOfV0tx6WL03rTouLsaBYngRld2A2uVI+lAvpL9s74ahlcQvv0D4
	vQPe0S7+QXzlRVUrN1WOD01ZTBThMYUJ8uDw01VKyRNo+FJEWiDP088xJN6T2s0OZgUrj2
	Ii/wmF7WXYu/PpgJfzelCz06VdWGYul1IfRLBQARmAd5rLhZY6yECERvpDY0ew==
Message-ID: <f37e84915857f6fdccfc690264fb038a40b92f2c.camel@mailbox.org>
Subject: Re: [PATCH] get_maintainer: add recipients to output of script
From: Manuel Ebner <manuelebner@mailbox.org>
To: Agatha Isabelle Moreira <code@agatha.dev>
Cc: joe@perches.com, kernelnewbies@kernelnewbies.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Wed, 10 Jun 2026 09:49:57 +0200
In-Reply-To: <aicTcM1FhL8nT1mx@guidai>
References: <14198ef7adde6d0e24535edf64266201b7036fed.camel@perches.com>
	 <20260608163411.70226-2-manuelebner@mailbox.org> <aicTcM1FhL8nT1mx@guidai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MBO-RS-ID: 551aa5a6e6784c22f77
X-MBO-RS-META: wmzxd39cxa1wei4ot9dd5zq5q5ipxgdy

On Mon, 2026-06-08 at 16:32 -0300, Agatha Isabelle Moreira wrote:
> On Mon, Jun 08, 2026 at 06:34:12PM +0200, Manuel Ebner wrote:
> >=20
> > ...
>=20
> ...

Thanks for the insight, i'll ditch the patch.
 Manuel
