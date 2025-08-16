Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6C32E7BBE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 13:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755351296; cv=none; b=sWLbjgispWO0ZscNM4trtX4KdI93NyVb6htQTidYf7DOESFR2U1ziqwOj3dEb0nxXRHxFzU1GlZAJiWTBCBJwRII3/EGaSd3rFaXE0PaNOTLFsqFuN7DWcFD9n6cthdtUiyfJwlKG96guYG0Q5ik2c8oGRW1Ts0Yu3OM32R3T9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755351296; c=relaxed/simple;
	bh=tJC2fP8R8CE59ewJaA1jMoW76rPBtMtDYVgvZDtO3q4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hb6HPYxFhY6KQVKuGlGH9WGejGpeawvxu3y6Fg15KMPE5NiLkE1eC8VHCPOlnlRpe0eCwNdL2enDACuiRKy68PMc85YMs6+7JKTqMUY9eSb3Wwm1ShDc3ZE0lhwU53Tu+CwjWHbNBKpMyxyFnx1vIfO0rz44ZDKDHJaxfi5ZD9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQBXWQZ9; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQBXWQZ9"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D2F281455
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 13:34:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6b9v_u33T0v for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 Aug 2025 13:34:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=jic23@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 08C58816FE
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08C58816FE
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TQBXWQZ9
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 08C58816FE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 16 Aug 2025 13:34:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E487344EB4;
	Sat, 16 Aug 2025 13:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37872C4CEEF;
	Sat, 16 Aug 2025 13:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755351293;
	bh=tJC2fP8R8CE59ewJaA1jMoW76rPBtMtDYVgvZDtO3q4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TQBXWQZ9TY9fe5hbnCoxP1TwOCK1clE/ivn8njEPlRbATyxEbDU9BrnYu1PAmzjsI
	 M0u5x1WGLe+LYK+fqxjeDxWExPJwjephPyW9g7l8f6cE1zW5uMWkITvwLD7lee6fXE
	 kvZ6HgwPBztb6kiKU1fRz1LjnTFhkF156H8CfEiy8dsEk3q5Z7BOEYzlbOOetnjXk0
	 1UUIJYxuX9nyMc09rm8sNnZ2wOYZ28Jnwt/jyG19H7BmJBMaftjlGXBlAEFWugFbch
	 mHT9Ecgg1Mbt5sCJZffc21W/LIEWFGqNMvupCJwD9pZRVU/WDpjZlXi10KH1TLUua1
	 LbRqM74LSEHUg==
Date: Sat, 16 Aug 2025 14:34:45 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Akshay Bansod <akbansd@gmail.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] iio: st_lsm6dsx: Replace scnprintf with sysfs_emit
Message-ID: <20250816143445.3dd52031@jic23-huawei>
In-Reply-To: <CAHp75Vf7r53wQtGWes9WH1UubEjhAju+tN0OORTrkNxgTQPsWw@mail.gmail.com>
References: <20250811165641.1214347-1-akbansd@gmail.com>
	<CAHp75Vf7r53wQtGWes9WH1UubEjhAju+tN0OORTrkNxgTQPsWw@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Aug 2025 21:17:18 +0200
Andy Shevchenko <andy.shevchenko@gmail.com> wrote:

> On Mon, Aug 11, 2025 at 6:57=E2=80=AFPM Akshay Bansod <akbansd@gmail.com>=
 wrote:
> >
> > Update the sysfs interface for sampling frequency and scale attributes.
> > Replace `scnprintf()` with `sysfs_emit_at()` which is PAGE_SIZE-aware
> > and recommended for use in sysfs. =20
>=20
> LGTM,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>=20

Tweaked patch title to include () for the two functions mentioned.
I think that just makes things a tiny bit clearer.

Applied.
