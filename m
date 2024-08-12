Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3283F1802AB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Aug 2024 20:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723496030; cv=none; b=FpMWoy7Byuyde6c64wUvDU0xWN3CfhvEA959hOy6MZIV18Lp1MLv9dDtpGbZXeYJ+i/IJ+1kO73v8twevJJKs/UR2xBT9qgbMUWikPd6/2Hm4AumDnlhCAT4ZWyGGiEmP5BSyKVVcbX7MqnCpYRQfwv2s+a1AaCP8eT6s7x1+rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723496030; c=relaxed/simple;
	bh=popiTOAvrARqgESpFaajOWe+yLPWMHUcOMxzZp1+JYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMRcF40PMCcC2MVLSRYyLb8voZ/11x/K9mQzwrQkm1TpW0CNfU7ggevB614/nXregyBqVlsE0mEt1fwop5XBI+H+2MDg8wZSbprtZO06icbTEYtmdcDwC1zbNv96ZP5N/vEoRAUNSRb0cuUGP8K0iaHsSO+bcZsPKidqoH9b31s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIXD11qO; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIXD11qO"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5B60400B8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Aug 2024 20:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXBz7_iMnJYg for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Aug 2024 20:53:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=sergio.collado@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 60A6B400B5
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60A6B400B5
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NIXD11qO
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 60A6B400B5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Aug 2024 20:53:46 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5a10bb7bcd0so5941709a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 12 Aug 2024 13:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723496024; x=1724100824; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xc20NfdFlq6bqhOz2Wh8VDZxca5ONeyHpZNq0C9p95A=;
        b=NIXD11qO0YmdmL8hlk64NR8vUGgWxNlaYJ/kIOmUm2iSZeCi5ch1EI1I3IgsjTrOS3
         lPS3mjBbAZ1WTJGysjuWF5R7ssxnw4vXtwxJNCZU30fHogPsJXjSZjOfgT0Mw2uNk/rD
         MaMmrUPmBxO82fODNbVrNp+yWSn8TX9wOTSC6QUXHibK1r/wBqU4DbXXcIg0c+pxlXQx
         qoe4MASxuipKPQkhSY4iOrISh4y4fnygCmDrNEKmfqOAPjhkkKp7xAlDNQbs6+wUFIJT
         PNe8rmS3G3Z52xnaOHTiUFFXFdBF3C7hMXcQ1jgR/ypLud6NoIpdyHpcT6KR7+yhvPmc
         hKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723496024; x=1724100824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xc20NfdFlq6bqhOz2Wh8VDZxca5ONeyHpZNq0C9p95A=;
        b=atnHNnpstAAAMX8cvSCrElpbCBMqV+utuu52mD1tRGwyZNw4S10C5SZRN9lIzVLm5+
         UZhqQ0RURN2lKksmOlSc2+vQyyeKwCi5O1MJdTEjWPyy1Y1W9BcLvbL42LbBUtZ0TeNf
         Dz33+6/5pLisOaRJHFwqIIZ7czO3IxJLnsvuC4+tj9q7bau4fj4xGSsW/gN9NQf8U7m5
         GyK+IBEshW37Tvx6l00YI6WcN2ZKWwKIpBS+EncUIItB3Tfk1gph72SlBX0RQotwLCVx
         QwRPoDu4FLfFgeZL6yZxregO2y9boN3DeogndhE4v0RZ9ha4hDkIb2yHR4w1F+GNpQP9
         1a9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTXqRqRjB4Zdk22LuHoS74aODPGLeuyaw5dSydAbytUwwOikxyYrNhMHD47HuefzoQuZ4/xAUKpNWZZD0U2aTsD2BEpB+4UKDdawMTWIf1hPXW1NLPOOC9izt9Tru5
X-Gm-Message-State: AOJu0YyDgtzSZXleQDurZGPyu1k+EbwvaEbfABsOgRxz6R5iBXMjyjOm
	qZW8cUtB0ncHK/LGMr66THwXZjiFP10BRP3aRCSbmSmaclkDttI6Ud62RmWuvK2Is5OkRN9xGDt
	5vL6shwG/08gizan7Y267YTN35/Q=
X-Google-Smtp-Source: AGHT+IGIzVpRORph76EGbVMuKVT3HaVuo7vUHWBdMMlldf1tL015EPPE36beOXTCXagdLphR4SjlQr2OGTksELNAmuw=
X-Received: by 2002:a05:6402:3552:b0:578:60a6:7c69 with SMTP id
 4fb4d7f45d1cf-5bd44c69222mr1030039a12.30.1723496024291; Mon, 12 Aug 2024
 13:53:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240730201315.19917-1-sergio.collado@gmail.com> <2024081227-habitat-cough-dfb0@gregkh>
In-Reply-To: <2024081227-habitat-cough-dfb0@gregkh>
From: =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
Date: Mon, 12 Aug 2024 22:53:08 +0200
Message-ID: <CAA76j92rfaj56SGii5Gd+MX1jScjgRPDTz7+NmobcWifE_fONA@mail.gmail.com>
Subject: Re: [PATCH 6.1.y] jfs: define xtree root and page independently
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	Dave Kleikamp <dave.kleikamp@oracle.com>, Manas Ghandat <ghandatmanas@gmail.com>, 
	syzbot+6b1d79dad6cc6b3eef41@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for pointing that out.
I will review this, and send it to all relevant branches.

On Mon, 12 Aug 2024 at 16:37, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 30, 2024 at 10:13:15PM +0200, Sergio Gonz=C3=A1lez Collado wr=
ote:
> > From: Dave Kleikamp <dave.kleikamp@oracle.com>
> >
> > [ Upstream commit a779ed754e52d582b8c0e17959df063108bd0656 ]
> >
> > In order to make array bounds checking sane, provide a separate
> > definition of the in-inode xtree root and the external xtree page.
> >
> > Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>
> > Tested-by: Manas Ghandat <ghandatmanas@gmail.com>
> > (cherry picked from commit a779ed754e52d582b8c0e17959df063108bd0656)
> > Signed-off-by: Sergio Gonz=C3=A1lez Collado <sergio.collado@gmail.com>
> > Reported-by: syzbot+6b1d79dad6cc6b3eef41@syzkaller.appspotmail.com
> > ---
>
> What about 6.6.y?  We can't take commits only to older kernels, that
> would mean you would have a regression.
>
> Please resubmit for all relevant branches.
>
> greg k-h
