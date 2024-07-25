Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E739C19AD81
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 15:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721922379; cv=none; b=Jo22M7pGKKuMKBqZud75eUKRFRJViy4TLJR0938ihI6eTCc74XMQO+Ai+MHLdhdzlRoya/S4Gtw37BOSHMx6KA0SV+faEpje95eJTYbz8j5DmcSfEZ0RXNDDALwTpB0MXDQHVfeM2XugXrfTt4XIA8VJll2bQDtrSUlSm9R/XQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721922379; c=relaxed/simple;
	bh=D36HI3O21wtOwQWIMqdPjztnICuCP4ggoiyI4oeov3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=St+3fagr0xsWTEH9PAWaO0kLhrq+ugTZdw3fcXlG2ZC+5bEAC2RLW6MvC3KOzYFsQ/AqyN8wSCwy20TS68FeY2ox/IXMdf1SlbVi05P6cn2zGksFoz2t9dH+w8BlOoiudJDav23Tb3TKcAmZTqecQrzP/tvVSNRp95roQTI0QqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjHtIitD; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjHtIitD"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83C1A4038E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 15:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rGOdMBGCmwXx for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 25 Jul 2024 15:46:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=sergio.collado@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6845140175
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6845140175
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VjHtIitD
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6845140175
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 15:46:16 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5a3b866ebc9so1137227a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 25 Jul 2024 08:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721922374; x=1722527174; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D36HI3O21wtOwQWIMqdPjztnICuCP4ggoiyI4oeov3k=;
        b=VjHtIitDWJn6e8Ma3MKDGzRn1Ek29kKL0YU0mjuHbe1KynazS2TKTl2AgumhzR0Doq
         FJRPzp4Mg16p+4gYWLKlQwcUSbyWFK93guATVdbIkSXBroyiQ9OLyvUI7My2hXPybxXY
         lb7H109pd0QorNdbc/hEneowWMplK5SGQ8WVlS0lfH5a62NxAnC/nvbBQSIXhIGgKuem
         OVMD3u6J4dYggPzy020KgnPtRhqNAae4PXJwcceh9cTc3pLQqM6K98wy+nXZVcxRYZ9N
         FZzYFX8uZjXhvuxHnbG/iRZw8Gj0LyGkzFcwDuQ2olNI9tZFYsEGnuey/OFzDUS9TuMn
         FEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721922374; x=1722527174;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D36HI3O21wtOwQWIMqdPjztnICuCP4ggoiyI4oeov3k=;
        b=ipIB3TH2lmWi9y/eIQNA1hPWVP5jenp6RLTOBt6d/j0ioGwbmZuAF1zGyJ09yG5rmo
         I8lzGgcoLPUzDQoIl3nRk+Ihiia5ymBIPPSHfE/AZZ4wDGx5t7Ymc5LxDgJZdNWo9hR6
         MnbuMNBVRvv7ZAiQW5O9DMNi/e2aySxEXVQxxKPUmKiNgOs0Pgu3+X5zn9JOzupGYMho
         9dFayOc4QZrd30IEHHe/LG04Z3IPjm53NxcDQCtslRBJzjPess8RqQMyv1m9Ue1whZ3/
         AqdgKvhfmnhMRtNa4TWMb6BxQE3c1N4TTN98cXKkFKgfxRenMS5dpwAzERrl2tq98EYG
         9roA==
X-Forwarded-Encrypted: i=1; AJvYcCW0sJtxRitWX+5mCKpDSr9V77xuPyRQS5nfTTNoOhcx/FZ28l3jOhejaKQurgCdBh5FTSMllclse4N7MabMJBezg36k1TYe1DFq1mJC3BPhtMNfHYCqhWFFykflXy2E
X-Gm-Message-State: AOJu0Ywz0VkmTt+5gcygKiQaCOW0oG30r6wd1Zj0sDz1Wdsjkf6Xh2n2
	oeXfDIW4U+fB3Dpg+o8rk2/S+D0UHCq1CexSTnlkf2FlzVEjJLAFZ6RAuik+J7Tza9zLJZvuLLw
	Xl1lSDhhw5C58buW44Ti0rKaPd8U=
X-Google-Smtp-Source: AGHT+IG+LgLdvCyVBbSIpIe5ThMyhIQ20Tx1i9XzyAS1qhVrieoXrVtF/ffhw2IfLVtxCGQYY/xlQPozaekz21AZxSs=
X-Received: by 2002:a50:d65d:0:b0:5a7:464a:abd with SMTP id
 4fb4d7f45d1cf-5ac63c50fc9mr1829238a12.30.1721922374047; Thu, 25 Jul 2024
 08:46:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240725135313.155137-1-sergio.collado@gmail.com> <2024072521-ducky-record-3b13@gregkh>
In-Reply-To: <2024072521-ducky-record-3b13@gregkh>
From: =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
Date: Thu, 25 Jul 2024 17:45:38 +0200
Message-ID: <CAA76j93yfR7Z=g+uEk4OV6N3FqXS5XUXUw9DOKLbJ-yBP1MHVw@mail.gmail.com>
Subject: Re: [PATCH 6.1.y] udf: Convert udf_mkdir() to new directory iteration code
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	Jan Kara <jack@suse.cz>, syzbot+600a32676df180ebc4af@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

 Thanks for your feedback. Honestly it was a clean cherry-pick. I'm
not aware I have changed anything ... but I can be mistaken.
 I checked with the original commit, and the changes seem the same to
me, although the changes are not in the same line numbers.
 Is that change in the line numbers what you mean?

Thanks!

On Thu, 25 Jul 2024 at 16:21, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Jul 25, 2024 at 03:53:13PM +0200, Sergio Gonz=C3=A1lez Collado wr=
ote:
> > From: Jan Kara <jack@suse.cz>
> >
> > [ Upstream commit 00bce6f792caccefa73daeaf9bde82d24d50037f ]
> >
> > Convert udf_mkdir() to new directory iteration code.
> >
> > Signed-off-by: Jan Kara <jack@suse.cz>
> > (cherry picked from commit 00bce6f792caccefa73daeaf9bde82d24d50037f)
> > Signed-off-by: Sergio Gonz=C3=A1lez Collado <sergio.collado@gmail.com>
>
> You changed things in this commit and didn't say what or why you did so
> :(
>
