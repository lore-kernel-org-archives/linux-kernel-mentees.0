Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C6B55C33
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Feb 2024 21:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708378625; cv=none; b=l6kcn+Fz7ZeNaTgy6ChpsDgfpsjl2bUtchXiDRPdVyGYlLOr2FdA2j/QHVLIISaSdlWAU/OtGX6KE5cDDHz9A8UsmW0Y8vowfZjs/VIxCUKMsIFeQF7zTL9LuAqYA36FBKoFicJ/45F2OfXiQ2p5WfpGABx2pYiwwF5/P4eNCaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708378625; c=relaxed/simple;
	bh=ahsEsL7xHvY6JXEf8G+tqpCCQDD6851+Q0sh4rCn0ys=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ggDUyLsSj0g33z+orFB9bsQdrG7lHr8ljDYQrIbIlCma8DtgrDv/KmxlbPlNFKQmYH12853wCr/x1AENGOMav/G3NDKqarPAr0mNr8A2X8epv92P/Jb8wATBPTB699eQTEHqaodHfIjZzO9aCxkFS1C0rEUGoeMGoZVFSGtbAew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=XmyZzi7k; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="XmyZzi7k"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90CCD4088A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Feb 2024 21:37:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pr9katRyHRKM
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 19 Feb 2024 21:37:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCF6040800
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCF6040800
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=XmyZzi7k
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DCF6040800
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 19 Feb 2024 21:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 815005A270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1708378616; bh=tnu9wEn1IsHkV2rTmIJegZNLUksL15hxtWNasU0E/Iw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XmyZzi7kg2wIqtIdQhpf4g6cHpb1jXsEqxtxPG4zcbM1Ff4PsE4ryDahnMh+eG+73
	 Kd9x1K0UXFFzXQg4c2WVDwqNAebLvmQ10VNnGP43rlfOlevRg1a83wcB6YhoOXJ7+4
	 R6zKTMdETIJiP3RdlfmA6HSmtLv3TMAvx2FOW99o6jGL+/JiPX2Imtmg0Vu4SQhmnd
	 QCL/GOiu/epy6DDJFzw/5Pw6HkrHHgERCDt5foocv31jWz8HzJI7CcMHcwdfRK3+CO
	 QV13L0uzK2q9vRJBCjKVoM78v4mlBf0ls9pT3fsFQrXZNyWLiE0rwLq9xdCvMOJqlI
	 +itUmEOb5QQ9Q==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 815005A270;
	Mon, 19 Feb 2024 21:36:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, "Ran.Park" <ranpark@foxmail.com>
Cc: ricardo@marliere.net, akinobu.mita@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH] Fixed case issue with 'fault-injection' in documentation
In-Reply-To: <CAKXUXMy8WZwAqrARe-6nNhtvjSiosDD3X5aPZPfn7GXtkG8B8w@mail.gmail.com>
References: <piosq44nxwlfeutperrk6d23bx564qlbfirc5xlbouyrunf24r@u6qsgqp47fz6>
 <tencent_B08771190400813E0CC41E36A3F540AACA07@qq.com>
 <CAKXUXMy8WZwAqrARe-6nNhtvjSiosDD3X5aPZPfn7GXtkG8B8w@mail.gmail.com>
Date: Mon, 19 Feb 2024 14:36:55 -0700
Message-ID: <87zfvwm8zs.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

> Ricardo suggests that:
>
> - you run 'make htmldocs' before applying the patch and check for the
> existing warnings.
>
> - you run 'make cleandocs' and 'make htmldocs' after applying the
> patch and check for the existing warnings.
>
> Did any warning disappear or appear due to your patch? Were you
> motivated by a specific warning you observed during the build and you
> addressing that?
>
> So, for starters: did you already try 'make htmldocs' with your patch
> applied? What did you observe?

This all seems like a bit much for what is essentially a typo fix.  I
would be amazed if it changed the build in any way other than making the
case more consistent; there's no need to do all that stuff.

I've applied it, thanks.

jon
